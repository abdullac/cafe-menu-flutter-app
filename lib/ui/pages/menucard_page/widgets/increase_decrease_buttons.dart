import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/utils/constants/enums.dart';
import 'package:cafemenu_app/utils/functions/change_set_qty_productmodel.dart';
import 'package:cafemenu_app/utils/functions/remove_item_from_diningcart.dart';
import 'package:flutter/material.dart';

/// this widget is increase(+) Qty button.
class QtyIncreaseButton extends StatelessWidget {
  const QtyIncreaseButton({
    super.key,
    required this.valueNotifier,
    required this.productModel,
    required this.newValue,
    this.onIncreasePressed,
  });

  final ValueNotifier<int?> valueNotifier;
  final ProductModel productModel;
  final int newValue;
  final void Function()? onIncreasePressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        // count increase button pressed
        /// call method for increase Qty of ProductModel
        /// and ProductModel add/update to diningCardList
        changeSetQtyAndNotifyListener(
          inreaseOrDecrease: ChangeQty.increase,
          valueNotifier: valueNotifier,
          newValue: newValue,
          productModel: productModel,
        );
        if (onIncreasePressed != null) {
          onIncreasePressed!();
        }
      },
      icon: const Text(
        "+",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}

/// this widget is decrease(-) Qty button.
class QtyDecreaseButton extends StatelessWidget {
  const QtyDecreaseButton({
    super.key,
    required this.valueNotifier,
    required this.productModel,
    required this.newValue,
    this.onDecreasePressed,
  });

  final ValueNotifier<int?> valueNotifier;
  final ProductModel productModel;
  final int newValue;
  final void Function()? onDecreasePressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        // count decrease button pressed
        if (newValue != 0) {
          /// call method for decrease Qty of ProductModel
          /// and ProductModel add/update to diningCardList
          changeSetQtyAndNotifyListener(
            inreaseOrDecrease: ChangeQty.decrease,
            valueNotifier: valueNotifier,
            newValue: newValue,
            productModel: productModel,
          );
          if (onDecreasePressed != null) {
            onDecreasePressed!();
          }
        }

        /// remove ProductModel from diningCardList
        /// when setQty reach to count 0.
        qty0removeItemFromDiningCartList(newValue, productModel);
      },
      icon: const Text(
        "-",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}