import 'dart:convert';
import 'dart:math' as math;
import 'package:cafemenu_app/core/model/order/order_model.dart';
import 'package:cafemenu_app/core/services/firebase/firebase_refs.dart';

/// create method for get last orderId from firebase realtime database.
Future<int> setOrderId() async {
  /// get ordered list snapshot from firebase
  final ordersListSnapshot =
      await FirebaseRefs.orderedListChild().get();
  /// get all orderId and addd to a list while iter orderedList with convert to availableItemModel
  List<int> orderIdList = [];
  for (var orderedItemSnapshot in ordersListSnapshot.children) {
    OrderModel orderedItem =
        OrderModel.fromJson(jsonDecode(jsonEncode(orderedItemSnapshot.value)));
    if (orderedItem.orderId != null) {
      orderIdList.add(orderedItem.orderId!);
    }
  }
  /// find latest/Large orderId and reate new orderId
  int? largeOrderId;
  if (orderIdList.isNotEmpty) {
    largeOrderId = orderIdList.reduce(math.max);
  } else {
    largeOrderId = 100;
  }
  int newOrderId = largeOrderId + 1;

  /// set new orderId to irebase realtime database.
  return newOrderId;
}
