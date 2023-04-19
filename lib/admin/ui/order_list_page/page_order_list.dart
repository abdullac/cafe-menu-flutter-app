import 'dart:convert';
import 'package:cafemenu_app/core/model/customer/customer_model.dart';
import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

List<CustomerModel> orderedListFromFireBase = [];

class PageOrderPageView extends StatelessWidget {
  const PageOrderPageView({Key? key}) : super(key: key);

  static ValueNotifier<List<CustomerModel>> orderedListNotifier =
      ValueNotifier(orderedListFromFireBase);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // await getOrderedListFromFireBase();
    });
    return ValueListenableBuilder(
        valueListenable: orderedListNotifier,
        builder: (context, newValue, _) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                ElevatedButton(
                  onPressed: () {
                    // appBar done Button pressed
                  },
                  child: const Text("Done"),
                ),
              ],
            ),
            body: SafeArea(
                child: PageView.builder(
              itemCount: orderedListFromFireBase.length,
              itemBuilder: (context, pageViewItemIndex) {
                return AllOrderedItems(
                  pageViewItemIndex: pageViewItemIndex,
                );
              },
            )),
          );
        });
  }
}

/// getOrderList(CustomerModelList/ orders -> orderList in from firebase)
// List<CustomerModel> OrderedList = [];
List<String> orderedList = ["fgfg", "fgf", "gfd", "gdfg", "gdfg"];

class AllOrderedItems extends StatelessWidget {
  final int pageViewItemIndex;
  const AllOrderedItems({
    super.key,
    required this.pageViewItemIndex,
  });

  @override
  Widget build(BuildContext context) {
    CustomerModel customerModel = orderedListFromFireBase[pageViewItemIndex];
    String? formattedTime;
    if (customerModel.orderedTime != null) {
      formattedTime =
          DateFormat("dd-MMM-yy  HH:mm aa").format(customerModel.orderedTime!);
    }
    List<ProductModel> orderedItemProductModelList = [];
    customerModel.productModelOrderList.forEach((element) {
      orderedItemProductModelList.add(ProductModel.fromJson(element));
    });
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      PageOrderPageView.pageViewIndexNotifier.value = pageViewItemIndex;
      PageOrderPageView.pageViewIndexNotifier.notifyListeners();
    });

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text("Order Id : ${customerModel.orderId ?? 'N/A'}"),
                  Text("Ordered Time : ${formattedTime ?? 'N/A'}"),
                  Text(
                      "Customer Name : ${customerModel.customerName ?? 'N/A'}"),
                  Text(
                      "Position Code : ${customerModel.positionCode ?? 'N/A'}"),
                  Text("Total Items : ${customerModel.totalItems ?? 'N/A'}"),
                ],
              ),
              Column(
                children: [
                  Text(
                      "${pageViewItemIndex + 1}/${orderedListFromFireBase.length}")
                ],
              )
            ],
          ),
          const ProductModelHeadings(),
          Expanded(
            child: ListView.builder(
              itemCount: orderedItemProductModelList.length,
              shrinkWrap: true,
              itemBuilder: (context, productItemListViewIndex) {
                return OrderedItem(
                  orderedItemProductModelList: orderedItemProductModelList,
                  productItemListViewIndex: productItemListViewIndex,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProductModelHeadings extends StatelessWidget {
  const ProductModelHeadings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        FieldItemText(flex: 10, fieldText: "Item\nId", isBold: true),
        FieldItemText(flex: 25, fieldText: "Item\nName", isBold: true),
        FieldItemText(flex: 20, fieldText: "Category\nName", isBold: true),
        FieldItemText(flex: 15, fieldText: "Ordered\nQuantity", isBold: true),
        FieldItemText(flex: 15, fieldText: "Item\nType", isBold: true),
        FieldItemText(flex: 15, fieldText: "Item\nAction", isBold: true),
      ],
    );
  }
}

/// getOrderedListFromFireBase(ProductModelList by one customer)
// and add to  List<ProductModel> orderedListFromFireBase = [];
Future<void> getOrderedListFromFireBase() async {
  DatabaseReference firebaseRef = FirebaseDatabase.instance.ref();
  DataSnapshot orderedListSnapshot =
      await firebaseRef.child("cafeMenu/orders/orderList").get();
  Map<dynamic, dynamic> orderedListByMap = {};
  for (var element in orderedListSnapshot.children) {
    if (element.key != null) {
      String firebaseKey = (element.key!).toString();
      CustomerModel customerModel =
          CustomerModel.fromJson(jsonDecode(jsonEncode(element.value)));
      orderedListFromFireBase.add(customerModel);
    }
  }
  print(orderedListFromFireBase);
  PageOrderPageView.orderedListNotifier.value = orderedListFromFireBase;
  PageOrderPageView.orderedListNotifier.notifyListeners();
}

class OrderedItem extends StatelessWidget {
  final List<ProductModel> orderedItemProductModelList;
  final int productItemListViewIndex;
  const OrderedItem({
    super.key,
    required this.orderedItemProductModelList,
    required this.productItemListViewIndex,
  });

  @override
  Widget build(BuildContext context) {
    ProductModel orderedProdutmodelItem =
        orderedItemProductModelList[productItemListViewIndex];
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
        children: [
          FieldItemText(
              flex: 10, fieldText: "${orderedProdutmodelItem.itemId ?? 'N/a'}"),
          FieldItemText(
              flex: 25, fieldText: orderedProdutmodelItem.itemName ?? 'N/A'),
          FieldItemText(
              flex: 20,
              fieldText: orderedProdutmodelItem.categoryName ?? 'N/A'),
          FieldItemText(
              flex: 15,
              fieldText: "${orderedProdutmodelItem.orderedQty ?? 'N/A'}"),
          FieldItemText(flex: 15, fieldText: itemType ?? 'N/A'),
          Expanded(
            flex: 15,
            child: ElevatedButton(
                onPressed: () {
                  /// ready Button
                },
                child: const Text("Rdy\/\nDlvrd")),
          )
        ],
      ),
    );
  }
}

class FieldItemText extends StatelessWidget {
  final int flex;
  final String fieldText;
  final bool? isBold;
  const FieldItemText({
    super.key,
    required this.flex,
    required this.fieldText,
    this.isBold,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: flex,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            fieldText,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: isBold == true ? FontWeight.bold : FontWeight.w400),
          ),
        ));
  }
}
