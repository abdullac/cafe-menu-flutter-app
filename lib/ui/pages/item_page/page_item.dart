import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/ui/pages/menucard_page/page_menucard.dart';
import 'package:flutter/material.dart';

class PageItem extends StatelessWidget {
  final List<ProductModel> productModelList;
  final int index;
  const PageItem({
    Key? key,
    required this.productModelList,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int?> setQtyNotifier = ValueNotifier(null);
    ProductModel productModel = productModelList[index];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Cart Item"),
        actions: [
          IconButton(
            onPressed: () {
              // appBar item delete/cart button
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(productModel.categoryName ?? "Category Name"),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Text(productModel.itemName ?? "Sub Category Name"),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 70),
              child: Text(productModel.itemPrice != null
                  ? "₹ ${productModel.itemPrice}/Pc only"
                  : "₹ N/A"),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: SetQtySetion(
                mainAxisAlignment: MainAxisAlignment.center,
                valueNotifier: setQtyNotifier,
                productModel: productModel,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
