import 'package:cafemenu_app/admin/ui/add_item_page/page_add_item.dart';
import 'package:cafemenu_app/admin/ui/admin_login_page/page_admin_login.dart';
import 'package:cafemenu_app/admin/ui/order_list_page/page_order_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PageAdminHome extends StatelessWidget {
  PageAdminHome({Key? key}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    print("${user ?? 'userdata is null'}");
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
            onPressed: () async {
              // log out button pressed
              await logOut();
            },
            child: const Text("Log out"),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                // get all orders button pressed
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const PageOrderListPageView()));
              },
              child: const Text("Get All Orders List"),
            ),
            ElevatedButton(
              onPressed: () async {
                // Add Item Button pressed
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PageAddItem()));
              },
              child: const Text("Add Item"),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> logOut() async {
  await FirebaseAuth.instance.signOut();
  print("sign  out ....");
}
