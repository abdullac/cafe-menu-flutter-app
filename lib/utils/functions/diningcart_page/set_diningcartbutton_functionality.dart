import 'package:cafemenu_app/ui/pages/user/diningcart_page/page_diningcart.dart';
import 'package:cafemenu_app/ui/pages/user/diningcart_page/sections/customername_and_chairnumber.dart';
import 'package:cafemenu_app/utils/constants/enums.dart';
import 'package:cafemenu_app/utils/constants/values.dart';
import 'package:cafemenu_app/utils/functions/diningcart_page/create_customermodel_json.dart';
import 'package:cafemenu_app/utils/functions/diningcart_page/order_saveto_firebase.dart';
import 'package:cafemenu_app/utils/functions/diningcart_page/set_order_id.dart';
import 'package:cafemenu_app/utils/functions/diningcart_page/set_ordered_time.dart';
import 'package:cafemenu_app/utils/functions/diningcart_page/takenow_order.dart';
import 'package:flutter/material.dart';

/// method for hange diningCart button fuctionality.
Future<void> setDiningCartButtonFunctionality(
    ValueNotifier<DiningCartButtonFunctionality?>
        diningCartButtonNotifier) async {
  switch (diningCartButtonNotifier.value) {
    /// button press for takeNow order
    case null:

      /// method for filter and avoid 0 orderedQty items and notfy for rebuild diningCArt widgets.
      buttonPressedForTakeNow();
      diningCartButtonNotifier.value = DiningCartButtonFunctionality.takeNow;
      break;

    /// button pressed for confirmOrder
    case DiningCartButtonFunctionality.takeNow:

      /// get name from name textField and get PositionCode,
      /// make order and save to fireBase using orderSaveToFireBaseDatabase method.
      String customerName =
          NameAndPositionCode.customerNameEditingController.text;
      if (customerName.isEmpty ||
          [null, "-1"]
              .contains(NameAndPositionCode.tableOrChairNumberNotifier.value)) {
        print("Please fill Name or select Table/Chair");
      } else {
        orderId = await setOrderId();
        orderedTime = setOrderTime();
        positionCode = NameAndPositionCode.tableOrChairNumberNotifier.value;

        /// method for make orderModel json before save to firebase databasse.
        final orderModelJson = createOrderModelJson();

        /// method for save ordermodel json to firebase database.
        orderSaveToFireBaseDatabase(orderModelJson);

        /// change notifiers value.
        diningCartButtonNotifier.value =
            DiningCartButtonFunctionality.orderConfirm;

        /// diningCartListViewNotifier value cange to  "oredredList" for
        /// diningCart widgets change to show orderedList and more..
        PageDiningCart.diningCartListViewNotifier.value = "oredredList";
      }
      break;

    default:
  }
  diningCartButtonNotifier.notifyListeners();
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
