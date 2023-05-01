import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/utils/functions/set_qty_section.dart';
import 'package:cafemenu_app/utils/functions/modified_product_model.dart';
import 'package:flutter/material.dart';

/// this is row widget includes show price and Qty widget
class QtyPriceWidgets extends StatelessWidget {
  final ProductModel availableItem;
  const QtyPriceWidgets({
    super.key,
    required this.availableItem,
  });

  @override
  Widget build(BuildContext context) {
    /// setQtyNotifier for change value of Qty when user change qty (press +/- button).
    ValueNotifier<int?> setQtyNotifier = ValueNotifier(null);

    /// method for modify availableItem if this availableItem has include in diningCartList
    /// it do for change Ordered Qty
    ProductModel availableItemModified =
        modifiedProdectModelByDiningCartList(availableItem);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        /// text widget
        /// shows price
        Text(
          "₹ ${availableItemModified.itemPrice}/Qty Only",
          style: const TextStyle(shadows: [
            Shadow(
              color: Colors.white,
              blurRadius: 15,
            )
          ]),
        ),
        const SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.only(right: 5),
        /// shows and user can manage Qty using -/+ button
          child: SetQtySetion(
            valueNotifier: setQtyNotifier,
            availableItem: availableItemModified,
            removeitemAtQty0: true,
          ),
        ),
      ],
    );
  }
}
