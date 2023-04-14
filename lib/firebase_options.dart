// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyD7oaZqrX15rinXw_SWDlrDk8oGeQ3bDCI',
    appId: '1:288985359912:web:8dac014245cb31e862f71d',
    messagingSenderId: '288985359912',
    projectId: 'cafemenu-5ff22',
    authDomain: 'cafemenu-5ff22.firebaseapp.com',
    storageBucket: 'cafemenu-5ff22.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA1K9QkNk2yuuE5NPt1Tn4E0rFj7St0mzQ',
    appId: '1:288985359912:android:04e854c90402b17062f71d',
    messagingSenderId: '288985359912',
    projectId: 'cafemenu-5ff22',
    storageBucket: 'cafemenu-5ff22.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAPpPlh4l79bo8TG6Ee5DNSsPmeWCh4RKk',
    appId: '1:288985359912:ios:a22dd0cbf496f89b62f71d',
    messagingSenderId: '288985359912',
    projectId: 'cafemenu-5ff22',
    storageBucket: 'cafemenu-5ff22.appspot.com',
    iosClientId: '288985359912-u4q9c1b1v5fo6uhhimnqec4rdnrd2cvh.apps.googleusercontent.com',
    iosBundleId: 'com.example.cafemenuApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAPpPlh4l79bo8TG6Ee5DNSsPmeWCh4RKk',
    appId: '1:288985359912:ios:a22dd0cbf496f89b62f71d',
    messagingSenderId: '288985359912',
    projectId: 'cafemenu-5ff22',
    storageBucket: 'cafemenu-5ff22.appspot.com',
    iosClientId: '288985359912-u4q9c1b1v5fo6uhhimnqec4rdnrd2cvh.apps.googleusercontent.com',
    iosBundleId: 'com.example.cafemenuApp',
  );
}
