import 'package:cafemenu_app/ui/pages/home_page/page_home.dart';
import 'package:cafemenu_app/ui/pages/menucard_page/page_menucard.dart';
import 'package:cafemenu_app/utils/constants/lists.dart';
import 'package:flutter/material.dart';

/// this is Elevated button widget for go to menucardPage

class MenuCardButton extends StatelessWidget {
  const MenuCardButton({
    super.key,
  });
  static ValueNotifier<bool> gotoMenuCardButtonNotifier = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ValueListenableBuilder(
          valueListenable: gotoMenuCardButtonNotifier,
          builder: (context, newValue, _) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: newValue == false
                  ? const Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : ElevatedButton(
                      onPressed: () async {
                        // MenuCard button pressed
                        /// Navigator with initialProductModelList,
                        /// initialProductModelList for show all product Items(list of 'productModel') from firebase realtime database
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PageMenuCard(
                                  productModelList: productModelList,
                                )));
                      },
                      onLongPress: () {
                        if (PageHome.isAdminButtonNotifier.value == false) {
                          PageHome.isAdminButtonNotifier.value = true;
                        } else {
                          PageHome.isAdminButtonNotifier.value = false;
                        }
                        PageHome.isAdminButtonNotifier.notifyListeners();
                      },
                      child: const Text("Menu Card"),
                    ),
            );
          }),
    );
  }
}
