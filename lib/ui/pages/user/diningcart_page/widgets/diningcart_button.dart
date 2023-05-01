import 'package:cafemenu_app/utils/constants/enums.dart';
import 'package:cafemenu_app/utils/functions/diningcart_page/set_diningcartbutton_functionality.dart';
import 'package:cafemenu_app/utils/functions/diningcart_page/set_diningcartbutton_title.dart';
import 'package:flutter/material.dart';

/// this is button widget for  takeNow order or confirmOrder
class DiningCartButton extends StatelessWidget {
  const DiningCartButton({
    super.key,
  });

  /// diningCartButtonNotifier for change button text/functionality takenow,confirmOrder.
  static ValueNotifier<DiningCartButtonFunctionality?>
      diningCartButtonNotifier = ValueNotifier(null);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // take(Order) now button pressed
        setDiningCartButtonFunctionality(diningCartButtonNotifier);
      },
      child: ValueListenableBuilder(
        valueListenable: diningCartButtonNotifier,
        builder: (context, buttonValue, _) {
          /// button text.
          /// method setDiningCartButtonTitle for change button text when changed button functionalty.
          return Text(setDiningCartButtonTitle(buttonValue));
        },
      ),
    );
  }
}
