import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/utils/constants/lists.dart';

/// this method for make modify availableItem if any change after add to diningCartList
ProductModel modifiedProdectModelByDiningCartList(ProductModel availableItem) {
  /// iter diningCartList with for loop and match this availableItem,
  /// then get diningCartItem and assign/update to diningCartList.
    ProductModel availableItemModified = availableItem;
    for (var diningCartItem in diningCartList) {
      if (diningCartItem.itemId == availableItem.itemId) {
        int diningCartItemPosition = diningCartList.indexOf(diningCartItem);
        availableItemModified = diningCartList[diningCartItemPosition];
        break;
      }
    }
    return availableItemModified;
  }