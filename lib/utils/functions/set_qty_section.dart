import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/ui/shared/widgets/quantity_decrease_button.dart';
import 'package:cafemenu_app/ui/shared/widgets/quantity_increase_button.dart';
import 'package:flutter/material.dart';

/// this widget shows Increased or decreased Qty Count
/// and set Qty count increase or decrease.
/// and remove diningCartItem from DiningCartList when Qty count decrease to 0
class SetQtySetion extends StatelessWidget {
  final MainAxisAlignment? mainAxisAlignment;
  final ValueNotifier<int?> valueNotifier;
  final ProductModel availableItem;
  final void Function()? onIncreasePressed;
  final void Function()? onDecreasePressed;
  final bool removeitemAtQty0;
  const SetQtySetion({
    super.key,
    this.mainAxisAlignment,
    required this.valueNotifier,
    required this.availableItem,
    this.onIncreasePressed,
    this.onDecreasePressed,
    required this.removeitemAtQty0,
  });

  @override
  Widget build(BuildContext context) {
    valueNotifier.value ??= availableItem.orderedQty ?? 0;
    return ValueListenableBuilder(
        valueListenable: valueNotifier,
        builder: (context, newQtyValue, _) {
          return Row(
            mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              /// button for Decrease Qty
              QtyDecreaseButton(
                valueNotifier: valueNotifier,
                availableItem: availableItem,
                newQtyValue: newQtyValue!,
                onDecreasePressed: onDecreasePressed,
                removeitemAtQty0: removeitemAtQty0,
              ),

              /// shows increased/decreased Qty
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                margin: const EdgeInsets.symmetric(horizontal: 1),
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.6),
                ),
                child: Text(
                  "$newQtyValue",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),

              /// button for increase Qty
              QtyIncreaseButton(
                valueNotifier: valueNotifier,
                availableItem: availableItem,
                newQtyValue: newQtyValue,
                onIncreasePressed: onIncreasePressed,
              ),
            ],
          );
        });
  }
}
