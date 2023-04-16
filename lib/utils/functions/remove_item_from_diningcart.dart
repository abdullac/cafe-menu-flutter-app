import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/utils/constants/lists.dart';

void qty0removeItemFromDiningCartList(int newValue, ProductModel productModel) {
  if (newValue == 1 || newValue == 0) {
    int? elementPosition;
    for (var element in diningCartList) {
      if (element.itemName == productModel.itemName) {
        elementPosition = diningCartList.indexOf(element);
        break;
      }
    }  
    if (elementPosition != null) {
      diningCartList.removeAt(elementPosition);
    }
  }
}
