import 'package:cafemenu_app/core/model/available_item/available_item_model.dart';
import 'package:cafemenu_app/utils/constants/lists.dart';
import 'package:cafemenu_app/utils/functions/show_snackbar.dart';

/// this method for delete diningCart item from diningCartList
deleteItemFromDiningCartList(AvailableItemModel? diningCartItemForDelete) {
  if (diningCartItemForDelete != null) {
    int? itemIdTemp = diningCartItemForDelete.itemId;

    /// if itemid null
    if (itemIdTemp == null) {
      showSnackBar("C'nt delete Item");
    } else {
      int? itemPosition;

      /// iter diningCartList for match this diningCartItem,
      /// and get index(position) from diningCartList
      for (var diningCartItem in diningCartList) {
        if (diningCartItem.itemId == itemIdTemp) {
          itemPosition = diningCartList.indexOf(diningCartItem);
          break;
        }
      }
      if (itemPosition != null) {
        /// remove itemfrom diningCart list
        AvailableItemModel deletedItem = diningCartList.removeAt(itemPosition);
        showSnackBar("${deletedItem.itemName} removed from Your Dining Cart");
      } else {
        /// if cannot find item
        showSnackBar("Sorry, C'nt find item for delete");
      }
    }
  }
}
