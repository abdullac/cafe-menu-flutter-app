import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/ui/pages/diningcart_page/sections/total_items_qty_amount.dart';
import 'package:cafemenu_app/ui/pages/diningcart_page/widgets/diningcart_button.dart';
import 'package:cafemenu_app/ui/pages/diningcart_page/widgets/diningcart_item.dart';
import 'package:cafemenu_app/utils/constants/enums.dart';
import 'package:cafemenu_app/utils/constants/lists.dart';
import 'package:flutter/material.dart';

additionalIncreaseOrDecreaseButtonPressed(
    {required ValueNotifier<bool?> isSelectNotifier}) {
  changeDiningCartTotal();
  if (isSelectNotifier.value == false) {
    isSelectNotifier.value = true;
  }
}

changeDiningCartTotal() {
  TotalItemQtyAmount.diningCartTotalNotifier.value = findTotalItemsQtyAmount();
  TotalItemQtyAmount.diningCartTotalNotifier.notifyListeners();
  DiningCartButton.diningCartButtonNotifier.value = null;
  DiningCartButton.diningCartButtonNotifier.notifyListeners();
}

Map<String, dynamic> findTotalItemsQtyAmount() {
  Map<String, dynamic> findTotalItemsQtyAmountTemp = {
    "items": 0,
    "Qty": 0,
    "amount": 0.0,
  };
  // findTotalItemsQtyAmountTemp["items"] = diningCartList.length;
  // print(
  //     "findTotalItemsQtyAmountTemp['items'] ${findTotalItemsQtyAmountTemp["items"]}");
  for (var element in diningCartList) {
    findTotalItemsQtyAmountTemp["items"] += findTotalItems(element);
    findTotalItemsQtyAmountTemp["Qty"] += findTotalOrderedQty(element);
    findTotalItemsQtyAmountTemp["amount"] += findTotalAmount(element);
  }

  print(findTotalItemsQtyAmountTemp["items"]);
  print(findTotalItemsQtyAmountTemp["Qty"]);
  print(findTotalItemsQtyAmountTemp["amount"]);
  return findTotalItemsQtyAmountTemp;
}

/// find total items count
int findTotalItems(ProductModel element) {
  if ([null, 0].contains(element.orderedQty) ||
      element.isSelectDiningCart == false) {
    return 0;
  } else {
    return 1;
  }
}

///find total ordered Qty
int findTotalOrderedQty(ProductModel element) {
  if ([null, 0].contains(element.orderedQty) ||
      element.isSelectDiningCart == false) {
    return 0;
  } else {
    return element.orderedQty!;
  }
}

/// find total amount
double findTotalAmount(ProductModel element) {
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

// if (element.orderedQty != null) {
//       findTotalItemsQtyAmountTemp["Qty"] += element.orderedQty!;
//       if (element.itemPrice != null) {
//         findTotalItemsQtyAmountTemp["amount"] +=
//             (element.orderedQty!).toDouble() * (element.itemPrice!);
//       }
//     }