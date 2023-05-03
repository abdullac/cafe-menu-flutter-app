import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/utils/constants/lists.dart';

///  UNUSED

/// this method for remove ProductModel from dininCartList
/// when that productModel Qty count is 0 while derease button/deletebutton pressed
void removeItemAtQty0FromDiningCartList(int newValue, AvailableItemModel productModel) {
  if (newValue == 1 || newValue == 0) {
    int? elementPosition;
    /// itrate diningCartList for find position of that Productmodel
    /// and remove productmodel from diningCartList if gets(contains) elementPosition
    for (var element in diningCartList) {
      if (element.itemId == productModel.itemId) {
        elementPosition = diningCartList.indexOf(element);
        break;
      }
    }  
    if (elementPosition != null) {
      diningCartList.removeAt(elementPosition);
    }
  }
}
