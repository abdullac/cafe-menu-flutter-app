import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/utils/constants/enums.dart';
import 'package:cafemenu_app/utils/constants/lists.dart';
import 'package:cafemenu_app/utils/functions/show_snackbar.dart';
import 'package:flutter/material.dart';

/// this method for increase or decrease itemQty count
/// when pressed +/- button.
/// and update that availableItem to diningCartList
void changeSetQtyAndNotifyListener({
  required ChangeQty inreaseOrDecrease,
  required ValueNotifier<int?> valueNotifier,
  required int newQtyValue,
  required ProductModel availableItem,
  bool? removeitemAtQty0,
}) {
  /// gets urrent value from valueNotifier
  /// and set value to valueNotifier aftr pressed +/- button
  /// and Notify valueNotifier
  valueNotifier.value = inreaseOrDecrease == ChangeQty.increase
      ? newQtyValue + 1
      : newQtyValue - 1;
  valueNotifier.notifyListeners();

  /// update itemQty count to availableItem using copywith
  ProductModel availableItemModified =
      availableItem.copyWith(orderedQty: valueNotifier.value);

  /// int diningCartPosition for gets current position of that availableItem from diningCartList. temporary usage
  /// iterate diningCartList for find current position of that availableItem position.
  int? diningCartPosition;
  for (var diningCartItem in diningCartList) {
    if (diningCartItem.itemId == availableItem.itemId) {
      diningCartPosition = diningCartList.indexOf(diningCartItem);
      break;
    }
  }

  /// upadate availableItem to that position of diningCartList if diningCartPosition contains any value
  /// add new data to diningCartList as availableItem if diningCartPosition is null

  /// remove availableItem from diningCardList
  /// when setQty reach to count 0.

  if (valueNotifier.value != 0) {
    addOrUpdateItemDiningCartList(diningCartPosition, availableItemModified);
  } else {
    if (removeitemAtQty0 == true) {
      if (diningCartPosition != null) {
        diningCartList.removeAt(diningCartPosition);
        showSnackBar("${availableItem.itemName} removed");
      } else {
        showSnackBar("cannot remove ${availableItem.itemName}");
      }
    } else {
      addOrUpdateItemDiningCartList(diningCartPosition, availableItemModified);
    }
  }
}

void addOrUpdateItemDiningCartList(
    int? diningCartPosition, ProductModel availableItemModified) {
  if (diningCartPosition != null) {
    diningCartList[diningCartPosition] = availableItemModified;
  } else {
    diningCartList.add(availableItemModified);
  }
}
