import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/ui/pages/user/diningcart_page/page_diningcart.dart';
import 'package:cafemenu_app/ui/pages/user/diningcart_page/sections/customername_and_chairnumber.dart';
import 'package:cafemenu_app/utils/constants/enums.dart';
import 'package:cafemenu_app/utils/constants/lists.dart';
import 'package:cafemenu_app/utils/constants/values.dart';
import 'package:cafemenu_app/utils/functions/diningcart_page/create_customermodel_json.dart';
import 'package:cafemenu_app/utils/functions/diningcart_page/order_saveto_firebase.dart';
import 'package:cafemenu_app/utils/functions/diningcart_page/set_order_id.dart';
import 'package:cafemenu_app/utils/functions/diningcart_page/set_ordered_time.dart';
import 'package:flutter/material.dart';

Future<void> setDiningCartButtonFunctionality(
    ValueNotifier<DiningCartButtonFunctionality?> diningCartButtonNotifier) async {
  switch (diningCartButtonNotifier.value) {
    case null:
      takeNowButtonPressed();
      diningCartButtonNotifier.value = DiningCartButtonFunctionality.takeNow;
      break;
    case DiningCartButtonFunctionality.takeNow:
      String customerName = NameChairNumber.customerNameEditingController.text;
      if (customerName.isEmpty ||
          [null, "-1"]
              .contains(NameChairNumber.tableOrChairNumberNotifier.value)) {
        print("Please fill Name or select Table/Chair");
      } else {
        orderId = await setOrderId();
        orderedTime = setOrderTime();
        positionCode = NameChairNumber.tableOrChairNumberNotifier.value;
        final customerModelJson = createCustemerModelJson();
        /////// orderSaveToFireBaseDatabase(customerModelJson); /// important
        orderSaveToFireBaseDatabase(customerModelJson);
        diningCartButtonNotifier.value =
            DiningCartButtonFunctionality.orderConfirm;
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

takeNowButtonPressed() {
  print("diningCartList before takeNow: ${diningCartList}");
  List<ProductModel> diningCartListTemp = [];
  for (var element in diningCartList) {
    if (![null, 0].contains(element.orderedQty) &&
        element.isSelectDiningCart != false) {
      diningCartListTemp.add(element);
    }
  }
  diningCartList = diningCartListTemp;
  print("diningCartList after takeNow: ${diningCartList}");
  PageDiningCart.diningCartListViewNotifier.notifyListeners();
}
