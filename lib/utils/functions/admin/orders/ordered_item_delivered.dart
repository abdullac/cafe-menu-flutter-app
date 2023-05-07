import 'dart:convert';
import 'package:cafemenu_app/core/model/order/order_model.dart';
import 'package:cafemenu_app/core/model/available_item/available_item_model.dart';
import 'package:cafemenu_app/core/services/firebase/firebase_refs.dart';

/// method for item Delivered value change to true when pressed button
Future orderedItemDelivered(
    {required OrderModel order,
    required AvailableItemModel deliveredItem}) async {
  DateTime recievedTime = DateTime.now();

  /// get firebase orderedList snapshot child path
  final orderListSnapShot = await FirebaseRefs.orderedListChild().get();
  String? getOrderListKey;
  String? getOrderedItemKey;

  /// iter orederd list snapshot for get orderListKey
  for (var orderedListSnapshotlement in orderListSnapShot.children) {
    /// item snapshot convert to orderModel
    OrderModel orderModel = OrderModel.fromJson(
        jsonDecode(jsonEncode(orderedListSnapshotlement.value)));

    /// match this orderedItem orderId with snapshot ordered item orderId,
    /// and get Key.
    if (order.orderId == orderModel.orderId) {
      getOrderListKey = orderedListSnapshotlement.key;

      /// get firebase orderedItemsList snapshot child path
      final orderedItemsListSnapShot =
          await FirebaseRefs.orderedItemsListChild(getOrderListKey).get();

      /// iter ordered items list snapshot for get orderedItem firebase key
      for (var orderItemsnapshot in orderedItemsListSnapShot.children) {
        /// convert to availableItemModel for get itemId
        AvailableItemModel orderedItem = AvailableItemModel.fromJson(
            jsonDecode(jsonEncode(orderItemsnapshot.value)));

        if (deliveredItem.itemId == orderedItem.itemId) {
          /// get itemId
          getOrderedItemKey = orderItemsnapshot.key;

          /// update to firebase.
          await FirebaseRefs.orderedItemsListChild(getOrderListKey)
              .child("/$getOrderedItemKey")
              // .update(newProductModel.toJson());
              .update({"itemDelevered": true, "recievedTime": "$recievedTime"});
        }
      }
    }
  }
}
