import 'package:cafemenu_app/core/model/available_item/available_item_model.dart';
import 'package:cafemenu_app/ui/pages/admin/add_item_page/page_add_item.dart';
import 'package:cafemenu_app/core/provider/logics/admin/add_item/uploadimage_and_geturl.dart';
import 'package:cafemenu_app/utils/functions/show_snackbar.dart';

/// method for create json of availableItemModel
Future<Map<String, dynamic>?> createAvailableItemModelJson() async {
  /// get details from AddItemPage
  String itemId = PageAddOrEditItem.newItemIdNotifier.value.toString();
  String itemName = PageAddOrEditItem.itemNameEditingController.text;
  String categoryName = PageAddOrEditItem.categoryNameEditingController.text;
  String price = PageAddOrEditItem.priceEditingController.text;
  String availableQuantity =
      PageAddOrEditItem.availableQtyEditingController.text;
  String? verticalImageUrl = await uploadImagetoFirebaseGetUrl();

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
