import 'dart:math';

import 'package:cafemenu_app/core/services/firebase/firebase_refs.dart';
import 'package:cafemenu_app/utils/functions/show_snackbar.dart';
import 'package:firebase_database/firebase_database.dart';

/// method for save Orde rModel json to firebase Database.
orderSaveToFireBaseDatabase(Map<String, dynamic> orderModelJson) async {
  /// get already orderListSnapshot from firbase database for get latest firebase Key and create new Key,
  /// becuase, firebase save/update data as json(Map), not as List.
  DataSnapshot getOrderListSnapshot =
      await FirebaseRefs.orderedListChild().get();

  /// already orderlist convert to list for create new firebase Key
  List<DataSnapshot> getOrderListSnapshotByList =
      getOrderListSnapshot.children.toList();

  /// iter already orderList and get all Key
  List<int> orderListKeys = [];
  for (var orderItemSnapshot in getOrderListSnapshotByList) {
    if (orderItemSnapshot.key != null) {
      orderListKeys.add(int.parse(orderItemSnapshot.key!));
    }
  }

  /// iter and Match all Keys for find latest key and create new Key
  int newKey = 0;
  if (orderListKeys.isNotEmpty) {
    newKey = (orderListKeys.reduce(max)) + 1;
  }

  /// update(save) orderId to fireBase database with new Key.
  showSnackBar("Your Order Confirming...");
  await FirebaseRefs.orderedListChild("$newKey").update(orderModelJson);
  showSnackBar("Your Order Confirmed");
}
