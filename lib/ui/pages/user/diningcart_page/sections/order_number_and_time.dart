import 'package:cafemenu_app/core/provider/bloc/diningcart_page/diningcart_page_bloc.dart';
import 'package:cafemenu_app/utils/constants/enums.dart';
import 'package:cafemenu_app/utils/constants/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return BlocBuilder<DiningcartPageBloc, DiningcartPageState>(
      builder: (context, state) {
      String? formattedOrderedTime;
      if (orderedTime != null) {
        formattedOrderedTime = DateFormat("hh:mm aa").format(orderedTime!);
      }
        return [null, DiningCartButtonFunctionality.takeNow]
                .contains(state.diningCartButtonType)
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
