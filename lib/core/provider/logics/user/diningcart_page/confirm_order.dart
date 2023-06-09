import 'package:cafemenu_app/core/provider/logics/user/menucard_page/get_user_distence_condition.dart';
import 'package:cafemenu_app/ui/pages/user/diningcart_page/sections/customername_and_chairnumber.dart';
import 'package:cafemenu_app/utils/constants/values.dart';
import 'package:cafemenu_app/utils/functions/firebase_messaging.dart';
import 'package:cafemenu_app/utils/functions/show_snackbar.dart';
import 'package:cafemenu_app/core/provider/logics/user/diningcart_page/set_order_id.dart';
import 'package:cafemenu_app/core/provider/logics/user/diningcart_page/set_ordered_time.dart';
import 'package:cafemenu_app/core/provider/logics/user/diningcart_page/create_customermodel_json.dart';
import 'package:cafemenu_app/core/provider/logics/user/diningcart_page/order_saveto_firebase.dart';

/// method for order save to firebase when pressed confirm order button
Future<bool?> buttonPressedForConfirmOrder() async {
  bool? hasSavedOrder;
  await getUserDistenceCondition();
  if (userDistenceCondition == null ||
      locationDistence! <= userDistenceCondition!) {
    /// get name from name textField and get PositionCode,
    /// make order and save to fireBase using orderSaveToFireBaseDatabase method.
    String customerName =
        NameAndPositionCode.customerNameEditingController.text;
    if (customerName.isEmpty ||
        customerName == "" ||
        [null, "-1", "--", "-Select-"].contains(positionCode)) {
      showSnackBar("Please fill Name or select position code");
    } else {
      orderId = await setOrderId();
      orderedTime = setOrderTime();

      /// method for make orderModel json before save to firebase databasse.
      final orderModelJson = createOrderModelJson();

      /// method for save ordermodel json to firebase database.
      await orderSaveToFireBaseDatabase(orderModelJson);
      await getSavedTokensAndKeys();
      await listenFCM();
      await sendNotificationToAllAdmins();
      hasSavedOrder = true;
    }
  } else {
    showSnackBar("C'not Order Now\nPlease reach to shop area and try again");
  }
  return hasSavedOrder;
}
