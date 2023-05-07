import 'dart:convert';
import 'package:cafemenu_app/core/model/order/order_model.dart';
import 'package:cafemenu_app/core/model/available_item/available_item_model.dart';
import 'package:cafemenu_app/core/services/firebase/firebase_refs.dart';
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
    return  StreamBuilder(
            /// get orderedList child referene using FirebaseBackend class.
            stream: FirebaseRefs.orderedListChild().onValue,
            builder: (context, snapshot) {
              /// declared empty orderedItemsList(List of availableItem) by one(this) customer/user.
              List<AvailableItemModel> orderedItemsList = [];

              /// declare iterable variable for get all orderedList snapshot from databaseReference.
              Iterable<DataSnapshot> allOrederedListSnapshot;
              if (snapshot.data != null) {
                /// get all orderedList snapshot from databaseReference
                allOrederedListSnapshot = snapshot.data!.snapshot.children;

                /// iter allOrederedListSnapshot with forLoop for get each order item
                /// and convert to OrderModel
                for (var orderItemSnapshotElement in allOrederedListSnapshot) {
                  OrderModel orderModel = OrderModel.fromJson(
                    jsonDecode(
                      jsonEncode(orderItemSnapshotElement.value),
                    ),
                  );

                  /// check orderId of each order item for match to this user/cusstomer orderId.
                  /// if true then, get list of ordereditem Map (productModelOrderList) from order item.
                  /// and iter with forLoop for get ordered item and convert to AvailableItemModel.
                  if (orderModel.orderId == orderId) {
                    for (var orderedItemMap
                        in orderModel.orderedAvailableItemModelList) {
                      AvailableItemModel orderedItem =
                          AvailableItemModel.fromJson(
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
