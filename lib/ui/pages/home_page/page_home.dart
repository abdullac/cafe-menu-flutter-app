import 'dart:convert';
import 'package:cafemenu_app/admin/ui/admin_login_page/page_admin_login.dart';
import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/ui/pages/home_page/widgets/menu_card_button.dart';
import 'package:cafemenu_app/utils/constants/colors.dart';
import 'package:cafemenu_app/utils/constants/lists.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class PageHome extends StatelessWidget {
  const PageHome({Key? key}) : super(key: key);

  static ValueNotifier<bool> isAdminButtonNotifier = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      /// menu card items list gets from firebase realtime database using getItemlist(),
      /// and returned asign to initialProductModelList.
      /// initialProductModelList is List of ProdectModel
      productModelList = await getItemslist();
    });
    return Scaffold(
      /// Home page background image container
      /// image shows with networkImage,firebase storage image url
      body: Container(
        decoration: const BoxDecoration(
          color: clrGreen,
        ),
        child: SafeArea(
          child: Stack(
            children: [
              /// button for goto admin register or sign in
              ValueListenableBuilder(
                  valueListenable: isAdminButtonNotifier,
                  builder: (context, newValue, _) {
                    return newValue == false
                        ? SizedBox()
                        : IconButton(
                            onPressed: () {
                              /// admin iconButton pressed
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const PageAdminAuthorization()));
                            },
                            icon: const Icon(Icons.person),
                          );
                  }),

              /// button for goto menu card page
              /// push Navigator with initialProductModelList
              const MenuCardButton(),
            ],
          ),
        ),
      ),
    );
  }
}

//////////////////////////////////////////

DatabaseReference fireBaseDatabaseReference = FirebaseDatabase.instance.ref();

setItemsList() {
  final pM = const ProductModel(
          itemId: 501,
          itemName: "Shaway Qr",
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
  final pMr = const ProductModel(
          itemId: 504,
          itemName: "Shawarma Roll",
          categoryName: "Shawarma",
          itemPrice: 79,
          itemType: ItemType.plate,
          availableQty: 100)
      .toJson();
  final pMg = const ProductModel(
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
  final readItemsValues = event.snapshot.value ?? [];
  final values;
  if (readItemsValues.runtimeType == List<Object?>) {
    values = readItemsValues as List;
  } else {
    readItemsValues as Map<dynamic, dynamic>;
    values = readItemsValues.values;
  }
  List<ProductModel> listOfProductModel = [];
  for (var element in values) {
    if (element != null) {
      var itemjsonString = jsonEncode(element);
      var itemJson = jsonDecode(itemjsonString);
      listOfProductModel.add(ProductModel.fromJson(itemJson));
    }
  }
  // final itemsListJson = jsonEncode(readItemsValues);
  // final productListModel = ProductListModel(jsonDecode(itemsListJson));
  return listOfProductModel;
}


//  
// "Price" : 189, "categoryName" : "Shaway", "itemId" : 156 ,"itemName" :"Hf Shaway", "itemType" :ItemType.plate
