import 'package:cafemenu_app/ui/pages/user/diningcart_page/page_diningcart.dart';
import 'package:cafemenu_app/ui/pages/user/diningcart_page/widgets/diningcart_button.dart';
import 'package:cafemenu_app/utils/constants/enums.dart';
import 'package:cafemenu_app/utils/constants/values.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderIdAndTime extends StatelessWidget {
  const OrderIdAndTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: DiningCartButton.diningCartButtonNotifier,
        builder: (context, diningCartButtonType, _) {
          String? formattedOrderedTime;
          if (orderedTime != null) {
            formattedOrderedTime = DateFormat("hh:mm aa").format(orderedTime!);
          }
          return [null, DiningCartButtonFunctionality.takeNow]
                  .contains(diningCartButtonType)
              ? Container(
                  height: 5,
                  width: 200,
                  color: Colors.orange.withOpacity(0.4),
                )
              : Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Order id: ${orderId ?? ''}"),
                        Text("Time: ${formattedOrderedTime ?? ''}"),
                      ],
                    ),
                  ],
                );
        });
  }
}