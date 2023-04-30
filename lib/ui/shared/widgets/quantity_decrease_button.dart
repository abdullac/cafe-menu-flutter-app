
import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/utils/constants/enums.dart';
import 'package:cafemenu_app/utils/functions/change_set_qty_productmodel.dart';
import 'package:flutter/material.dart';

/// this widget is decrease(-) Qty button(Container with InkWell).
class QtyDecreaseButton extends StatelessWidget {
  const QtyDecreaseButton({
    super.key,
    required this.valueNotifier,
    required this.availableItem,
    required this.newQtyValue,
    this.onDecreasePressed,
    required this.removeitemAtQty0,
  });

  final ValueNotifier<int?> valueNotifier;
  final ProductModel availableItem;
  final int newQtyValue;
  final void Function()? onDecreasePressed;
  final bool removeitemAtQty0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // count decrease button pressed
        if (newQtyValue != 0) {
          /// call method for decrease Qty of availableItem
          /// and availableItem add/update to diningCardList
          changeSetQtyAndNotifyListener(
              inreaseOrDecrease: ChangeQty.decrease,
              valueNotifier: valueNotifier,
              newQtyValue: newQtyValue,
              availableItem: availableItem,
              removeitemAtQty0: removeitemAtQty0);
          if (onDecreasePressed != null) {
            onDecreasePressed!();
          }
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.red.withOpacity(0.7),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            bottomLeft: Radius.circular(8),
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(2, 2),
              blurRadius: 4,
              spreadRadius: -0.5,
            )
          ],
        ),
        child: const Text(
          "-",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }
}
