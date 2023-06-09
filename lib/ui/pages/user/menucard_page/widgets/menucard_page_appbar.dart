import 'package:cafemenu_app/ui/pages/user/diningcart_page/page_diningcart.dart';
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
          /// menucardPage to diningcartPage button (appBar button)
          child: ElevatedButton.icon(
            onPressed: () {
              // goto dining cart page button pressed
              /// page Navigate to PageDiningCart by pushReplacement.
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const PageDiningCart(),
                ),
              );
            },
            label: const Text("Take Now"),
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
