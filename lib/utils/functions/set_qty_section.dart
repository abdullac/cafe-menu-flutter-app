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
  final bool removeitemAtQty0;
  const SetQtySetion({
    super.key,
    this.mainAxisAlignment,
    required this.valueNotifier,
    required this.productModel,
    this.onIncreasePressed,
    this.onDecreasePressed, required this.removeitemAtQty0,
  });

  @override
  Widget build(BuildContext context) {
    valueNotifier.value ??= productModel.orderedQty ?? 0;
    return ValueListenableBuilder(
        valueListenable: valueNotifier,
        builder: (context, newValue, _) {
          return Row(
            mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              /// button for Decrease Qty
              QtyDecreaseButton(
                valueNotifier: valueNotifier,
                productModel: productModel,
                newValue: newValue!,
                onDecreasePressed: onDecreasePressed,
                removeitemAtQty0: removeitemAtQty0,
              ),

              /// shows increased/decreased Qty
              Container(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
        margin: EdgeInsets.symmetric(horizontal: 1),
        decoration: BoxDecoration(
            color: Colors.red.withOpacity(0.5),),
                child: Text(
                  "$newValue",
                  style:
                      const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
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
