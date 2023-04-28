import 'dart:convert';
import 'dart:developer';

import 'package:cafemenu_app/admin/ui/add_item_page/page_add_item.dart';
import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/ui/pages/menucard_page/widgets/item_by_category.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class PageViewAllItems extends StatelessWidget {
  const PageViewAllItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DatabaseReference firebaseRef =
        FirebaseDatabase.instance.ref("cafeMenu/menuCard/itemsSample");
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(
            stream: firebaseRef.onValue,
            builder: (context, snapshot) {
              List<ProductModel> itemsList = [];
              if (snapshot.data != null) {
                final items = snapshot.data!.snapshot.children;
                for (var element in items) {
                  ProductModel productModel = ProductModel.fromJson(
                      jsonDecode(jsonEncode(element.value)));
                  itemsList.add(productModel);
                }
              }
              return ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return productModelItemTile(
                    productModel: itemsList[index],
                  );
                },
                separatorBuilder: (context, index) => Container(
                  color: Colors.red,
                  height: 5,
                ),
                itemCount: itemsList.length,
              );
            }),
      ),
    );
  }
}

class productModelItemTile extends StatelessWidget {
  final ProductModel productModel;
  const productModelItemTile({
    super.key,
    required this.productModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image(
          image: NetworkImage(productModel.verticalImageUrl ?? sampleImageUrl),
        ),
        Text("Item Name : ${productModel.itemName ?? 'N/A'}"),
        Text("Category Name : ${productModel.categoryName ?? 'N/A'}"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Item Id : ${productModel.itemId ?? 'N/A'}"),
            Text("Item Price : ${productModel.itemPrice ?? 'N/A'}"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
                "Item Type : ${productModel.itemType == ItemType.plate ? "Plate" : productModel.itemType == ItemType.glass ? "Glass" : 'N/A'}"),
            Text("Is Closed : ${productModel.isClosed ?? 'N/A'}"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Available Qty : ${productModel.availableQty ?? 'N/A'}"),
            Text("Left Qty : ${productModel.leftQty ?? 'N/A'}"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                // item Edit button
                editItemToDatabase(context, productModel);
              },
              child: const Text("Edit Item"),
            ),
            ElevatedButton(
              onPressed: () {
                // item Delete button
                deleteItemFromDataBase(productModel.itemId);
              },
              child: const Text("Delete Item"),
            ),
          ],
        ),
      ],
    );
  }
}

Future deleteItemFromDataBase(int? itemId) async {
  DatabaseReference firebaseRef = FirebaseDatabase.instance.ref();
  if (itemId != null) {
    final itemsSnapShot =
        await firebaseRef.child("cafeMenu/menuCard/itemsSample").get();
    for (var element in itemsSnapShot.children) {
      ProductModel productModel =
          ProductModel.fromJson(jsonDecode(jsonEncode(element.value)));
      if (productModel.itemId != null &&
          element.key != null &&
          productModel.itemId == itemId) {
        await firebaseRef
            .child("cafeMenu/menuCard/itemsSample/${element.key}")
            .remove();
        log("item removed");
        break;
      }
    }
  } else {
    log("Cannot delete");
  }
}

editItemToDatabase(BuildContext context, ProductModel productModel) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
    return PageAddItem(editItem: productModel,);
  }));
}
