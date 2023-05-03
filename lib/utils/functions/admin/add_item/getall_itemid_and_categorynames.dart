import 'dart:convert';
import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/ui/pages/admin/add_item_page/page_add_item.dart';
import 'package:firebase_database/firebase_database.dart';

/// method for get all itemId s Or last itemId from firbase
Future<void> getALlItemIdAndCategorynames() async {
  DatabaseReference firebaseRef = FirebaseDatabase.instance.ref();
  final availableItemsSnapshot =
      await firebaseRef.child("cafeMenu/menuCard/itemsSample").get();
  for (var availableItemSnapshot in availableItemsSnapshot.children) {
    AvailableItemModel availableItemModel = AvailableItemModel.fromJson(
        jsonDecode(jsonEncode(availableItemSnapshot.value!)));
    // add to itemIdList
    if (availableItemModel.itemId != null) {
      PageAddOrEditItem.itemIdList.add(availableItemModel.itemId!);
    }
    // add to categoryNameList
    if (availableItemModel.categoryName != null) {
      PageAddOrEditItem.categoryNameList.add(availableItemModel.categoryName!);
    }
  }
}
