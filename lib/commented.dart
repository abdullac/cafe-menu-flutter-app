
// class Snapshotmodel {
//   String? description;
//   String? name;
//   Snapshotmodel({
//     required this.description,
//     required this.name,
//   });
// }

import 'package:cafemenu_app/core/model/order/order_model.dart';
import 'package:cafemenu_app/core/model/available_item/available_item_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class FirebaseRealtimeDemoScreen extends StatelessWidget {
  // final ref = FirebaseDatabase.instance.reference();
  // FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref('flutterDevsTeam4');

  @override
  Widget build(BuildContext context) {
    readData();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Realtime Database Demo'),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ElevatedButton(
              child: const Text('Create Data'),
              onPressed: () {
                createData();
              },
            ),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
              child: const Text('Read/View Data'),
              onPressed: () {
                readData();
              },
            ),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
              child: const Text('Update Data'),
              onPressed: () {
                updateData();
              },
            ),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
              child: const Text('Delete Data'),
              onPressed: () {
                deleteData();
              },
            ),
            // StreamBuilder(
            //   stream: ref.onChildAdded,
            //   builder: (context,AsyncSnapshot<DatabaseEvent> snapshot) {
            //     print("onAdded ${readData()}");
            //     return Container();
            //   },
            // ),
          ],
        ),
      )), //center
    );
  }

  void createData() {
    ref
        .child("flutterDevsTeam1")
        .set({'name': 'Deepak Nishad', 'description': 'Team Lead'});
    ref.child("flutterDevsTeam2").set(
        {'name': 'Yashwant Kumar', 'description': 'Senior Software Engineer'});
    ref
        .child("flutterDevsTeam3")
        .set({'name': 'Akshay', 'description': 'Software Engineer'});
    ref
        .child("flutterDevsTeam4")
        .set({'name': 'Aditya', 'description': 'Software Engineer'});
    ref
        .child("flutterDevsTeam5")
        .set({'name': 'Shaiq', 'description': 'Associate Software Engineer'});
    ref
        .child("flutterDevsTeam6")
        .set({'name': 'Mohit', 'description': 'Associate Software Engineer'});
    ref
        .child("flutterDevsTeam7")
        .set({'name': 'Naveen', 'description': 'Associate Software Engineer'});
  }
  // void readData(){
  //   ref.once().then((DataSnapshot snapshot) {
  //     print('Data : ${snapshot.value}');
  //   });
  // }

  Future<void> readData() async {
    final event = await ref.once(DatabaseEventType.value);
    final readDatasample = event.snapshot.value ?? " no readData Available ";
    print("readData $readDatasample");
  }

  void updateData() {
    ref.child('flutterDevsTeam1').update({'description': 'CEO'});
    ref.child('flutterDevsTeam2').update({'description': 'Team Lead'});
    ref
        .child('flutterDevsTeam3')
        .update({'description': 'Senior Software Engineer'});
  }

  void deleteData() {
    ref.child('flutterDevsTeam1').remove();
    ref.child('flutterDevsTeam2').remove();
    ref.child('flutterDevsTeam3').remove();
    // ref.parent?.remove();
  }
}

class ObjRealTimeDataBaseFirebase extends StatelessWidget {
  const ObjRealTimeDataBaseFirebase({super.key});

  @override
  Widget build(BuildContext context) {
    OrderModel cM =
        const OrderModel(orderedAvailableItemModelList: [
          // "sampleList", "sampleListY"
          ]);
    var cmJson = cM.toJson();
    DatabaseReference dRef = FirebaseDatabase.instance.ref();
    dRef.child("sampleObj").set({"name": cmJson});
    return StreamBuilder(
      stream: dRef.onChildChanged,
      builder: (context, snapshot) {
        // CustomerModel.fromJson(snapshot.data);
        print(
          // snapshot.requireData.snapshot.value,
          snapshot.data!.snapshot.value,
        );
        return SizedBox();
      },
    );
  }
}


// {"menuCard":{"category":{"categoryType":{"plate":["Shaway","Shawarma","Broast","Burger","Sandwitch","Snack"]}}}}


/////////////////////////////////
///
//////////////////////////////////////////

DatabaseReference fireBaseDatabaseReference = FirebaseDatabase.instance.ref();

setItemsList() {
  final pM = const AvailableItemModel(
          itemId: 501,
          itemName: "Shaway Qr",
          categoryName: "Shaway",
          itemPrice: 99,
          itemType: ItemType.plate,
          availableQty: 24)
      .toJson();
  final pMt = const AvailableItemModel(
          itemId: 504,
          itemName: "Shawarma Roll",
          categoryName: "Shawarma",
          itemPrice: 79,
          itemType: ItemType.plate,
          availableQty: 100)
      .toJson();
  final pMr = const AvailableItemModel(
          itemId: 504,
          itemName: "Shawarma Roll",
          categoryName: "Shawarma",
          itemPrice: 79,
          itemType: ItemType.plate,
          availableQty: 100)
      .toJson();
  final pMg = const AvailableItemModel(
          itemId: 502,
          itemName: "Shaway Hf",
          categoryName: "Shaway",
          itemPrice: 189,
          itemType: ItemType.plate,
          availableQty: 27)
      .toJson();

  fireBaseDatabaseReference.child("cafeMenu/menuCard/").set({
    "itemsSample": [pM, pMt, pMr, pMg]
  });
}

updateItemsList() {
  final pM = const AvailableItemModel(
          itemId: 501,
          itemName: "Qr Shaway",
          categoryName: "Shaway",
          itemPrice: 99,
          itemType: ItemType.plate,
          availableQty: 24)
      .toJson();
  final pMt = const AvailableItemModel(
          itemId: 504,
          itemName: "Shawarma Roll",
          categoryName: "Shawarma",
          itemPrice: 79,
          itemType: ItemType.plate,
          availableQty: 100)
      .toJson();

  fireBaseDatabaseReference.child("cafeMenu/menuCard/").update({
    "itemsSample": [pM, pMt]
  });
}

// Future<List<AvailableItemModel>> getItemslist() async {
//   final productItemsPath =
//       fireBaseDatabaseReference.child("cafeMenu/menuCard/itemsSample");
//   final event = await productItemsPath.once(DatabaseEventType.value);
//   final readItemsValues = event.snapshot.value ?? [];
//   final values;
//   if (readItemsValues.runtimeType == List<Object?>) {
//     values = readItemsValues as List;
//   } else {
//     readItemsValues as Map<dynamic, dynamic>;
//     values = readItemsValues.values;
//   }
//   List<AvailableItemModel> listOfProductModel = [];
//   for (var element in values) {
//     if (element != null) {
//       var itemjsonString = jsonEncode(element);
//       var itemJson = jsonDecode(itemjsonString);
//       listOfProductModel.add(AvailableItemModel.fromJson(itemJson));
//     }
//   }
//   // final itemsListJson = jsonEncode(readItemsValues);
//   // final productListModel = ProductListModel(jsonDecode(itemsListJson));
//   return listOfProductModel;
// }


//  
// "Price" : 189, "categoryName" : "Shaway", "itemId" : 156 ,"itemName" :"Hf Shaway", "itemType" :ItemType.plate

/////////////////////////////////////////