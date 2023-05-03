import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:flutter/material.dart';

/// this widget is text for show Item price
class ItemPriceText extends StatelessWidget {
  const ItemPriceText({
    super.key,
    required this.availableItem,
  });

  final AvailableItemModel availableItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 70),
      /// item price text.
      child: Text(
        availableItem.itemPrice != null
            ? "₹ ${availableItem.itemPrice}/Qty only"
            : "₹ N/A",
        style: const TextStyle(shadows: [
          Shadow(
            color: Colors.white,
            blurRadius: 25,
          ),
          Shadow(
            color: Colors.white,
            blurRadius: 25,
          ),
        ]),
      ),
    );
  }
}
