import 'dart:convert';
import 'dart:developer';
import 'dart:math' as math;

import 'package:cafemenu_app/core/provider/bloc/admin/location_page/location_page_bloc.dart';
import 'package:cafemenu_app/core/provider/bloc/diningcart_page/diningcart_page_bloc.dart';
import 'package:cafemenu_app/core/provider/bloc/menucard_page/menucard_page_bloc.dart';
import 'package:cafemenu_app/core/services/firebase/firebase_refs.dart';
import 'package:cafemenu_app/ui/pages/home_page/page_home.dart';
import 'package:cafemenu_app/utils/functions/show_snackbar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_fonts/google_fonts.dart';
import 'firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

// String? fcmTokenA;

List<String> snapshotTokenKeys = [];
List<String> snapshotTokenValues = [];

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  // await setupFlutterNotifications();
  // showFlutterNotification(message);
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  log('Handling a background message ${message.messageId}');
}

/// Create a AndroidNotificationChannel for heads up notifications
late AndroidNotificationChannel channel;

/// Initialize the FlutterLocalNotificationsPlugin package.
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

bool isFlutterLocalNotificationsInitialized = false;

Future<void> setupFlutterNotifications() async {
  if (!kIsWeb) {
    if (isFlutterLocalNotificationsInitialized) {
      return;
    }
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description:
          'This channel is used for important notifications.', // description
      importance: Importance.high,
      enableVibration: true,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    /// Create an Android Notification Channel.
    ///
    /// We use this channel in the `AndroidManifest.xml` file to override the
    /// default FCM channel to enable heads up notifications.
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    /// Update the iOS foreground notification presentation options to allow
    /// heads up notifications.
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    isFlutterLocalNotificationsInitialized = true;
  }
}

void showFlutterNotification(RemoteMessage message) {
  RemoteNotification? notification = message.notification;
  AndroidNotification? android = message.notification?.android;
  if (notification != null && android != null && !kIsWeb) {
    flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          // TODO add a proper drawable resource to android, for now using
          //      one that already exists in example app.
          icon: 'launch_background',
        ),
      ),
    );
  }
}

Future listenFCM() async {
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    showFlutterNotification(message);
  });
}

Future<void> requestPermission() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    log("Granted Permission");
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    log("Granted Provisional Permission");
  } else {
    log("Declained Permission");
  }
}

Future getToken() async {
  await FirebaseMessaging.instance.getToken().then((fcmToken) {
    // fcmTokenA = fcmToken;
    if (fcmToken != null) {
      saveToken(fcmToken);
    }
  });
}

Future sendPushMessage(String fcmToken) async {
  try {
    await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization':
              'key=AAAAQ0jepig:APA91bGhc-diOSoYLlXt9raa3TYjmDmaW5tnSg8cIV6yrMRANtI9CtSCUXUBLaAKRaYSfGkZsqZbBN7Xc-excAsfbSsxlSDNd_5Ua5nQHfa0YgTqqT5HC8S8wBUJnKqtaxO7m1G39lVZ',
        },
        body: jsonEncode(<String, dynamic>{
          'notification': <String, dynamic>{
            'body': 'Open and view new order',
            'title': 'New Order',
          },
          'priority': 'high',
          'data': <String, dynamic>{
            'click_action': 'FLUTTER_NOTIFICATION_CLICK',
            'id': fcmToken,
            'status': 'done',
          },
          // 'to': '/topics/Admin'
          'to': fcmToken
        }));
    log("fcmToken $fcmToken");
  } catch (e) {
    log("sendPushMessage $e");
    showSnackBar("Cannot send Push Notification");
  }
}

Future getSavedTokensAndKeys() async {
  await FirebaseRefs.adminNotificationToken().get().then((value) {
    snapshotTokenKeys.clear();
    snapshotTokenValues.clear();
    for (var tokenSnapshot in value.children) {
      if (tokenSnapshot.key != null || tokenSnapshot.value != null) {
        snapshotTokenKeys.add(tokenSnapshot.key!);
        String token = jsonDecode(jsonEncode(tokenSnapshot.value));
        snapshotTokenValues.add(token);
      }
    }
  });
}

Future saveToken(String fcmToken) async {
  if (!snapshotTokenValues.contains(fcmToken)) {
    int randomNumber = 0;
    for (int index = 0; index < 1; index++) {
      if (snapshotTokenKeys.contains(randomNumber.toString())) {
        randomNumber = math.Random().nextInt(1000);
        index -= 1;
      } else {
        break;
      }
    }
    await FirebaseRefs.adminNotificationToken()
        .update({"$randomNumber": fcmToken});
  }
}

Future sendNotificationToAllAdmins() async {
  for (var fcmToken in snapshotTokenValues) {
    await sendPushMessage(fcmToken.toString());
  }
}

// {
// {
//   await getSavedTokensAndKeys();
//   await listenFCM();
//   await getToken();
//   sendNotificationToAllAdmins();
// }
// await sendPushMessage();
// await FirebaseMessaging.instance.subscribeToTopic("Admin");
// await FirebaseMessaging.instance.subscribeToTopic("$fcmTokenA");
// }

//////////////////////////////////////
var scaffoldKey = GlobalKey<ScaffoldState>();

Future<void> main() async {
  /// this 'Cafe menu' appliaion start after firebase initialization
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Set the background messaging handler early on, as a named top-level function
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  requestPermission();
  await setupFlutterNotifications();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        /// MenucardPageBloc
        BlocProvider<MenucardPageBloc>(
          create: (BuildContext context) => MenucardPageBloc(),
        ),

        /// MenucardPageBloc
        BlocProvider<DiningcartPageBloc>(
          create: (BuildContext context) => DiningcartPageBloc(),
        ),

        /// MenucardPageBloc
        BlocProvider<LocationPageBloc>(
          create: (BuildContext context) => LocationPageBloc(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.red,

          /// set deafualt textTheme in this application. google fonts
          textTheme: GoogleFonts.kalamTextTheme(Theme.of(context).textTheme),
        ),
        home: Scaffold(
          key: scaffoldKey,

          /// Home page widget. this widget is the first screen of 'Cafe menu' appliaion
          body: const PageHome(),
        ),
      ),
    );
  }
}
