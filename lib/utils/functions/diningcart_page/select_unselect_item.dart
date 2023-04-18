import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/utils/constants/lists.dart';
import 'package:cafemenu_app/utils/functions/diningcart_page/find_total_itemsqtyamount.dart';
import 'package:flutter/material.dart';


selectOrUnselectItem(
    {required ProductModel productModel,
    required bool? isSelect,
    required ValueNotifier<bool?> isSelectNotifier}) {
      

  ProductModel productModelTemp =
      productModel.copyWith(isSelectDiningCart: isSelect);

  int? elementPosition;
  for (var element in diningCartList) {
    if (element.itemName == productModelTemp.itemName) {
      elementPosition = diningCartList.indexOf(element);
      break;
    }
  }
  if (elementPosition != null) {
    diningCartList[elementPosition] = productModelTemp;
  } else {
    diningCartList.add(productModelTemp);
  }

  if (isSelect != null) {
    isSelectNotifier.value = isSelect;
    isSelectNotifier.notifyListeners();
  }
  changeDiningCartTotal();
}
