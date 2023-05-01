import 'package:cafemenu_app/ui/pages/user/diningcart_page/page_diningcart.dart';
import 'package:cafemenu_app/ui/pages/user/diningcart_page/widgets/diningcart_button.dart';
import 'package:cafemenu_app/utils/constants/enums.dart';
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
        icon: const Icon(Icons.arrow_back),
      ),
      title: const Text("Shop Name"),
      actions: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: ElevatedButton.icon(
            onPressed: () {
              /// diningCartButtonNotifier value to null for change button text to Take Now,
              /// and button functionality for filter diningcartList if press button.
              /// diningCartButtonNotifier cannot change to null if already ordered with diningCartList items,
              if (![
                DiningCartButtonFunctionality.takeNow,
                DiningCartButtonFunctionality.orderConfirm,
              ].contains(DiningCartButton.diningCartButtonNotifier.value)) {
                DiningCartButton.diningCartButtonNotifier.value = null;
                DiningCartButton.diningCartButtonNotifier.notifyListeners();
              }
              // goto dining cart page button pressed
              /// page Navigate to PageDiningCart by pushReplacement.
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const PageDiningCart(),
                ),
              );
            },
            label: const Text("Dining Cart"),
            icon: const Icon(Icons.dining),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red[700]),
            ),
          ),
        )
      ],
    );
  }
}
