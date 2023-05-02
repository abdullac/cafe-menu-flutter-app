import 'dart:convert';
import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/firebase_backend.dart';
import 'package:cafemenu_app/utils/functions/show_snackbar.dart';

/// method for add or upload availableItem to firebase database
addOrUpdateAvailableItemToFireBase(Map<String, dynamic> availableItemModelJson,
    {ProductModel? editItem}) async {
  /// get available item snapshot from firebase database
  final availableItemModelListSnapshot =
      await FirebaseBackend.availableItemsChildRef().get();

  /// add new availableItem if editItem null
  if (editItem == null) {
    /// get snapshots last item key for create new key
    var lastPositionKeySnapshort =
        availableItemModelListSnapshot.children.last.key as String;
    int newPosition = int.parse(lastPositionKeySnapshort) + 1;

    /// save to firebase as new availableItem
    await FirebaseBackend.availableItemsChildRef()
        .child("$newPosition")
        .set(availableItemModelJson);
  } else {
    /// update availableItem if editItem not null
    /// iter availableItemModelListSnapshot children for find editItem key
    for (var availableItemSnapshot in availableItemModelListSnapshot.children) {
      /// each availableitemSnapshot convert to availableItemModel for find itemId,
      /// and match itemIds
      ProductModel availableItemModel = ProductModel.fromJson(
          jsonDecode(jsonEncode(availableItemSnapshot.value)));
      if (availableItemModel.itemId == editItem.itemId &&
          availableItemSnapshot.key != null) {
        /// update to firbase edited availableItem
        await FirebaseBackend.availableItemsChildRef()
            .child("${availableItemSnapshot.key}")
            .update(availableItemModelJson);
        showSnackBar(availableItemSnapshot.value);
        showSnackBar("Edited and uploaded ${availableItemModel.itemName}");
      }
    }
  }
}
