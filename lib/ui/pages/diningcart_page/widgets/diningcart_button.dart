import 'package:cafemenu_app/utils/constants/enums.dart';
import 'package:cafemenu_app/utils/functions/diningcart_page/set_diningcartbutton_functionality.dart';
import 'package:cafemenu_app/utils/functions/diningcart_page/set_diningcartbutton_title.dart';
import 'package:flutter/material.dart';

class DiningCartButton extends StatelessWidget {
  const DiningCartButton({
    super.key,
  });

  static ValueNotifier<DiningCartButtonFunctionality?> diningCartButtonNotifier =
      ValueNotifier(null);
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
            return Text(setDiningCartButtonTitle(buttonValue));
          }),
    );
  }
}


