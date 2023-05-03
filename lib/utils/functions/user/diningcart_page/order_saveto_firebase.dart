import 'package:cafemenu_app/firebase_backend.dart';
import 'package:cafemenu_app/utils/functions/show_snackbar.dart';
import 'package:firebase_database/firebase_database.dart';

/// method for save Orde rModel json to firebase Database.
orderSaveToFireBaseDatabase(Map<String, dynamic> orderModelJson) async {
  /// get already orderListSnapshot from firbase database for get latest firebase Key and create new Key,
  /// becuase, firebase save/update data as json(Map), not as List.
  DataSnapshot getOrderListSnapshot =
      await FirebaseBackend.orderedListChildRef().get();
  /// already orderlist convert to list
  var getOrderListSnapshotByList = getOrderListSnapshot.children.toList();
  /// iter already orderList and get all Key
  List<int> orderListKeys = [];
  for (var orderItemSnapshot in getOrderListSnapshotByList) {
    if (orderItemSnapshot.key != null) {
      orderListKeys.add(int.parse(orderItemSnapshot.key!));
    }
  }
  /// iter and Match all Keys for find latest key and create new Key
  int newKey = 0;
  for (int baseIndex = 0; baseIndex < orderListKeys.length - 1; baseIndex++) {
    for (int subIndex = baseIndex + 1;
        subIndex < orderListKeys.length;
        subIndex++) {
      if (orderListKeys[baseIndex] < orderListKeys[subIndex]) {
        (newKey = orderListKeys[subIndex] + 1);
      }
    }
  }

  /// update(save) orderId to fireBase database with new Key.
  showSnackBar("Your Order Confirming...");
  await FirebaseBackend.orderedListChildRef("$newKey").update(orderModelJson);
  showSnackBar("Your Order Confirmed...");
}
