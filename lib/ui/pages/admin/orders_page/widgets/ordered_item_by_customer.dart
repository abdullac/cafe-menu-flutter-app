import 'dart:developer';
import 'package:cafemenu_app/core/model/order/order_model.dart';
import 'package:cafemenu_app/core/model/available_item/available_item_model.dart';
import 'package:cafemenu_app/ui/pages/admin/orders_page/widgets/field_item_text.dart';
import 'package:cafemenu_app/core/provider/logics/admin/orders/ordered_item_delivered.dart';
import 'package:cafemenu_app/core/provider/logics/admin/orders/ordered_item_ready.dart';
import 'package:cafemenu_app/utils/functions/show_snackbar.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

/// this is itembuilder of Listview for shows each orderd item by a custmor
class OrderedItem extends StatelessWidget {
  final List<AvailableItemModel> orderedItemList;
  final int orderedListViewItemIndex;
  final OrderModel orderModel;
  final AsyncSnapshot<DatabaseEvent> snapshot;
  const OrderedItem({
    super.key,
    required this.orderedItemList,
    required this.orderedListViewItemIndex,
    required this.orderModel,
    required this.snapshot,
  });

  @override
  Widget build(BuildContext context) {
    /// get orderedItem from orderedItem List using listview item Index.
    AvailableItemModel orderedProdutmodelItem =
        orderedItemList[orderedListViewItemIndex];

    /// ordered itemType convert to String.
    String? itemType;
    if (orderedProdutmodelItem.itemType != null) {
      itemType =
          orderedProdutmodelItem.itemType == ItemType.plate ? 'Plate' : 'Glass';
    }

    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        /// ordered item details under OrderItemHeadings.
        children: [
          /// itemId text
          FieldItemText(
            flex: 10,
            fieldText: "${orderedProdutmodelItem.itemId ?? 'N/A'}",
          ),

          /// itemName text
          FieldItemText(
            flex: 25,
            fieldText: orderedProdutmodelItem.itemName ?? 'N/A',
          ),

          /// categoryName text
          FieldItemText(
            flex: 20,
            fieldText: orderedProdutmodelItem.categoryName ?? 'N/A',
          ),

          /// Ordered Quantity text
          FieldItemText(
            flex: 15,
            fieldText: "${orderedProdutmodelItem.orderedQty ?? 'N/A'}",
          ),

          /// itemType text
          FieldItemText(
            flex: 15,
            fieldText: itemType ?? 'N/A',
          ),

          /// ready/Delivered Button.
          Expanded(
            flex: 15,
            child: ElevatedButton(
                onPressed: () {
                  /// item ready/delivered Button pressed
                  if (orderedProdutmodelItem.itemReady == null) {
                    /// method for change item ready to true when pressed button
                    orderedItemReady(
                        order: orderModel, readyItem: orderedProdutmodelItem);
                  } else if (orderedProdutmodelItem.itemReady == true) {
                    /// method for change item delivered to true when pressed button
                    orderedItemDelivered(
                      order: orderModel,
                      deliveredItem: orderedProdutmodelItem,
                    );
                  } else {
                    /// show message when pressed button after item Delivered
                    showSnackBar("already Delivered this Item");
                    log("readyOrDeliveredNotifier.value = ${orderedProdutmodelItem.itemReady}");
                  }
                },
                /// button text change when streambuilder
                child: Text(orderedProdutmodelItem.itemReady == null
                    ? "Ready"
                    : orderedProdutmodelItem.itemReady == true
                        ? "Delivered"
                        : orderedProdutmodelItem.itemDelevered == true
                            ? "Ok"
                            : "...")),
          )
        ],
      ),
    );
  }
}
