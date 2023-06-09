import 'dart:convert';
import 'dart:developer';
import 'package:cafemenu_app/core/model/order/order_model.dart';
import 'package:cafemenu_app/core/model/available_item/available_item_model.dart';
import 'package:cafemenu_app/core/services/firebase/firebase_refs.dart';

/// method for item ready value change to true when pressed button
Future orderedItemReady(
    {required OrderModel order, required AvailableItemModel readyItem}) async {
                  log("orderedItemReady 1");
  /// get firebase orderedList snapshot child path
  final orderListSnapShot = await FirebaseRefs.orderedListChild().get();
  String? getOrderListKey;
  String? getOrderedItemKey;

  /// iter orederd list snapshot for get orderListKey
  for (var orderedListSnapshotlement in orderListSnapShot.children) {
                  log("orderedItemReady 2"); 
    /// item snapshot convert to orderModel
    OrderModel orderModel = OrderModel.fromJson(
        jsonDecode(jsonEncode(orderedListSnapshotlement.value)));

    /// match this orderedItem orderId with snapshot ordered item orderId,
    /// and get Key.
    if (order.orderId == orderModel.orderId) {
                  log("orderedItemReady 3");
      getOrderListKey = orderedListSnapshotlement.key;

      /// get firebase orderedItemsList snapshot child path
      final orderedItemsListSnapShot =
          await FirebaseRefs.orderedItemsListChild(getOrderListKey).get();

                  log("orderedItemReady ${orderedItemsListSnapShot.children}");
      /// iter ordered items list snapshot for get orderedItem firebase key
      for (var orderedItemSnapshot in orderedItemsListSnapShot.children) {
                  log("orderedItemReady 4");
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
          await FirebaseRefs.orderedItemsListChild(getOrderListKey)
              .child("/$getOrderedItemKey")
              .update(orderedItemModified.toJson());
        }
      }
    }
  }
}
