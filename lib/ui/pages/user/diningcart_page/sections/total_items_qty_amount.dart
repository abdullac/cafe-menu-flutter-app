import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/utils/functions/diningcart_page/find_total_itemsqtyamount.dart';
import 'package:flutter/material.dart';

/// this widget shows total items quantity amount
class TotalItemQtyAmount extends StatelessWidget {
  final List<ProductModel> diningCartList;
  const TotalItemQtyAmount({
    super.key,
    required this.diningCartList,
  });

  /// diningCartTotalNotifier for rebuild TotalItemQtyAmount widget when any changes in diningCartTotalNotifier value,
  /// diningCartTotalNotifier value is return of findTotalItemsQtyAmount().
  /// method findTotalItemsQtyAmount return a Map contains toatal items,qty,amount.
  static ValueNotifier<Map<String, dynamic>> diningCartTotalNotifier =
      ValueNotifier(findTotalItemsQtyAmount());
  @override
  Widget build(BuildContext context) {
    /// returned Map results (toatal items,qty,amount) assign to diningCartTotalNotifier value
    diningCartTotalNotifier.value = findTotalItemsQtyAmount();
    diningCartTotalNotifier.notifyListeners();
    return Column(
      children: [
        const Text(
          "Total",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        ValueListenableBuilder(
            valueListenable: diningCartTotalNotifier,
            builder: (context, findTotal, _) {
              return Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        ///  total items
                        const Text("Items"),
                        Text("${findTotal['items']}"),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        /// total Qty
                        const Text("Qty"),
                        Text("${findTotal['Qty']}"),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        /// total amount
                        const Text("Amount"),
                        Text("${findTotal['amount']}"),
                      ],
                    ),
                  ),
                ],
              );
            }),
      ],
    );
  }
}
