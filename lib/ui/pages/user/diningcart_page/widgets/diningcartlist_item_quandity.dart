import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/ui/pages/user/diningcart_page/page_diningcart.dart';
import 'package:cafemenu_app/utils/functions/user/diningcart_page/find_total_itemsqtyamount.dart';
import 'package:cafemenu_app/ui/shared/widgets/set_qty_section.dart';
import 'package:flutter/material.dart';

/// this widget is show and set item quantity
class DiningcartListItemQty extends StatelessWidget {
  const DiningcartListItemQty({
    super.key,
    required this.diningCartItem,
    required this.setQtyNotifier,
    required this.isSelectNotifier,
  });

  /// for update diningCartItem when press increase or decrease button
  final AvailableItemModel diningCartItem;

  /// for change Qty value/text
  final ValueNotifier<int?> setQtyNotifier;

  /// for unSelect or selsect automatically when decrease to 0 or increase from 0.
  final ValueNotifier<bool?> isSelectNotifier;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// show and set item quantity widget
          SetQtySetion(
            valueNotifier: setQtyNotifier,
            availableItem: diningCartItem,
            removeitemAtQty0: false,
            onIncreasePressed: () {
              /// additional method for onIncreaseButton pressed.
              additionalIncreaseOrDecreaseButtonPressed(
                  isSelectNotifier: isSelectNotifier);
              PageDiningCart.diningCartListViewNotifier.notifyListeners();
            },
            onDecreasePressed: () {
              /// additional method for onDecreaseButton pressed.
              additionalIncreaseOrDecreaseButtonPressed(
                  isSelectNotifier: isSelectNotifier);
              PageDiningCart.diningCartListViewNotifier.notifyListeners();
            },
          ),
        ],
      ),
    );
  }
}
