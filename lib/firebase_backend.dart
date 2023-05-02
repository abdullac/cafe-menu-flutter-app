import 'package:firebase_database/firebase_database.dart';

/// this class for get referense of firebase database backend
class FirebaseBackend {
  /// firebase databadse reference
  static DatabaseReference databaseRef = FirebaseDatabase.instance.ref();

  /// available Items reference
  static DatabaseReference availableItemsChildRef() {
    return databaseRef.child("cafeMenu/menuCard/itemsSample");
  }

  /// orderedList reference
  static DatabaseReference orderedListChildRef([String? endChild]) {
    if (endChild != null) {
      return FirebaseDatabase.instance
          .ref("cafeMenu/orders/orderList/$endChild");
    } else {
      return FirebaseDatabase.instance.ref("cafeMenu/orders/orderList");
    }
  }

  /// main admin refereence
  static DatabaseReference mainAminChildRef() {
    return databaseRef.child("cafeMenu/admin/mainAdmin");
  }

  static DatabaseReference orderedItemsListChildRef(String? orderedListKey) {
    return databaseRef.child(
        "cafeMenu/orders/orderList/$orderedListKey/productModelOrderList");
  }
}
