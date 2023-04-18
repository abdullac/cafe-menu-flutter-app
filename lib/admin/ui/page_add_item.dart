import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/ui/pages/home_page/page_home.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class PageAddItem extends StatelessWidget {
  PageAddItem({Key? key}) : super(key: key);

  TextEditingController itemNameEditingController = TextEditingController();
  TextEditingController categoryNameEditingController = TextEditingController();
  TextEditingController priceEditingController = TextEditingController();
  TextEditingController availableQtyEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    int newItemId = getNewItemId();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Item"),
          actions: [
            IconButton(
              onPressed: () async {
                // AddItem page appbar add button
                Map<String, dynamic>? productModelJson =
                    createProdectModelItemJson(
                  itemId: newItemId.toString(),
                  itemName: itemNameEditingController.text,
                  categoryName: categoryNameEditingController.text,
                  price: priceEditingController.text,
                  availableQuantity: availableQtyEditingController.text,
                  verticalImageUrl: null,
                );
                if (productModelJson != null) {
                  await addOrUpdateProductModelItemToFireBase(productModelJson);
                } else {
                  print("Somthing Wrong, may be any form field is empty");
                }
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("ItemId : $newItemId"),
                  const SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: itemNameEditingController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Item Name",
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: categoryNameEditingController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Category Name",
                    ),
                  ),
                  ////  Category type(platr/glass) - DropdownButton
                  const SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: priceEditingController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Price",
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: availableQtyEditingController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Available Quantity",
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  IconButton(
                    onPressed: () {
                      // Image from gallery button
                      // verticalImage & get Url
                    },
                    icon: const Icon(Icons.add_photo_alternate_outlined),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

int getNewItemId() {
  /// get all itemId s Or last itemId from firbase
  /// reate new itemId
  return 555;
}

Map<String, dynamic>? createProdectModelItemJson({
  required String itemId,
  required String itemName,
  required String categoryName,
  required String price,
  required String availableQuantity,
  required String? verticalImageUrl,
}) {
  if ([
    itemName,
    categoryName,
    price,
    availableQuantity,
  ].contains("")) {
    print("please fill all Fields");
    return null;
  } else {
    return ProductModel(
            itemId: int.parse(itemId),
            itemName: itemName,
            categoryName: categoryName,
            itemPrice: double.parse(price),
            itemType: ItemType.plate,
            availableQty: int.parse(availableQuantity),
            verticalImageUrl: verticalImageUrl)
        .toJson();
  }
}

addOrUpdateProductModelItemToFireBase(
    Map<String, dynamic> productModelJson) async {
  DatabaseReference firebaseRef = FirebaseDatabase.instance.ref();
  // dynamic getProductModelListFromFirebase;
  // await firebaseRef.child("cafeMenu/menuCard/itemsSample").get().then((value) {
  //   getProductModelListFromFirebase = value.value;
  // });
  // getProductModelListFromFirebase.add(productModelJson);
  final getproductModelListObjet =
      await firebaseRef.child("cafeMenu/menuCard/itemsSample").get();
  // List<int> keyList = [];
  // int baseIndex = 0;
  // int tempkey = 0;
  var lastPositionSnapshort = getproductModelListObjet.children.last.key as String;
  int newPosition = int.parse(lastPositionSnapshort)+1;
  // forEach((element) {
  //   if (element.key != null) {
  //     keyList.add(int.parse(element.key!));
  //   }
  //   if (keyList.length < 1) {
  //     for (baseIndex; baseIndex < keyList.length - 1; baseIndex++) {
  //       for (int subIndex = 1; subIndex < keyList.length; subIndex++) {
  //         if (keyList[baseIndex] < keyList[subIndex]) {
  //           tempkey = keyList[subIndex]+1;
  //         }
  //       }
  //     }
  //   } else if (keyList.length == 1) {
  //     tempkey = keyList[0]+1;
  //   } else {
  //     tempkey = 0;
  //   }
  // });
  await firebaseRef
      .child("cafeMenu/menuCard/itemsSample/$newPosition")
      .set(productModelJson);
}
