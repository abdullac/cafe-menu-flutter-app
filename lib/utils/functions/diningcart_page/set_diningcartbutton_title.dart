import 'package:cafemenu_app/ui/pages/diningcart_page/page_diningcart.dart';
import 'package:cafemenu_app/utils/constants/enums.dart';

String setDiningCartButtonTitle(DiningCartButtonFunctionality? buttonValue) {
  return buttonValue == null
      ? "Take Now"
      : buttonValue == DiningCartButtonFunctionality.takeNow
          ? "Confirm Order"
          : buttonValue == DiningCartButtonFunctionality.orderConfirm
              ? ""
              // ? "Additional Order"
              // : buttonValue == DiningCartButtonFunctionality.additionalOrder
              //     ? "Confirm Additional Order"
              //     : buttonValue == DiningCartButtonFunctionality.confirmAdditionalOrder
              //         ? "Running Order"
              //         : buttonValue == DiningCartButtonFunctionality.runningOrder
              //             ? "Confirm Running Order"
              //             : buttonValue ==
              //                     DiningCartButtonFunctionality.confirmAdditionalOrder
              //                 ? "Cafe Gallery"
              : "!!!";
}
