import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/ui/pages/user/diningcart_page/sections/total_items_qty_amount.dart';
import 'package:cafemenu_app/ui/pages/user/diningcart_page/widgets/diningcart_button.dart';
import 'package:cafemenu_app/utils/constants/lists.dart';
import 'package:flutter/material.dart';

///diningCartPage setQty inrease/decrease button pressed additional function
additionalIncreaseOrDecreaseButtonPressed(
    {required ValueNotifier<bool?> isSelectNotifier}) {
  changeDiningCartTotal();
  if (isSelectNotifier.value == false) {
    isSelectNotifier.value = true;
  }
}

/// change diningCaart totel when inrease/decrease button pressed
changeDiningCartTotal() {
  TotalItemQtyAmount.diningCartTotalNotifier.value = findTotalItemsQtyAmount();
  TotalItemQtyAmount.diningCartTotalNotifier.notifyListeners();
  DiningCartButton.diningCartButtonNotifier.value = null;
  DiningCartButton.diningCartButtonNotifier.notifyListeners();
}

/// findTotalItemsQtyAmount when change item ccount, isSelect, delete
Map<String, dynamic> findTotalItemsQtyAmount() {
  Map<String, dynamic> findTotalItemsQtyAmountTemp = {
    "items": 0,
    "Qty": 0,
    "amount": 0.0,
  };
  for (var element in diningCartList) {
    findTotalItemsQtyAmountTemp["items"] += findTotalItems(element);
    findTotalItemsQtyAmountTemp["Qty"] += findTotalOrderedQty(element);
    findTotalItemsQtyAmountTemp["amount"] += findTotalAmount(element);
  }

  return findTotalItemsQtyAmountTemp;
}

/// find total items count
int findTotalItems(AvailableItemModel element) {
  if ([null, 0].contains(element.orderedQty) ||
      element.isSelectDiningCart == false) {
    return 0;
  } else {
    return 1;
  }
}

///find total ordered Qty
int findTotalOrderedQty(AvailableItemModel element) {
  if ([null, 0].contains(element.orderedQty) ||
      element.isSelectDiningCart == false) {
    return 0;
  } else {
    return element.orderedQty!;
  }
}

/// find total amount
double findTotalAmount(AvailableItemModel element) {
  if ([null, 0].contains(element.orderedQty) ||
      element.isSelectDiningCart == false) {
    return 0;
  } else {
    if ([null, 0].contains(element.itemPrice)) {
      return 0;
    } else {
      return element.orderedQty!.toDouble() * element.itemPrice!;
    }
  }
}
