import 'dart:convert';
import 'dart:developer';

import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/ui/pages/home_page/page_home.dart';
import 'package:cafemenu_app/utils/constants/lists.dart';
import 'package:cafemenu_app/utils/functions/menucard_page/productmodel_list_by_category.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'widgets/category_list.dart';
import 'widgets/menucard_page_appbar.dart';

/// This Page widget shows items(list of ProductModel)
/// this is the listView page.
/// base listview is vertial for shows by CategoryName.
/// another listView is horizontal for shows products by eah category
class PageMenuCard extends StatelessWidget {
  /// list of items(ProductModel) from realtime database
  // final List<ProductModel> productModelListt;
  const PageMenuCard({
    Key? key,
    // required this.productModelListt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ////////////////////////
    DatabaseReference fireBaseDatabaseReference =
        FirebaseDatabase.instance.ref();
    final productItemsPath =
        fireBaseDatabaseReference.child("cafeMenu/menuCard/itemsSample");
    return StreamBuilder(
        stream: productItemsPath.onValue,
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            // log("onValue - ${snapshot.data!.snapshot.value}");
            final readItemsValues = snapshot.data!.snapshot.value ?? [];
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
            productModelList = listOfProductModel;
          }
          ///////////////////////////////
    /// method for making productModel list by categoryNames
    Map<String, List<ProductModel>> listOfProductmodelByCategory =
        // productmodelListByCategory(productModelListt);
        productmodelListByCategory(productModelList);
          return Scaffold(
            /// appBar with goto DiningCart page button
            appBar: const PreferredSize(
                preferredSize: Size(100, 60), child: MenuCardPageAppBar()),

            /// this ListView is Base listview includes child listViews by CategryName
            body: ListView.separated(
              itemCount: listOfProductmodelByCategory.length,
              itemBuilder: (contxt, categoryIndex) {
                return CategoryListviewOfProductPageview(
                  categoryIndex: categoryIndex,
                  listOfProductmodelByCategory: listOfProductmodelByCategory,
                );
              },
              separatorBuilder: (context, index) => const SizedBox(),
            ),
          );
        });
  }
}
