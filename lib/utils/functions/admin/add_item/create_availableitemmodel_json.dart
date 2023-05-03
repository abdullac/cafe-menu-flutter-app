import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/utils/functions/show_snackbar.dart';

/// method for create json of availableItemModel
Map<String, dynamic>? createAvailableItemModelJson({
  required String itemId,
  required String itemName,
  required String categoryName,
  required String price,
  required String availableQuantity,
  required String? verticalImageUrl,
}) {
  /// check all fields is not empty.
  if ([
    itemName,
    categoryName,
    price,
    availableQuantity,
  ].contains("")) {
    showSnackBar("please fill all Fields");
    return null;
  } else {
    /// create json and return
    return AvailableItemModel(
            itemId: int.parse(itemId),
            itemName: itemName,
            categoryName: categoryName,
            itemPrice: double.parse(price),
            itemType: ItemType.plate,
            availableQty: int.parse(availableQuantity),
            verticalImageUrl: verticalImageUrl)
        .toJson();
  }
}