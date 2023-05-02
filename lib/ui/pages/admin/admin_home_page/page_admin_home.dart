import 'package:cafemenu_app/ui/pages/admin/add_item_page/page_add_item.dart';
import 'package:cafemenu_app/ui/pages/admin/orders_page/page_orders.dart';
import 'package:cafemenu_app/ui/pages/admin/view_all_items_page/page_view_all_items.dart';
import 'package:cafemenu_app/utils/functions/admin/logout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

/// this wideget is hme page of admins side (logined admin).
class PageAdminHome extends StatelessWidget {
  PageAdminHome({Key? key}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
            onPressed: () async {
              // log out button pressed
              /// method for goto sinin page when logout button pressed.
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
                    builder: (context) => const PageOrdersPageView()));
              },
              child: const Text("Get All Orders List"),
            ),
            ElevatedButton(
              onPressed: () async {
                // Add Item Button pressed
                /// admin can add new availableItem.
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const PageAddOrEditItem()));
              },
              child: const Text("Add Item"),
            ),
            ElevatedButton(
              onPressed: () async {
                // view all Item Button pressed
                /// admin can see all available item and edit and delete each item. 
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const PageViewAllItems()));
              },
              child: const Text("View All Items"),
            ),
          ],
        ),
      ),
    );
  }
}

