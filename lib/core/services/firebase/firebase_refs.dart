import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';

/// this class for get referense of firebase database backend
class FirebaseRefs {
  /// firebase databadse reference
  static DatabaseReference database = FirebaseDatabase.instance.ref();

  /// firebase storege reference
  static Reference storage = FirebaseStorage.instance.ref();

  /// available Items reference
  static DatabaseReference availableItemsChild() {
    return database.child("cafeMenu/menuCard/itemsSample");
  }

  /// orderedList reference
  static DatabaseReference orderedListChild([String? endChild]) {
    if (endChild != null) {
      return database.child("cafeMenu/orders/orderList/$endChild");
    } else {
      return database.child("cafeMenu/orders/orderList");
    }
  }

  /// main admin refereence
  static DatabaseReference mainAminChild() {
    return database.child("cafeMenu/admin/mainAdmin");
  }

  /// orderedList reference
  static DatabaseReference orderedItemsListChild(String? orderedListKey) {
    return database.child(
        "cafeMenu/orders/orderList/$orderedListKey/orderedAvailableItemModelList");
  }

  /// image storage reference
  static Reference imageStorage(String imagePathWithImageName) {
    return storage.child(imagePathWithImageName);
  }

  /// loation reference
  static DatabaseReference location() {
    return database.child("cafeMenu/admin/location");
  }

   /// distence loation reference
  static DatabaseReference distenceLocation() {
    return database.child("cafeMenu/admin/distenceLocation");
  }

  /// admin firebase notification token reference
  static DatabaseReference adminNotificationToken() {
    return database.child("cafeMenu/admin/fcmToken");
  }

}
