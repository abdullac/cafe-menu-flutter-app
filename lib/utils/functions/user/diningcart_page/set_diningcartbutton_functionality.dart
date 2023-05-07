import 'package:cafemenu_app/core/model/available_item/available_item_model.dart';
import 'package:cafemenu_app/utils/constants/enums.dart';
import 'package:cafemenu_app/utils/functions/user/diningcart_page/confirm_order.dart';
import 'package:cafemenu_app/utils/functions/user/diningcart_page/deleteitem_from_diningcartlist.dart';
import 'package:cafemenu_app/utils/functions/user/diningcart_page/takenow_order.dart';

/// method for hange diningCart button fuctionality.
Future<DiningCartButtonFunctionality?> setDiningCartButtonFunctionality({
  required DiningCartButtonFunctionality? diningCartButtonType,
  required bool? isReTakeDiningCart,
  required String? positionCode,
  required AvailableItemModel? diningCartItemForDelete,
}) async {
  DiningCartButtonFunctionality? diningCartButtonTypeTemp;
        /// method for delete. when diningCartItemForDelete is not null.
        /// and set diningCartList and notify diningCartListViewNotifier for
  deleteItemFromDiningCartList(diningCartItemForDelete);
    ///
  if (isReTakeDiningCart == true) {
    diningCartButtonTypeTemp = null;
  } else {
    switch (diningCartButtonType) {
      /// button press for takeNow order
      case null:

        /// method for filter and avoid 0 orderedQty items and notfy for rebuild diningCArt widgets.
        filterAndRefreshDiningCartList();
        diningCartButtonTypeTemp = DiningCartButtonFunctionality.takeNow;
        break;

      /// button pressed for confirmOrder
      case DiningCartButtonFunctionality.takeNow:
        if (![null, "", "--", "-Select-"].contains(positionCode)) {
          /// method for order save to firebase when pressed confirm order button
          await buttonPressedForConfirmOrder();
          diningCartButtonTypeTemp = DiningCartButtonFunctionality.orderConfirm;
        } else {
          diningCartButtonTypeTemp = DiningCartButtonFunctionality.takeNow;
        }
        break;
      default:
        diningCartButtonTypeTemp = DiningCartButtonFunctionality.orderConfirm;
    }
  }
  return diningCartButtonTypeTemp;
  // diningCartButtonNotifier.notifyListeners();
}

// ADDITIONAL BUTTON FUNCTIONALITY

//     case DiningCartButtonFunctionality.orderConfirm:
//       diningCartButtonNotifier.value = DiningCartButtonFunctionality.additionalOrder;
//       break;
//     case DiningCartButtonFunctionality.additionalOrder:
//       diningCartButtonNotifier.value =
//           DiningCartButtonFunctionality.confirmAdditionalOrder;
//       break;
//     case DiningCartButtonFunctionality.confirmAdditionalOrder:
//       diningCartButtonNotifier.value = DiningCartButtonFunctionality.runningOrder;
//       break;
//     case DiningCartButtonFunctionality.runningOrder:
//       diningCartButtonNotifier.value = DiningCartButtonFunctionality.confirmRunningOrder;
//       break;
//     case DiningCartButtonFunctionality.confirmRunningOrder:
//       //
//       break;
