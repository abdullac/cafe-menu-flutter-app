import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/utils/constants/lists.dart';



deleteItemFromDiningCartList(ProductModel productModel) {
  int? itemIdTemp = productModel.itemId;
  if (itemIdTemp == null) {
    print("C'nt delete Item");
  } else {
    int? itemPosition;
    for (var element in diningCartList) {
      if (element.itemId == itemIdTemp) {
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

