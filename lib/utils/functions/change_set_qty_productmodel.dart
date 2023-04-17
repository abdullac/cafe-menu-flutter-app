import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/utils/constants/enums.dart';
import 'package:cafemenu_app/utils/constants/lists.dart';
import 'package:flutter/material.dart';


/// this method for increase or decrease itemQty count
/// when pressed +/- button.
/// and update that ProductModel to diningCartList
void changeSetQtyAndNotifyListener({
  required ChangeQty inreaseOrDecrease,
  required ValueNotifier<int?> valueNotifier,
  required int newValue,
  required ProductModel productModel,
}) {
  /// gets urrent value from valueNotifier
  /// and set value to valueNotifier aftr pressed +/- button
  /// and Notify valueNotifier
  valueNotifier.value =
      inreaseOrDecrease == ChangeQty.increase ? newValue + 1 : newValue - 1;
  valueNotifier.notifyListeners();
  /// update itemQty count to ProdutModel using copywith
  ProductModel productModelModified =
      productModel.copyWith(orderedQty: valueNotifier.value);
  /// int elementPosition for gets current position of that ProdutModel from diningCartList. temporary usage
  /// iterate diningCartList for find current position of that ProdutModel position.
  int? elementPosition;
  for (var element in diningCartList) {
    if (element.itemName == productModel.itemName) {
      elementPosition = diningCartList.indexOf(element);
      break;
    }
  }
  /// upadate ProductModel to that position of diningCartList if elementPosition contains any value
  /// add new data to diningCartList as productModel if elementPosition is null
  if (elementPosition != null) {
    diningCartList[elementPosition] = productModelModified;
  } else {
    diningCartList.add(productModelModified);
  }
}
