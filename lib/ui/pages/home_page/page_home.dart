import 'dart:convert';

import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/ui/pages/menucard_page/page_menucard.dart';
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
                final productModelList = await getItemslist();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PageMenuCard(
                          productModelList: productModelList,
                        )));
              },
              child: const Text("Menu Card"),
            ),
          ),
        ),
      ],
    );
  }
}

//////////////////////////////////////////

DatabaseReference fireBaseDatabaseReference = FirebaseDatabase.instance.ref();

setItemsList() {
  final pM = const ProductModel(
          itemId: 501,
          itemName: "Qr Shaway",
          categoryName: "Shaway",
          itemPrice: 99,
          itemType: ItemType.plate,
          availableQty: 24)
      .toJson();
  final pMt = const ProductModel(
          itemId: 504,
          itemName: "Shawarma Roll",
          categoryName: "Shawarma",
          itemPrice: 79,
          itemType: ItemType.plate,
          availableQty: 100)
      .toJson();

  fireBaseDatabaseReference.child("cafeMenu/menuCard/").set({
    "itemsSample": [pM, pMt]
  });
}


updateItemsList() {
  final pM = const ProductModel(
          itemId: 501,
          itemName: "Qr Shaway",
          categoryName: "Shaway",
          itemPrice: 99,
          itemType: ItemType.plate,
          availableQty: 24)
      .toJson();
  final pMt = const ProductModel(
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

Future<List<ProductModel>> getItemslist() async {
  final productItemsPath =
      fireBaseDatabaseReference.child("cafeMenu/menuCard/itemsSample");
  final event = await productItemsPath.once(DatabaseEventType.value);
  final readItemsList = event.snapshot.value ?? [];
  readItemsList as List;
  List<ProductModel> listOfProductModel = [];
  for (var element in readItemsList) {
    var itemjsonString = jsonEncode(element);
    var itemJson = jsonDecode(itemjsonString);
    listOfProductModel.add(ProductModel.fromJson(itemJson));
  }
  print(listOfProductModel);
  // final itemsListJson = jsonEncode(readItemsList);
  // final productListModel = ProductListModel(jsonDecode(itemsListJson));
  return listOfProductModel;
}


//  
// "Price" : 189, "categoryName" : "Shaway", "itemId" : 156 ,"itemName" :"Hf Shaway", "itemType" :ItemType.plate
