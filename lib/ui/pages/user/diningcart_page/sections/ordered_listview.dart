import 'dart:convert';
import 'package:cafemenu_app/core/model/customer/customer_model.dart';
import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/firebase_backend.dart';
import 'package:cafemenu_app/ui/pages/user/diningcart_page/sections/ordered_list_item.dart';
import 'package:cafemenu_app/utils/constants/values.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

/// this widget is listView after pressed confirm orderd button by customer/user
class OrderedListView extends StatelessWidget {
  const OrderedListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    /// stream builder for rebuild orderedListview when any change in fireBase orderedListview child path,
    /// such as item delivered/recieved, recievedTime.
    return StreamBuilder(
      /// get orderedList child referene using FirebaseBackend class.
      stream: FirebaseBackend.orderedListChildRef().onValue,
      builder: (context, snapshot) {
        /// declared empty orderedItemsList(List of availableItem) by one(this) customer/user.
        List<ProductModel> orderedItemsList = [];

        /// declare iterable variable for get all orderedList snapshot from databaseReference.
        Iterable<DataSnapshot> allOrederedListSnapshot;
        if (snapshot.data != null) {
          /// get all orderedList snapshot from databaseReference
          allOrederedListSnapshot = snapshot.data!.snapshot.children;

          /// iter allOrederedListSnapshot with forLoop for get each order item
          /// and convert to OrderModel
          for (var orderItemSnapshotElement in allOrederedListSnapshot) {
            CustomerModel orderModel = CustomerModel.fromJson(
              jsonDecode(
                jsonEncode(orderItemSnapshotElement.value),
              ),
            );

            /// check orderId of each order item for match to this user/cusstomer orderId.
            /// if true then, get list of ordereditem Map (productModelOrderList) from order item.
            /// and iter with forLoop for get ordered item and convert to AvailableItemModel.
            if (orderModel.orderId == orderId) {
              for (var orderedItemMap in orderModel.productModelOrderList) {
                ProductModel orderedItem = ProductModel.fromJson(
                  jsonDecode(
                    jsonEncode(orderedItemMap),
                  ),
                );
                orderedItemsList.add(orderedItem);
              }
            }
          }
        }

        /// listView for shows orderedItems with OrderedListItem itemBuilder
        return ListView.separated(
          itemBuilder: (context, index) {
            return OrderedListItem(orderedItem: orderedItemsList[index]);
          },
          separatorBuilder: (context, index) =>
              Container(height: 2, color: Colors.red),
          itemCount: orderedItemsList.length,
        );
      },
    );
  }
}
