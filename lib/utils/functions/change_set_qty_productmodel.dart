import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/utils/constants/enums.dart';
import 'package:cafemenu_app/utils/constants/lists.dart';
import 'package:flutter/material.dart';

void changeSetQtyAndNotifyListener({
  required ChangeQty inreaseOrDecrease,
  required ValueNotifier<int?> valueNotifier,
  required int newValue,
  required ProductModel productModel,
}) {
  valueNotifier.value =
      inreaseOrDecrease == ChangeQty.increase ? newValue + 1 : newValue - 1;
  valueNotifier.notifyListeners();
  ProductModel productModelModified =
      productModel.copyWith(orderedQty: valueNotifier.value);
  int? elementPosition;
  for (var element in diningCartList) {
    if (element.itemName == productModel.itemName) {
      elementPosition = diningCartList.indexOf(element);
      break;
    }
  }
  if (elementPosition != null) {
    diningCartList[elementPosition] = productModelModified;
  } else {
    diningCartList.add(productModelModified);
  }
}
