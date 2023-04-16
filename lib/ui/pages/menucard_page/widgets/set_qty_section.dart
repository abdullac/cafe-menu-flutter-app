import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/ui/pages/menucard_page/widgets/increase_decrease_buttons.dart';
import 'package:flutter/material.dart';

/// this widget shows Increased or decreased Qty COunt
/// and set Qty count increase or decrease.
class SetQtySetion extends StatelessWidget {
  final MainAxisAlignment? mainAxisAlignment;
  final ValueNotifier<int?> valueNotifier;
  final ProductModel productModel;
  final void Function()? onIncreasePressed;
  final void Function()? onDecreasePressed;
  const SetQtySetion({
    super.key,
    this.mainAxisAlignment,
    required this.valueNotifier,
    required this.productModel,
    this.onIncreasePressed,
    this.onDecreasePressed,
  });

  @override
  Widget build(BuildContext context) {
    valueNotifier.value ??= productModel.orderedQty ?? 0;
    return ValueListenableBuilder(
        valueListenable: valueNotifier,
        builder: (context, newValue, _) {
          return Row(
            mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
            children: [
              /// button for Decrease Qty
              QtyDecreaseButton(
                valueNotifier: valueNotifier,
                productModel: productModel,
                newValue: newValue!,
                onDecreasePressed: onDecreasePressed,
              ),

              /// shows increased/decreased Qty
              Text(
                "$newValue",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),

              /// button for increase Qty
              QtyIncreaseButton(
                valueNotifier: valueNotifier,
                productModel: productModel,
                newValue: newValue,
                onIncreasePressed: onIncreasePressed,
              ),
            ],
          );
        });
  }
}
