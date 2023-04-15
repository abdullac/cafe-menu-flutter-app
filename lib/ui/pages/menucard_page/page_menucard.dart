import 'dart:math';

import 'package:cafemenu_app/core/model/product/product_list_model.dart';
import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/ui/pages/diningart_page/page_diningcart.dart';
import 'package:flutter/material.dart';

class PageMenuCard extends StatelessWidget {
  const PageMenuCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, List<ProductModel>> byCategory = {};
    ProductListModel.productList.forEach((element) {
      if (element.categoryName != null) {
        if (byCategory.containsKey(element.categoryName)) {
          byCategory[element.categoryName]!.add(element);
        } else {
          if (element.categoryName != null) {
            byCategory[element.categoryName!] = [element];
          }
        }
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shop Name"),
        actions: [
          IconButton(
              onPressed: () {
                // goto dining cart button pressed
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const PageDiningCart()));
              },
              icon: const Icon(Icons.dining))
        ],
      ),
      body: ListView.builder(
        itemCount: byCategory.length,
        itemBuilder: (contxt, categoryIndex) => Category(
          categoryIndex: categoryIndex,
          byCategory: byCategory,
        ),
      ),
    );
  }
}

class Category extends StatelessWidget {
  final int categoryIndex;
  final Map<String, List<ProductModel>> byCategory;
  const Category({
    super.key,
    required this.categoryIndex,
    required this.byCategory,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          PageView.builder(
            itemCount: 5,
            itemBuilder: (context, categoryItemIndex) => CategoryItem(
              categoryItemIndex: categoryItemIndex,
              productModelList: byCategory.values.toList()[categoryIndex],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                byCategory.keys.toList()[categoryIndex] ?? "Category Name",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final int categoryItemIndex;
  final List<ProductModel> productModelList;
  const CategoryItem({
    super.key,
    required this.categoryItemIndex,
    required this.productModelList,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.all(5),
          color: color[Random().nextInt(color.length)],
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  productModelList[categoryItemIndex].itemName ??
                      "Sub Category Name",
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  "Closed/Left",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple.withOpacity(0.5)),
                ),
                CountPriceCartButtonSection(
                  productModel: productModelList[categoryItemIndex],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class CountPriceCartButtonSection extends StatelessWidget {
  final ProductModel productModel;
  const CountPriceCartButtonSection({
    super.key,
    required this.productModel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CountSection(),
        Text("${productModel.itemPrice}/Qty Only" ?? "120/pc Only"),
        IconButton(
          onPressed: () {
            // dining cart button pressed
          },
          icon: const Icon(Icons.dining_outlined),
        )
      ],
    );
  }
}

class CountSection extends StatelessWidget {
  final MainAxisAlignment? mainAxisAlignment;
  const CountSection({
    super.key,
    this.mainAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () {
            // count decrease button pressed
          },
          icon: const Text(
            "-",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        const Text(
          "2",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        IconButton(
          onPressed: () {
            // count increase button pressed
          },
          icon: const Text(
            "+",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ],
    );
  }
}

List<Color> color = [
  Colors.blue,
  Colors.deepOrange,
  Colors.blueAccent,
  Colors.deepOrange,
  Colors.indigoAccent,
  Colors.lightBlue,
  Colors.indigo,
  Colors.green,
  Colors.pink,
  Colors.red,
];
