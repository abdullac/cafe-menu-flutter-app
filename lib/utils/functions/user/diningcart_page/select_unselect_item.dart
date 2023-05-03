import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/utils/constants/lists.dart';
import 'package:cafemenu_app/utils/functions/user/diningcart_page/find_total_itemsqtyamount.dart';
import 'package:flutter/material.dart';

/// method for select or unselect item from diningCartList when tap select checkBox
selectOrUnselectItem(
    {required AvailableItemModel diningCartItem,
    required bool? isSelect,
    required ValueNotifier<bool?> isSelectNotifier}) {
      /// modify diningCart item after tap on select checkBox
  AvailableItemModel modifiedDiningCartItem =
      diningCartItem.copyWith(isSelectDiningCart: isSelect);

  /// get this item index from diningCartList
  int? elementPosition;
  for (var diningCartItem in diningCartList) {
    if (diningCartItem.itemId == modifiedDiningCartItem.itemId) {
      elementPosition = diningCartList.indexOf(diningCartItem);
      break;
    }
  }
  /// update or add this modified item to diningCartList.
  if (elementPosition != null) {
    diningCartList[elementPosition] = modifiedDiningCartItem;
  } else {
    diningCartList.add(modifiedDiningCartItem);
  }
  /// notify select checkBox notifier for change checkbox ui
  if (isSelect != null) {
    isSelectNotifier.value = isSelect;
    isSelectNotifier.notifyListeners();
  }
  /// change total items,qty,amount after diningCart List hanged 
  changeDiningCartTotal();
}
