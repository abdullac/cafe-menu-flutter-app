import 'package:firebase_database/firebase_database.dart';

orderSaveToFireBaseDatabase(Map<String, dynamic> customerModelJson) async {
  DatabaseReference databaseRef = FirebaseDatabase.instance.ref();

  DataSnapshot getOrderListSnapshot =
      await databaseRef.child("cafeMenu/orders/orderList").get();
  var getOrderListSnapshotByList = getOrderListSnapshot.children.toList();

  List<int> orderListKeys = [];
  for (var element in getOrderListSnapshotByList) {
    if (element.key != null) {
      orderListKeys.add(int.parse(element.key!));
    }
  }
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

  await databaseRef
      .child("cafeMenu/orders/orderList/$newKey")
      .update(customerModelJson);
  print("saving...");
  // fireBaseDatabaseReference.child("cafeMenu/menuCard/").set({"itemsSample": [pM, pMt, pMr, pMg]});
}
