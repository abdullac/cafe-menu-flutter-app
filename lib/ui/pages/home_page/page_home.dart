import 'dart:convert';

import 'package:cafemenu_app/core/model/customer/customer_model.dart';
import 'package:cafemenu_app/core/model/product/product_list_model.dart';
import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/main.dart';
import 'package:cafemenu_app/ui/pages/menucard_page/page_menucard.dart';
import 'package:cafemenu_app/utils/constants/size.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class PageHome extends StatelessWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.green,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 100),
            child: ElevatedButton(
              onPressed: () async {
                // MenuCard button pressed
                final productListModel = await getItemslist();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const PageMenuCard()));
              },
              child: const Text("Menu Card"),
            ),
          ),
        ),
      ],
    );
  }
}

DatabaseReference fireBaseDatabaseReference = FirebaseDatabase.instance.ref();

setItemsList() {
  final pM = const ProductModel(
          itemId: 55,
          itemName: "Shamam",
          categoryName: "fruit",
          itemPrice: 49,
          itemType: ItemType.plate,
          availableQty: 51)
      .toJson();
  final pMt = const ProductModel(
          itemId: 24,
          itemName: "Tomato",
          categoryName: "veg",
          itemPrice: 37,
          itemType: ItemType.glass,
          availableQty: 62)
      .toJson();

  fireBaseDatabaseReference.child("cafeMenu/menuCard/").set({
    "itemsSample": [pM, pMt]
  });
  // CustomerModel cM =
  //       const CustomerModel(orderList: ["sampleList", "sampleListY"]);
  //   var cmJson = cM.toJson();
  //   DatabaseReference dRef = FirebaseDatabase.instance.ref();
  //   dRef.child("sampleObj").set({"name": cmJson});
}

Future<ProductListModel> getItemslist() async {
  final productItemsPath =
      fireBaseDatabaseReference.child("cafeMenu/menuCard/itemsSample");
  final event = await productItemsPath.once(DatabaseEventType.value);
  final readItemsList = event.snapshot.value ?? [];
  final itemsListJson = jsonEncode(readItemsList);
  final productListModel = ProductListModel(jsonDecode(itemsListJson));
  return productListModel;
}


//  
// "Price" : 189, "categoryName" : "Shaway", "itemId" : 156 ,"itemName" :"Hf Shaway", "itemType" :ItemType.plate
