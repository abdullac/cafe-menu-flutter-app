import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/utils/functions/productmodel_list_by_category.dart';
import 'package:flutter/material.dart';

import 'widgets/category_list.dart';
import 'widgets/menucard_page_appbar.dart';

/// This Page widget shows items(list of ProductModel)
/// this is the listView page.
/// base listview is vertial for shows by CategoryName.
/// another listView is horizontal for shows products by eah category
class PageMenuCard extends StatelessWidget {
  /// list of items(ProductModel) from realtime database
  final List<ProductModel> productModelList;
  const PageMenuCard({
    Key? key,
    required this.productModelList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// method for making productModel list by categoryNames
    Map<String, List<ProductModel>> listOfProductmodelByCategory =
        productmodelListByCategory(productModelList);
    return Scaffold(
      /// appBar with goto DiningCart page button
      appBar: const PreferredSize(
          preferredSize: Size(100, 60), child: MenuCardPageAppBar()),

      /// this ListView is Base listview includes child listViews by CategryName
      body: ListView.builder(
        itemCount: listOfProductmodelByCategory.length,
        itemBuilder: (contxt, categoryIndex) => CategoryList(
          categoryIndex: categoryIndex,
          listOfProductmodelByCategory: listOfProductmodelByCategory,
        ),
      ),
    );
  }
}


