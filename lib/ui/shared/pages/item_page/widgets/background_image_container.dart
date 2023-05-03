import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/ui/shared/pages/item_page/widgets/item_image_container.dart';
import 'package:cafemenu_app/utils/constants/image_links.dart';
import 'package:flutter/material.dart';

/// this widget show Background and frground item Image.
class BackgroundAndForGroundImageContainer extends StatelessWidget {
  const BackgroundAndForGroundImageContainer({
    super.key,
    required this.availableItem,
  });

  final AvailableItemModel availableItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          /// background Image.
          image: DecorationImage(
              opacity: 0.3,
              image: NetworkImage(
                  availableItem.verticalImageUrl ?? sampleImageUrl),
              fit: BoxFit.cover)),
      /// forground Image container.
      child: ItemImageContainer(availableItem: availableItem),
    );
  }
}
