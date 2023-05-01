import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/ui/pages/user/diningcart_page/page_diningcart.dart';
import 'package:cafemenu_app/ui/pages/user/menucard_page/page_menucard.dart';
import 'package:cafemenu_app/utils/constants/enums.dart';
import 'package:cafemenu_app/utils/functions/diningcart_page/deleteitem_from_diningcartlist.dart';
import 'package:flutter/material.dart';

/// this is appBar of PageItem widget
class ItemPageAppBar extends StatelessWidget {
  const ItemPageAppBar({
    super.key,
    required this.comingPage,
    required this.availableItem,
  });

  final ComingPage comingPage;
  final ProductModel availableItem;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          // appBar back button pressed
          /// go back to where comes from if press back button.
          /// go back to menuCardPage if comes from menuCardPage
          if (comingPage == ComingPage.menuCard) {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const PageMenuCard()));

            /// go back to diningCartPage if comes from diningCartPage
          } else if (comingPage == ComingPage.diningCart) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const PageDiningCart()));
          }
        },
        icon: const Icon(Icons.arrow_back),
      ),

      /// appBar title - item Name
      title: Text(comingPage == ComingPage.menuCard
          ? availableItem.itemName ?? "Available Item"
          : availableItem.itemName ?? "Your Cart Item"),

      /// appBar action buttons - show delete button if comes from diningCartPage
      /// otherwise hide.
      actions: comingPage == ComingPage.menuCard
          ? []
          : [
              IconButton(
                onPressed: () {
                  // appBar item delete/cart button
                  if (comingPage == ComingPage.diningCart) {
                    /// method for delete item from diningCartList.
                    deleteItemFromDiningCartList(availableItem);

                    /// go back to diningCart page after delete.
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const PageDiningCart()));
                  }
                },
                icon: const Icon(Icons.delete),
              ),
            ],
    );
  }
}
