import 'package:cafemenu_app/ui/pages/home_page/page_home.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'firebase_options.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
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
      key: navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        textTheme:  GoogleFonts.pacificoTextTheme(Theme.of(context).textTheme),
      ),
      home: const Scaffold(
        body: PageHome(),
      ),
    );
  }
}


        // body: PageHome(),
        // body: PageAddItem(),
        // body: PageGetOrderitem(),
        // body: PageOrderListPageView(),
        // body: PageAdminSignupOrSignin(),

        ///  -  handwriting style
        /// sacramentoTextTheme 
        /// pacificoTextTheme