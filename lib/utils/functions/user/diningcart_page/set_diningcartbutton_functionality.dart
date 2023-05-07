import 'package:cafemenu_app/core/provider/bloc/diningcart_page/diningcart_page_bloc.dart';
import 'package:cafemenu_app/ui/pages/user/diningcart_page/widgets/diningcart_button.dart';
import 'package:cafemenu_app/utils/constants/enums.dart';
import 'package:cafemenu_app/utils/functions/user/diningcart_page/confirm_order.dart';
import 'package:cafemenu_app/utils/functions/user/diningcart_page/takenow_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// method for hange diningCart button fuctionality.
Future<DiningCartButtonFunctionality?> setDiningCartButtonFunctionality(
    // BuildContext context,
    // ValueNotifier<DiningCartButtonFunctionality?> diningCartButtonNotifier
    DiningCartButtonFunctionality? diningCartButtonType) async {
      DiningCartButtonFunctionality? diningCartButtonTypeTemp;
  switch (diningCartButtonType) {
    /// button press for takeNow order
    case null:

      /// method for filter and avoid 0 orderedQty items and notfy for rebuild diningCArt widgets.
      filterAndRefreshDiningCartList();
      diningCartButtonTypeTemp = DiningCartButtonFunctionality.takeNow;
      break;

    /// button pressed for confirmOrder
    case DiningCartButtonFunctionality.takeNow:

      /// method for order save to firebase when pressed confirm order button
      await buttonPressedForConfirmOrder(
          // context, diningCartButtonType
          );
      diningCartButtonTypeTemp = DiningCartButtonFunctionality.orderConfirm;
      break;
    default:
      diningCartButtonTypeTemp = DiningCartButtonFunctionality.orderConfirm;
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
