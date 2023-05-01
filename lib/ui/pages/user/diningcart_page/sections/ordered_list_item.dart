import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// this is item builder of ordered item ListView
class OrderedListItem extends StatelessWidget {
  final ProductModel orderedItem;
  const OrderedListItem({
    super.key,
    required this.orderedItem,
  });

  @override
  Widget build(BuildContext context) {
    /// time format convert
    String? recievedTime;
    if (orderedItem.recievedTime != null) {
      recievedTime = DateFormat("HH:MM aa").format(orderedItem.recievedTime!);
    }
    return Column(
      /// shows ordered item details.
      children: [
        Text(orderedItem.itemName ?? 'N/A'),
        Text(orderedItem.categoryName ?? 'N/A'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Item Id : ${orderedItem.itemId ?? 'N/A'}"),
            Text(
                "Status : ${orderedItem.itemReady == true && orderedItem.itemDelevered != true ? "Item Ready" : orderedItem.itemReady == true && orderedItem.itemDelevered == true ? "Item Recieved" : "Item Ordered"}"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Price Per Quantity : ${orderedItem.itemPrice ?? 'N/A'}"),
            Text("Oredeered Quantity : ${orderedItem.orderedQty ?? 'N/A'}"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Text("${orderedItem.itemType ?? 'N/A'}"),
            Text("Recieved Time : ${recievedTime ?? 'N/A'}"),
          ],
        ),
      ],
    );
  }
}
