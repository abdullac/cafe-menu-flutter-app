import 'dart:convert';
import 'package:cafemenu_app/core/model/available_item/available_item_model.dart';
import 'package:cafemenu_app/core/services/firebase/firebase_refs.dart';
import 'package:cafemenu_app/utils/functions/show_snackbar.dart';

/// metod for delete availableItem from firebase
Future deleteItemFromDataBase(int? itemId) async {
  if (itemId != null) {
    /// get availableItems List snapshot from fire base
    final availableItemsListSnapShot =
        await FirebaseRefs.availableItemsChild().get();

    /// find availableItem from ListSnapshot using itemId for delete
    for (var availableItemSnapshot in availableItemsListSnapShot.children) {
      AvailableItemModel availableItemModel = AvailableItemModel.fromJson(
          jsonDecode(jsonEncode(availableItemSnapshot.value)));
      if (availableItemModel.itemId != null &&
          availableItemSnapshot.key != null &&
          availableItemModel.itemId == itemId) {
        /// remove availableItem from firebase availableItemlist
        await FirebaseRefs.availableItemsChild()
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
