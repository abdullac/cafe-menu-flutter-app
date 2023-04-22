import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/utils/functions/set_qty_section.dart';
import 'package:cafemenu_app/utils/functions/modified_product_model.dart';
import 'package:flutter/material.dart';

/// this is row widget includes show price and Qty widget with manage
class CountPriceWidgets extends StatelessWidget {
  final ProductModel productModel;
  const CountPriceWidgets({
    super.key,
    required this.productModel,
  });

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int?> setQtyNotifier = ValueNotifier(null);

    /// method for modify productModel if product model has include in diningCartList
    /// it do for change Ordered Qty
    ProductModel productModelModified =
        modifiedProdectModelByDiningCartList(productModel);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        /// textv widget
        /// shows price
        Text(
          "₹ ${productModelModified.itemPrice}/Qty Only",
          style: const TextStyle(shadows: [
            Shadow(
              color: Colors.white,
              blurRadius: 15,
            )
          ]),
        ),
        const SizedBox(height: 20,),
        /// shows and manage Qty
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: SetQtySetion(
            valueNotifier: setQtyNotifier,
            productModel: productModelModified,
            removeitemAtQty0: true,
          ),
        ),
      ],
    );
  }
}
