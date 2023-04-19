import 'package:cafemenu_app/admin/ui/add_item_page/page_add_item.dart';
import 'package:cafemenu_app/admin/ui/get_orderitem_page/page_get_orderitem.dart';
import 'package:cafemenu_app/admin/ui/order_list_page/page_order_list.dart';
import 'package:cafemenu_app/ui/pages/home_page/page_home.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        // body: PageHome(),
        // body: PageAddItem(),
        // body: PageGetOrderitem(),
        body: PageOrderPageView(),
      ),
    );
  }
}
