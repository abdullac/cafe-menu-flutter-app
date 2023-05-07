import 'package:cafemenu_app/core/model/available_item/available_item_model.dart';
import 'package:flutter/material.dart';

/// this widget is text for show Item Name
class ItemNameText extends StatelessWidget {
  const ItemNameText({
    super.key,
    required this.availableItem,
  });

  final AvailableItemModel availableItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      /// item name text.
      child: Text(
        availableItem.itemName ?? "Item Name N/A",
        style: const TextStyle(fontWeight: FontWeight.w500, shadows: [
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
