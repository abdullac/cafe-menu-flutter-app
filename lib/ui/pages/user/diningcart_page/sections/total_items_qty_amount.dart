import 'dart:developer';

import 'package:cafemenu_app/core/model/available_item/available_item_model.dart';
import 'package:cafemenu_app/core/provider/bloc/diningcart_page/diningcart_page_bloc.dart';
import 'package:cafemenu_app/ui/pages/user/diningcart_page/widgets/diningcart_button.dart';
import 'package:cafemenu_app/utils/constants/enums.dart';
import 'package:cafemenu_app/utils/functions/show_snackbar.dart';
import 'package:cafemenu_app/utils/functions/user/diningcart_page/find_total_itemsqtyamount.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// this widget shows total items quantity amount
class TotalItemQtyAmount extends StatelessWidget {
  const TotalItemQtyAmount({
    super.key,
  });

  Widget build(BuildContext context) {
    /// returned Map results (toatal items,qty,amount) assign to diningCartTotalNotifier value
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if ([null, DiningCartButtonFunctionality.takeNow]
          .contains(DiningCartButton.diningCartButtonType)) {
          // .contains(DiningCartButton.diningCartButtonNotifier.value)) {
        /// BlocProvider for rebuild TotalItemQtyAmount widget when any changes in diningCartTotalNotifier value,
        /// BlocProvider value is return of findTotalItemsQtyAmount().
        /// method findTotalItemsQtyAmount return a Map contains toatal items,qty,amount.
        BlocProvider.of<DiningcartPageBloc>(context)
            .add(const EditTotalSection());
      } else {
        showSnackBar("Cannot order, your order already confirmed");
      }
    });

    return Column(
      children: [
        const Text(
          "Total",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        BlocBuilder<DiningcartPageBloc, DiningcartPageState>(
          builder: (context, state) {
            Map<String, dynamic> findTotal = state.valuesOfTotalSectionAsMap;
            return Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      ///  total items
                      const Text("Items"),
                      Text("${findTotal['items'] ?? 'N/A'}"),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      /// total Qty
                      const Text("Qty"),
                      Text("${findTotal['Qty'] ?? 'N/A'}"),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      /// total amount
                      const Text("Amount"),
                      Text("${findTotal['amount'] ?? 'N/A'}"),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
