import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/ui/shared/pages/item_page/widgets/background_image_container.dart';
import 'package:cafemenu_app/ui/shared/pages/item_page/widgets/itempage_appbar.dart';
import 'package:cafemenu_app/ui/shared/pages/item_page/widgets/itempage_categoryname_text.dart';
import 'package:cafemenu_app/ui/shared/pages/item_page/widgets/itempage_itemname_text.dart';
import 'package:cafemenu_app/ui/shared/pages/item_page/widgets/itempage_itemprice_text.dart';
import 'package:cafemenu_app/utils/constants/lists.dart';
import 'package:cafemenu_app/ui/shared/widgets/set_qty_section.dart';
import 'package:cafemenu_app/utils/constants/enums.dart';
import 'package:flutter/material.dart';

/// this widget is Page/screen for show selected(One) availableItem/diningCart item
class PageItem extends StatelessWidget {
  final ProductModel availableItem;
  /// comingPage is enum for identify coms from wich page/screen,
  /// for go back to previous page if press back button.
  final ComingPage comingPage;
  const PageItem({
    Key? key,
    required this.availableItem,
    required this.comingPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// notifier for notifier value assign to item quantity widget
    ValueNotifier<int?> setQtyNotifier = ValueNotifier(null);
    /// get latest Qty of this item from diningCartList.
    for (var diningCartItem in diningCartList) {
      if (diningCartItem.itemId == availableItem.itemId) {
        setQtyNotifier.value = diningCartItem.orderedQty;
      }
    }
    return Scaffold(
      /// appBar with backButton and ItemName.
      appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 60),
          child: ItemPageAppBar(
              comingPage: comingPage, availableItem: availableItem)),
      body: Stack(
        children: [
          /// image containers (nested Container).
          BackgroundAndForGroundImageContainer(availableItem: availableItem),
          /// Category name text.
          Align(
            alignment: Alignment.topCenter,
            child: CategoryNameText(availableItem: availableItem),
          ),
          /// item name text.
          Align(
            alignment: Alignment.topCenter,
            child: ItemNameText(availableItem: availableItem),
          ),
          /// item price text.
          Align(
            alignment: Alignment.bottomCenter,
            child: ItemPriceText(availableItem: availableItem),
          ),
          /// show and set Qty
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              /// show and set Quantity section.
              child: SetQtySetion(
                mainAxisAlignment: MainAxisAlignment.center,
                valueNotifier: setQtyNotifier,
                availableItem: availableItem,
                removeitemAtQty0: comingPage == ComingPage.menuCard
                    ? true
                    : comingPage == ComingPage.diningCart
                        ? false
                        : false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
