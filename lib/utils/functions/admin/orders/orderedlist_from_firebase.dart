import 'dart:convert';
import 'package:cafemenu_app/core/model/customer/customer_model.dart';
import 'package:cafemenu_app/utils/constants/lists.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

/// get new OrderedListsnapshot FromFireBase(ProductModelList by one customer),
/// and iterablely assign to orderedListFromFireBase.
getOrderedListFromFireBase(
    AsyncSnapshot<DatabaseEvent> snapshot) {
  DataSnapshot? orderedListSnapshot;

  if (snapshot.data != null) {
    orderedListSnapshot = snapshot.data!.snapshot;
  }

  /// clear current values from orderedListFromFireBase.
  orderedListFromFireBase.clear();
  if (orderedListSnapshot == null) {
    // orderedListSnapshot = await FirebaseBackend.orderedListChildRef().get();
  } else {
    /// iterablely assign to orderedListFromFireBase.
    for (var orderModelsnapshot in orderedListSnapshot.children) {
      if (orderModelsnapshot.key != null) {
        /// convert orderModelsnapshot to orderModel
        OrderModel orderModel = OrderModel.fromJson(
            jsonDecode(jsonEncode(orderModelsnapshot.value)));

        /// add each orderModel to orderedListFromFireBase
        orderedListFromFireBase.add(orderModel);
      }
    }
  }
}
