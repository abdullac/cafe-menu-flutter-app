import 'package:cafemenu_app/ui/pages/diningcart_page/page_diningcart.dart';
import 'package:cafemenu_app/ui/pages/diningcart_page/widgets/diningcart_button.dart';
import 'package:cafemenu_app/utils/constants/lists.dart';
import 'package:flutter/material.dart';

class MenuCardPageAppBar extends StatelessWidget {
  const MenuCardPageAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            // appBar back button
            /// go back to previos Page
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back)),
      title: const Text("Shop Name"),
      actions: [
        IconButton(
            onPressed: () {
              // goto dining cart page button pressed
              /// page Navigate to PageDiningCart by pushReplacement with diningCartList.
              /// diningCartList is List of selected ProductModel from initialProductModelList

              DiningCartButton.diningCartButtonNotifier.value = null;
              DiningCartButton.diningCartButtonNotifier.notifyListeners();
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const PageDiningCart(
                      // diningCartList: diningCartList,
                      )));
            },
            icon: const Icon(Icons.dining))
      ],
    );
  }
}
