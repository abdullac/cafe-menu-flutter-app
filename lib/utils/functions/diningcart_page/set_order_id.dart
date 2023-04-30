import 'dart:convert';
import 'dart:developer';
import 'dart:math' as math;

import 'package:cafemenu_app/core/model/customer/customer_model.dart';
import 'package:firebase_database/firebase_database.dart';

Future<int> setOrderId() async {
  /// create method for get last number from firebase realtime database.
  DatabaseReference firebaseRef = FirebaseDatabase.instance.ref();
  final ordersListSnapshot =
      await firebaseRef.child("cafeMenu/orders/orderList").get();
  List<int> orderIdList = [];
  for (var element in ordersListSnapshot.children) {
    CustomerModel customerModel =
        CustomerModel.fromJson(jsonDecode(jsonEncode(element.value)));
    if (customerModel.orderId != null) {
      orderIdList.add(customerModel.orderId!);
    }
  }
  int? largeOrderId;
  if (orderIdList.isNotEmpty) {
    largeOrderId = orderIdList.reduce(math.max);
  } else {
    largeOrderId = 100;
  }
  int newOrderId = largeOrderId + 1;

  /// set new order number to irebase realtime database.
  return newOrderId;
}
