import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/utils/functions/diningcart_page/find_total_itemsqtyamount.dart';
import 'package:flutter/material.dart';

class TotalItemQtyAmount extends StatelessWidget {
  final List<ProductModel> diningCartList;
  const TotalItemQtyAmount({
    super.key,
    required this.diningCartList,
  });

  static ValueNotifier<Map<String, dynamic>> diningCartTotalNotifier =
      ValueNotifier(findTotalItemsQtyAmount());
  @override
  Widget build(BuildContext context) {
    // Map<String, dynamic> findTotal = findTotalitemsQtyAmount();
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
                        const Text("Items"),
                        Text("${findTotal['items']}"),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const Text("Qty"),
                        Text("${findTotal['Qty']}"),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
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
