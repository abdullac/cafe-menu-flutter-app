import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/utils/constants/lists.dart';

/// this method for make modify productModel if any change after add to diningCartList
ProductModel modifiedProdectModelByDiningCartList(ProductModel productModel) {
    ProductModel productModelModified = productModel;
    for (var element in diningCartList) {
      if (element.itemName == productModel.itemName) {
        int elementPosition = diningCartList.indexOf(element);
        productModelModified = diningCartList[elementPosition];
      }
    }
    return productModelModified;
  }