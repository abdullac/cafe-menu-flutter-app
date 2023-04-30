import 'dart:convert';
import 'dart:developer';

import 'package:cafemenu_app/core/model/customer/customer_model.dart';
import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/ui/pages/diningcart_page/page_diningcart.dart';
import 'package:cafemenu_app/ui/pages/diningcart_page/widgets/diningcart_item.dart';
import 'package:cafemenu_app/utils/constants/lists.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// int orderLength = 5;
// int additionalOrderLength = 3;
// int runningOrderLength = 2;
// int length = orderLength + additionalOrderLength + runningOrderLength;

class DiningCartItemListview extends StatelessWidget {
  const DiningCartItemListview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: PageDiningCart.diningCartListViewNotifier,
        builder: (context, newValue, _) {
          return newValue == "oredredList"
              ? OrderedListView()
              : Center(
                  child: ListView.separated(
                    itemCount: diningCartList.length,
                    itemBuilder: ((context, index) => DiningCartItem(
                          index: index,
                          productModellist: diningCartList,
                        )),
                    separatorBuilder: (context, index) {
                      // if (index == orderLength - 1 && additionalOrderLength > 0) {
                      //   return container(Colors.cyan, "Additional");
                      // } else if (index == (orderLength + additionalOrderLength - 1) &&
                      //     runningOrderLength > 0) {
                      //   return container(Colors.deepOrange, "Running");
                      // } else {
                      return const SizedBox();
                      // }
                    },
                  ),
                );
        });
  }
}

Widget container(Color color, String title) => Container(
      height: 30,
      color: color,
      child: Center(child: Text(title)),
    );

class OrderedListView extends StatelessWidget {
  const OrderedListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    DatabaseReference firebaseRef =
        FirebaseDatabase.instance.ref("cafeMenu/orders/orderList");
    return StreamBuilder(
        stream: firebaseRef.onValue,
        builder: (context, snapshot) {
          List<ProductModel> orderedItemsList = [];
          Iterable<DataSnapshot> orederedListSnapshot;
          if (snapshot.data != null) {
            orederedListSnapshot = snapshot.data!.snapshot.children;
            for (var elementOrderedItem in orederedListSnapshot) {
              CustomerModel customerModel = CustomerModel.fromJson(
                  jsonDecode(jsonEncode(elementOrderedItem.value)));
              // log(customerModel.toString());
              if (customerModel.orderId == orderId) {
                for (var elementCustomerModel
                    in customerModel.productModelOrderList) {
                  ProductModel productModel = ProductModel.fromJson(
                      jsonDecode(jsonEncode(elementCustomerModel)));
                  orderedItemsList.add(productModel);
                }
              }
            }
          }
          return ListView.separated(
            itemBuilder: (context, index) {
              return OrderedListItem(productModel: orderedItemsList[index]);
            },
            separatorBuilder: (context, index) =>
                Container(height: 2, color: Colors.red),
            itemCount: orderedItemsList.length,
          );
        });
  }
}

class OrderedListItem extends StatelessWidget {
  final ProductModel productModel;
  const OrderedListItem({
    super.key,
    required this.productModel,
  });

  @override
  Widget build(BuildContext context) {
    String? recievedTime;
    if (productModel.recievedTime != null) {
      recievedTime = DateFormat("HH:MM aa").format(productModel.recievedTime!);
    }
    return Column(
      children: [
        Text(productModel.itemName ?? 'N/A'),
        Text(productModel.categoryName ?? 'N/A'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Item Id : ${productModel.itemId ?? 'N/A'}"),
            Text(
                "Status : ${productModel.itemReady == true && productModel.itemDelevered != true ? "Item Ready" : productModel.itemReady == true && productModel.itemDelevered == true ? "Item Recieved" : "Item Ordered"}"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Price Per Quantity : ${productModel.itemPrice ?? 'N/A'}"),
            Text("Oredeered Quantity : ${productModel.orderedQty ?? 'N/A'}"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Text("${productModel.itemType ?? 'N/A'}"),
            Text("Recieved Time : ${recievedTime ?? 'N/A'}"),
          ],
        ),
      ],
    );
  }
}
