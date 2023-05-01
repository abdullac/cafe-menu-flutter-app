import 'package:cafemenu_app/ui/pages/user/diningcart_page/widgets/diningcart_button.dart';
import 'package:cafemenu_app/utils/constants/enums.dart';
import 'package:cafemenu_app/utils/constants/values.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// this widget shows orderId and ordered time
/// after press order Confirmed button.
class OrderIdAndTime extends StatelessWidget {
  const OrderIdAndTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    /// rebuild widget when press diningCartButton
    return ValueListenableBuilder(
      valueListenable: DiningCartButton.diningCartButtonNotifier,
      builder: (context, diningCartButtonType, _) {
        /// date formate to time(String)
        String? formattedOrderedTime;
        if (orderedTime != null) {
          formattedOrderedTime = DateFormat("hh:mm aa").format(orderedTime!);
        }

        /// show orderid and time when DiningCartButtonFunctionality reach to confirmOrder.
        return [null, DiningCartButtonFunctionality.takeNow]
                .contains(diningCartButtonType)
            ? const SizedBox()
            : Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      /// orderId
                      Text("Order id: ${orderId ?? ''}"),

                      /// ordered time
                      Text("Time: ${formattedOrderedTime ?? ''}"),
                    ],
                  ),
                ],
              );
      },
    );
  }
}
