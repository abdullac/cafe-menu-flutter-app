import 'dart:convert';
import 'dart:math' as math;
import 'package:cafemenu_app/core/model/customer/customer_model.dart';
import 'package:cafemenu_app/firebase_backend.dart';

/// create method for get last orderId from firebase realtime database.
Future<int> setOrderId() async {
  /// get ordered list snapshot from firebase
  final ordersListSnapshot =
      await FirebaseBackend.orderedListChildRef().get();
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
