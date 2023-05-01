import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/utils/constants/image_links.dart';
import 'package:flutter/material.dart';

/// this widget shows itemImage and Price
class DinngcartListItemImageContainerAndPrice extends StatelessWidget {
  final ProductModel diningCartItem;
  const DinngcartListItemImageContainerAndPrice({
    super.key,
    required this.diningCartItem,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        /// container for shows iteem image
        Container(
          height: 90,
          width: 90,
          decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.grey[300]!.withOpacity(0.7), width: 2.5),
              shape: BoxShape.circle,
              color: Colors.teal[700],
              /// item image
              image: DecorationImage(
                  image: NetworkImage(
                      diningCartItem.verticalImageUrl ?? sampleImageUrl),
                  fit: BoxFit.cover)),
        ),
        /// container for shows item prie
        Container(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
          margin: const EdgeInsets.only(bottom: 4),
          decoration: BoxDecoration(
            color: Colors.red.withOpacity(0.5),
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          /// item price
          child: Text(diningCartItem.itemPrice != null
              ? "₹ ${diningCartItem.itemPrice}/Pc"
              : "₹ N/A"),
        ),
      ],
    );
  }
}
