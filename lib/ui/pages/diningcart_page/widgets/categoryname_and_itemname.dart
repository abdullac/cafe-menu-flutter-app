import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/utils/constants/image_links.dart';
import 'package:flutter/material.dart';

/// this widget for shows category name and item Name with background item image
class DiningcartListItemCategoryNameAndItemName extends StatelessWidget {
  const DiningcartListItemCategoryNameAndItemName({
    super.key,
    required this.diningCartItem,
  });

  final ProductModel diningCartItem;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      /// this Container for shows category name and item Name with background item image
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(8),
            topRight: Radius.circular(8),
          ),

          /// background image
          image: DecorationImage(
              image: NetworkImage(
                  diningCartItem.verticalImageUrl ?? sampleImageUrl),
              fit: BoxFit.cover),
        ),
      /// this Container for shows category name and item Name with background white gradient on item bakground image
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(8), topRight: Radius.circular(8)),
            color: Colors.blue.withOpacity(1),
            /// white gradient
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.white.withOpacity(0.85),
                Colors.white.withOpacity(0.8),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// cateegory name
              Text(
                diningCartItem.categoryName ?? "Category Name N/A",
                style: const TextStyle(fontSize: 15),
              ),
              /// item name
              Text(
                diningCartItem.itemName ?? "Item Name N/A",
                maxLines: 2,
                overflow: TextOverflow.fade,
                style: TextStyle(
                    fontSize: diningCartItem.itemName != null &&
                            diningCartItem.itemName!.length > 15
                        ? 12
                        : 20,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
