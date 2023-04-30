import 'package:cafemenu_app/ui/pages/home_page/page_home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'firebase_options.dart';

var scaffoldKey = GlobalKey<ScaffoldState>();

Future<void> main() async {
  /// this 'Cafe menu' appliaion start after firebase initialization
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}
