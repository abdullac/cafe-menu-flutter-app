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
  static DatabaseReference orderedListChildRef() {
    return FirebaseDatabase.instance.ref("cafeMenu/orders/orderList");
  }
}
