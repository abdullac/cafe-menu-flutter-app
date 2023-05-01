import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/utils/constants/image_links.dart';
import 'package:flutter/material.dart';

/// this widet for foreground Image.
class ItemImageContainer extends StatelessWidget {
  const ItemImageContainer({
    super.key,
    required this.availableItem,
  });

  final ProductModel availableItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        /// foreground Image.
          image: DecorationImage(
        image: NetworkImage(
            availableItem.verticalImageUrl ?? sampleImageUrl),
      )),
    );
  }
}
