import 'package:cafemenu_app/ui/pages/home_page/page_home.dart';
import 'package:cafemenu_app/ui/pages/user/menucard_page/page_menucard.dart';
import 'package:flutter/material.dart';

/// this is Elevated button widget for go to menucardPage

class MenuCardButton extends StatelessWidget {
  const MenuCardButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 100),

        /// this button works tow types.
        /// 1- on pressed for goto MenuCard  page
        /// 2- on long pressed for go to AdminPage
        child: ElevatedButton(
          onPressed: () async {
            // MenuCard button pressed
            /// Navigator for go to PageMenuCard
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const PageMenuCard(),
              ),
            );
          },
          onLongPress: () {
            /// button long pressed
            /// isAdminButtonNotifier is a bool notifier for show/hide goto admin page button
            /// and notify with notifyListner.
            if (PageHome.isAdminButtonNotifier.value == false) {
              PageHome.isAdminButtonNotifier.value = true;
            } else {
              PageHome.isAdminButtonNotifier.value = false;
            }
            PageHome.isAdminButtonNotifier.notifyListeners();
          },
          child: const Text("Menu Card",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40),),
        ),
      ),
    );
  }
}
