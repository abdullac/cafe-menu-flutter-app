import 'package:firebase_database/firebase_database.dart';

orderSaveToFireBaseDatabase(Map<String, dynamic> customerModelJson) {
  DatabaseReference databaseRef = FirebaseDatabase.instance.ref();
  databaseRef.child("cafeMenu/orders/orderList").update({
    "1": customerModelJson
  });
  print("saving...");
  // fireBaseDatabaseReference.child("cafeMenu/menuCard/").set({"itemsSample": [pM, pMt, pMr, pMg]});
}
