import 'package:cafemenu_app/core/provider/bloc/diningcart_page/diningcart_page_bloc.dart';
import 'package:cafemenu_app/ui/pages/user/diningcart_page/page_diningcart.dart';
import 'package:cafemenu_app/ui/pages/user/diningcart_page/sections/customername_and_chairnumber.dart';
import 'package:cafemenu_app/utils/constants/enums.dart';
import 'package:cafemenu_app/utils/constants/values.dart';
import 'package:cafemenu_app/utils/functions/show_snackbar.dart';
import 'package:cafemenu_app/utils/functions/user/diningcart_page/create_customermodel_json.dart';
import 'package:cafemenu_app/utils/functions/user/diningcart_page/order_saveto_firebase.dart';
import 'package:cafemenu_app/utils/functions/user/diningcart_page/set_order_id.dart';
import 'package:cafemenu_app/utils/functions/user/diningcart_page/set_ordered_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// method for order save to firebase when pressed confirm order button
Future<void> buttonPressedForConfirmOrder(
    // BuildContext context,
    // ValueNotifier<DiningCartButtonFunctionality?>
    //     diningCartButtonNotifier
    ) async {
  /// get name from name textField and get PositionCode,
  /// make order and save to fireBase using orderSaveToFireBaseDatabase method.
  String customerName = NameAndPositionCode.customerNameEditingController.text;
  if (customerName.isEmpty ||
      customerName == "" ||
      [null, "-1", "--", "-Select-"]
          .contains(NameAndPositionCode.positionCode)) {
    showSnackBar("Please fill Name or select position code");
  } else {
    // BlocProvider.of<DiningcartPageBloc>(context).add(const SetOrderIdAndTime(
    //     diningCartButtonType: DiningCartButtonFunctionality.orderConfirm));
    orderId = await setOrderId();
    orderedTime = setOrderTime();
    positionCode = NameAndPositionCode.positionCode;

    /// method for make orderModel json before save to firebase databasse.
    final orderModelJson = createOrderModelJson();

    /// method for save ordermodel json to firebase database.
    orderSaveToFireBaseDatabase(orderModelJson);

    /// change notifiers value.
    // diningCartButtonNotifier.value = DiningCartButtonFunctionality.orderConfirm;

    /// diningCartListViewNotifier value cange to  "oredredList" for
    /// diningCart widgets change to show orderedList and more..
    PageDiningCart.diningCartListViewNotifier.value = "oredredList";
  }
}
