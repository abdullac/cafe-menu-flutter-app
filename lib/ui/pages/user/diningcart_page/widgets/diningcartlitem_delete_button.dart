import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/ui/pages/user/diningcart_page/page_diningcart.dart';
import 'package:cafemenu_app/utils/constants/lists.dart';
import 'package:cafemenu_app/utils/functions/diningcart_page/deleteitem_from_diningcartlist.dart';
import 'package:flutter/material.dart';

/// this widget for delete item from diningCartList
class DiningcartListItemDeleteButton extends StatelessWidget {
  const DiningcartListItemDeleteButton({
    super.key,
    required this.diningCartItem,
  });

  final ProductModel diningCartItem;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // cart item delete button pressed
        /// method for delete.
        /// and set diningCartList and notify diningCartListViewNotifier for 
        /// rebuild diningCartListView
        deleteItemFromDiningCartList(diningCartItem);
        PageDiningCart.diningCartListViewNotifier.value = diningCartList;
        PageDiningCart.diningCartListViewNotifier.notifyListeners();
      },
      child: Icon(
        Icons.delete,
        color: Colors.red.withOpacity(0.7),
      ),
    );
  }
}
