import 'dart:convert';
import 'package:cafemenu_app/core/model/available_item/available_item_model.dart';
import 'package:cafemenu_app/core/services/firebase/firebase_refs.dart';
import 'package:cafemenu_app/utils/functions/show_snackbar.dart';

/// method for add or upload availableItem to firebase database
Future addOrUpdateAvailableItemToFireBase(Map<String, dynamic> availableItemModelJson,
    {AvailableItemModel? editItem}) async {
  /// get available item snapshot from firebase database
  final availableItemModelListSnapshot =
      await FirebaseRefs.availableItemsChild().get();

  /// add new availableItem if editItem null
  if (editItem == null) {
    /// get snapshots last item key for create new key
    var lastPositionKeySnapshort =
        availableItemModelListSnapshot.children.last.key as String;
    int newPosition = int.parse(lastPositionKeySnapshort) + 1;

    /// save to firebase as new availableItem
    await FirebaseRefs.availableItemsChild()
        .child("$newPosition")
        .set(availableItemModelJson);
  } else {
    /// update availableItem if editItem not null
    /// iter availableItemModelListSnapshot children for find editItem key
    for (var availableItemSnapshot in availableItemModelListSnapshot.children) {
      /// each availableitemSnapshot convert to availableItemModel for find itemId,
      /// and match itemIds
      AvailableItemModel availableItemModel = AvailableItemModel.fromJson(
          jsonDecode(jsonEncode(availableItemSnapshot.value)));
      if (availableItemModel.itemId == editItem.itemId &&
          availableItemSnapshot.key != null) {
        /// update to firbase edited availableItem
        await FirebaseRefs.availableItemsChild()
            .child("${availableItemSnapshot.key}")
            .update(availableItemModelJson);
        showSnackBar(availableItemSnapshot.value);
        showSnackBar("Edited and uploaded ${availableItemModel.itemName}");
      }
    }
  }
}
