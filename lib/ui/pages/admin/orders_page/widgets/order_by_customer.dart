import 'package:cafemenu_app/core/model/order/order_model.dart';
import 'package:cafemenu_app/core/model/available_item/available_item_model.dart';
import 'package:cafemenu_app/ui/pages/admin/orders_page/widgets/ordered_item_by_customer.dart';
import 'package:cafemenu_app/ui/pages/admin/orders_page/widgets/order_item_headings.dart';
import 'package:cafemenu_app/utils/constants/lists.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// this is Pageview itemBuilder for shows each customr orders and details.
class OrderByCustomer extends StatelessWidget {
  final int pageViewItemIndex;
  final AsyncSnapshot<DatabaseEvent> snapshot;
  const OrderByCustomer({
    super.key,
    required this.pageViewItemIndex,
    required this.snapshot,
  });

  @override
  Widget build(BuildContext context) {
    /// get orderModel(ordered by one customer) from orderedList.
    OrderModel orderModel = orderedListFromFireBase[pageViewItemIndex];

    /// get formatedand orderedTime as String.
    String? formattedTime;
    if (orderModel.orderedTime != null) {
      formattedTime =
          DateFormat("dd-MMM-yy  HH:mm aa").format(orderModel.orderedTime!);
    }

    /// list for add orderedItems of this customer.
    List<AvailableItemModel> orderedItemList = [];

    /// get each orderdItem from orderedItemList iterly,
    /// and add each item to orderedItemList.
    for (var orderedItem in orderModel.orderedAvailableItemModelList) {
      orderedItemList.add(AvailableItemModel.fromJson(orderedItem));
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  /// order(by one customer) details.
                  Text("Order Id : ${orderModel.orderId ?? 'N/A'}"),
                  Text("Ordered Time : ${formattedTime ?? 'N/A'}"),
                  Text("Customer Name : ${orderModel.customerName ?? 'N/A'}"),
                  Text("Position Code : ${orderModel.positionCode ?? 'N/A'}"),
                  Text("Total Items : ${orderModel.totalItems ?? 'N/A'}"),
                ],
              ),
              Column(
                children: [
                  /// order pageview item serial number by total number.
                  Text(
                    "${pageViewItemIndex + 1}/${orderedListFromFireBase.length}",
                  ),
                  Visibility(
                    visible: false,
                    child: ElevatedButton(
                        onPressed: () {
                          // ready/delivered all items  button pressed
                        },
                        child: const Text(
                          "Ready/\nDelivered\n All",
                          textAlign: TextAlign.center,
                        )),
                  )
                ],
              )
            ],
          ),

          /// this is hardcoded order item heading
          /// for shows top of order items list
          const OrderItemHeadings(),

          /// listView for show ordredItems List by this(each) customer.
          Expanded(
            child: ListView.builder(
              itemCount: orderedItemList.length,
              shrinkWrap: true,
              itemBuilder: (context, productItemListViewIndex) {
                /// listView itemBuilder for show each ordered item by a customer
                return OrderedItem(
                  orderedItemList: orderedItemList,
                  orderedListViewItemIndex: productItemListViewIndex,
                  orderModel: orderedListFromFireBase[pageViewItemIndex],
                  snapshot: snapshot,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
