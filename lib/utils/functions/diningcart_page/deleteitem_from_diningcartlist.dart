import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/utils/constants/lists.dart';



deleteItemFromDiningCartList(ProductModel productModel) {
  String? itemNameTemp = productModel.itemName;
  if (itemNameTemp == null) {
    print("C'nt delete Item");
  } else {
    int? itemPosition;
    for (var element in diningCartList) {
      if (element.itemName == itemNameTemp) {
        itemPosition = diningCartList.indexOf(element);
        break;
      }
    }
    if (itemPosition != null) {
      diningCartList.removeAt(itemPosition);
    } else {
      print("Sorry, C'nt find item");
    }
  }
}

