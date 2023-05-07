import 'package:cafemenu_app/core/model/available_item/available_item_model.dart';
import 'package:cafemenu_app/utils/constants/lists.dart';

/// method for select or unselect item from diningCartList when tap select checkBox
selectOrUnselectItem({
  required AvailableItemModel diningCartItem,
  required bool? isSelect,
}) {
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
}
