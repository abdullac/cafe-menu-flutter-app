import 'package:cafemenu_app/core/model/available_item/available_item_model.dart';
import 'package:cafemenu_app/utils/constants/enums.dart';
import 'package:cafemenu_app/core/provider/logics/user/change_set_qty_productmodel.dart';
import 'package:cafemenu_app/utils/functions/show_snackbar.dart';
import 'package:flutter/material.dart';

/// this widget is increase(+) Qty button(Container with InkWell).
class QtyIncreaseButton extends StatelessWidget {
  const QtyIncreaseButton({
    super.key,
    required this.valueNotifier,
    required this.availableItem,
    required this.newQtyValue,
    this.onIncreasePressed,
  });

  final ValueNotifier<int?> valueNotifier;
  final AvailableItemModel availableItem;
  final int newQtyValue;
  final void Function()? onIncreasePressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (![valueNotifier.value, availableItem.availableQty].contains(null) &&
            valueNotifier.value! >= availableItem.availableQty!) {
          showSnackBar(
              "Maximum available Quantity is ${availableItem.availableQty!}");
        } else {
          // count increase button pressed
          /// call method for increase Qty of availableItem
          /// and availableItem add/update to diningCardList
          changeSetQtyAndNotifyListener(
            inreaseOrDecrease: ChangeQty.increase,
            valueNotifier: valueNotifier,
            newQtyValue: newQtyValue,
            availableItem: availableItem,
          );
          if (onIncreasePressed != null) {
            onIncreasePressed!();
          }
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 9),
        decoration: BoxDecoration(
          color: Colors.red.withOpacity(0.7),
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(8),
            bottomRight: Radius.circular(8),
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
          "+",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
