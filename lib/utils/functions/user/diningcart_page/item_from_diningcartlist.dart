import 'package:cafemenu_app/core/model/available_item/available_item_model.dart';
import 'package:cafemenu_app/utils/constants/lists.dart';

AvailableItemModel? pickAvailableItemFromDiningCartList(int? itemId) {
  int? diningCartPosition;
  for (var diningCartItem in diningCartList) {
    if (diningCartItem.itemId == itemId) {
      diningCartPosition = diningCartList.indexOf(diningCartItem);
      break;
    }
  }
  if (diningCartPosition != null) {
    return diningCartList[diningCartPosition];
  }
  return null;
}
