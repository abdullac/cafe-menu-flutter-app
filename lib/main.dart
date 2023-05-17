import 'package:cafemenu_app/core/provider/bloc/admin/location_page/location_page_bloc.dart';
import 'package:cafemenu_app/core/provider/bloc/diningcart_page/diningcart_page_bloc.dart';
import 'package:cafemenu_app/core/provider/bloc/menucard_page/menucard_page_bloc.dart';
import 'package:cafemenu_app/ui/pages/home_page/page_home.dart';
import 'package:cafemenu_app/utils/functions/firebase_messaging.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

var scaffoldKey = GlobalKey<ScaffoldState>();

Future<void> main() async {
  /// this 'Cafe menu' appliaion start after firebase initialization
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Set the background messaging handler early on, as a named top-level function
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  requestPermission();
  await setupFlutterNotifications();

  /// start run app
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
        scrollBehavior: MyCustomScrollBehavior(),
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

/// make horizontal scrolling withmouse on web and desktop 
class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}
