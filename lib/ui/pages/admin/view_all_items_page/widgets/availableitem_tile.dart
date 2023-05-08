import 'package:cafemenu_app/core/model/available_item/available_item_model.dart';
import 'package:cafemenu_app/ui/pages/admin/add_item_page/page_add_item.dart';
import 'package:cafemenu_app/utils/constants/image_links.dart';
import 'package:cafemenu_app/core/provider/logics/admin/view_all_items/deleteitem_from_firebase.dart';
import 'package:flutter/material.dart';

/// item builder for show each availableItem
class AvailableItemTile extends StatelessWidget {
  final AvailableItemModel availableItem;
  const AvailableItemTile({
    super.key,
    required this.availableItem,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        /// imagee widget
        Image(
          image: NetworkImage(availableItem.verticalImageUrl ?? sampleImageUrl),
        ),

        /// itemName and categoryName
        Text("Item Name : ${availableItem.itemName ?? 'N/A'}"),
        Text("Category Name : ${availableItem.categoryName ?? 'N/A'}"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            /// itemId and Price
            Text("Item Id : ${availableItem.itemId ?? 'N/A'}"),
            Text("Item Price : ${availableItem.itemPrice ?? 'N/A'}"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            /// itemType and isClosed
            Text(
                "Item Type : ${availableItem.itemType == ItemType.plate ? "Plate" : availableItem.itemType == ItemType.glass ? "Glass" : 'N/A'}"),
            Text("Is Closed : ${availableItem.isClosed ?? 'N/A'}"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            /// availableQty and leftQty
            Text("Available Qty : ${availableItem.availableQty ?? 'N/A'}"),
            Text("Left Qty : ${availableItem.leftQty ?? 'N/A'}"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            /// edit and delete Buttons
            ElevatedButton(
              onPressed: () {
                // item Edit button pressed
                editItemToDatabase(context, availableItem);
              },
              child: const Text("Edit Item"),
            ),
            ElevatedButton(
              onPressed: () {
                // item Delete button pressed
                deleteItemFromDataBase(availableItem.itemId);
              },
              child: const Text("Delete Item"),
            ),
          ],
        ),
      ],
    );
  }
}

/// method for navigate to PageAddOrEditItem when press edit buttom.
editItemToDatabase(BuildContext context, AvailableItemModel availableItemModel) {
  /// navigator to PageAddOrEditItem
  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
    return PageAddOrEditItem(
      editItem: availableItemModel,
    );
  }));
}
