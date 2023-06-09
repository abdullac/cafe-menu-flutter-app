import 'package:cafemenu_app/core/model/available_item/available_item_model.dart';
import 'package:flutter/material.dart';

/// this widget is text for show Category Name
class CategoryNameText extends StatelessWidget {
  const CategoryNameText({
    super.key,
    required this.availableItem,
  });

  final AvailableItemModel availableItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      /// Category name text.
      child: Text(
        availableItem.categoryName ?? "Category Name N/A",
        style: const TextStyle(fontWeight: FontWeight.bold, shadows: [
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