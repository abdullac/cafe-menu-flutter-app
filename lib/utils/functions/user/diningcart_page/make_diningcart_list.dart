
import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/utils/constants/lists.dart';

void makeDiningCartListByStreamBuilder(
    List<AvailableItemModel> listOfAvailableItems) {
  /// listOfAvailableItems looping with diningCartList nested looping for get each available item and diningCart Item,
  /// and match both using their itemIds for get any updates from available item of same diningCart item,
  /// modify orderedQty and infoToCustomer of diningCart item if available Qty of availableItem lessthan ordered Qty of diningCart item.
  for (var availableItem in listOfAvailableItems) {
    for (var diningCartItem in diningCartList) {
      if (diningCartItem.itemId == availableItem.itemId) {
        if (![diningCartItem.orderedQty, availableItem.availableQty]
                .contains(null) &&
            diningCartItem.orderedQty! > availableItem.availableQty!) {
          /// get index(position) of this item from diningCartList
          int indexTemp = diningCartList.indexOf(diningCartItem);

          /// modify diningCartItem using copyWith
          AvailableItemModel diningCartItemTemp = diningCartItem.copyWith(
              orderedQty: availableItem.availableQty!,
              infoToCustomer:
                  "Sorry, only ${availableItem.availableQty!} Qty available.");

          /// update diningCartItem using their index(position) to diningCartList
          diningCartList[indexTemp] = diningCartItemTemp;

          /// if defualtly / available Qty of availableItem graterThan or equal ordered Qty of diningCart item.
          /// modify infoToCustomer of diningCart item.
        } else if (![diningCartItem.orderedQty, availableItem.availableQty]
                .contains(null) &&
            diningCartItem.orderedQty! <= availableItem.availableQty!) {
          /// get index(position) of this item from diningCartList
          int indexTemp = diningCartList.indexOf(diningCartItem);

          /// modify diningCartItem using copyWith
          AvailableItemModel diningCartItemTemp = diningCartItem.copyWith(
              infoToCustomer: "${availableItem.availableQty!} Qty available.");

          /// update diningCartItem using their index(position) to diningCartList
          diningCartList[indexTemp] = diningCartItemTemp;
        }
      }
    }
  }
}