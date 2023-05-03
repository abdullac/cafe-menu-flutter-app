import 'dart:convert';
import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/firebase_backend.dart';
import 'package:cafemenu_app/utils/functions/show_snackbar.dart';

/// metod for delete availableItem from firebase
Future deleteItemFromDataBase(int? itemId) async {
  if (itemId != null) {
    /// get availableItems List snapshot from fire base
    final availableItemsListSnapShot =
        await FirebaseBackend.availableItemsChildRef().get();

    /// find availableItem from ListSnapshot using itemId for delete
    for (var availableItemSnapshot in availableItemsListSnapShot.children) {
      AvailableItemModel availableItemModel = AvailableItemModel.fromJson(
          jsonDecode(jsonEncode(availableItemSnapshot.value)));
      if (availableItemModel.itemId != null &&
          availableItemSnapshot.key != null &&
          availableItemModel.itemId == itemId) {
        /// remove availableItem from firebase availableItemlist
        await FirebaseBackend.availableItemsChildRef()
            .child("${availableItemSnapshot.key}")
            .remove();

        /// show deleted message
        showSnackBar("${availableItemModel.itemName} removed");
        break;
      }
    }
  } else {
    /// show message if cannot delete availableItem(available itemId is null)
    showSnackBar("Cannot delete");
  }
}
