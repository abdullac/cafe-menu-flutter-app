import 'package:cafemenu_app/core/model/available_item/available_item_model.dart';
import 'package:cafemenu_app/utils/constants/lists.dart';

updateProductModelToDiningCartList(
    AvailableItemModel productModel, int orderedQty, bool isSelect) {
  /// int elementPosition for gets current position of that ProdutModel from diningCartList. temporary usage
  /// iterate diningCartList for find current position of that ProdutModel position.
  int? elementPosition;
  for (var element in diningCartList) {
    if (element.itemId == productModel.itemId) {
      elementPosition = diningCartList.indexOf(element);
      break;
    }
  }

  /// upadate ProductModel to that position of diningCartList if elementPosition contains any value
  /// add new data to diningCartList as productModel if elementPosition is null
  if (elementPosition != null) {
    diningCartList[elementPosition] = productModel.copyWith(
        orderedQty: orderedQty, isSelectDiningCart: isSelect);
  } else {
    diningCartList.add(productModel.copyWith(
        orderedQty: orderedQty, isSelectDiningCart: isSelect));
  }
}
