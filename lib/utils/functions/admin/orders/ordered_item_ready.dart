import 'dart:convert';
import 'package:cafemenu_app/core/model/customer/customer_model.dart';
import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/firebase_backend.dart';

/// method for item ready value change to true when pressed button
Future orderedItemReady(
    {required OrderModel order, required AvailableItemModel readyItem}) async {
  /// get firebase orderedList snapshot child path
  final orderListSnapShot = await FirebaseBackend.orderedListChildRef().get();
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
          await FirebaseBackend.orderedItemsListChildRef(getOrderListKey).get();

      /// iter ordered items list snapshot for get orderedItem firebase key
      for (var orderedItemSnapshot in orderedItemsListSnapShot.children) {
        /// convert to availableItemModel for get itemId
        AvailableItemModel orderedItem = AvailableItemModel.fromJson(
            jsonDecode(jsonEncode(orderedItemSnapshot.value)));
        if (readyItem.itemId == orderedItem.itemId) {
          /// get itemId
          getOrderedItemKey = orderedItemSnapshot.key;

          /// modify orderedItem for channg ItemReady to true.
          AvailableItemModel orderedItemModified =
              readyItem.copyWith(itemReady: true);

          /// update to firebase.
          await FirebaseBackend.orderedItemsListChildRef(getOrderListKey)
              .child("/$getOrderedItemKey")
              .update(orderedItemModified.toJson());
        }
      }
    }
  }
}
