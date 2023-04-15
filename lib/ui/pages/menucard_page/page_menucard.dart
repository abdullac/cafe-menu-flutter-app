import 'dart:math';
import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/ui/pages/diningart_page/page_diningcart.dart';
import 'package:cafemenu_app/ui/pages/home_page/page_home.dart';
import 'package:cafemenu_app/ui/pages/item_page/page_item.dart';
import 'package:flutter/material.dart';

List<ProductModel> diningCartList = [];

class PageMenuCard extends StatelessWidget {
  final List<ProductModel> productModelList;
  const PageMenuCard({
    Key? key,
    required this.productModelList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, List<ProductModel>> byCategory = {};
    for (var element in productModelList) {
      if (element.categoryName != null) {
        if (byCategory.containsKey(element.categoryName)) {
          byCategory[element.categoryName]!.add(element);
        } else {
          if (element.categoryName != null) {
            byCategory[element.categoryName!] = [element];
          }
        }
      }
    }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              // appBar back button
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text("Shop Name"),
        actions: [
          IconButton(
              onPressed: () {
                // goto dining cart button pressed
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => PageDiningCart(
                          diningCartList: diningCartList,
                        )));
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
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                byCategory.keys.toList()[categoryIndex] ?? "Category Name",
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
    ProductModel productModel = productModelList[categoryItemIndex];
    return InkWell(
      onTap: () {
        // catyegory item image taped
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => PageItem(
                  productModel: productModel,
                  comingPage: ComingPage.menuCard,
                )));
      },
      child: Stack(
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
                    productModel.itemName ?? "Sub Category Name",
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
                    productModel: productModel,
                  )
                ],
              ),
            ),
          )
        ],
      ),
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
    ValueNotifier<int?> setQtyNotifier = ValueNotifier(null);
    ProductModel productModelModified = productModel;
    for (var element in diningCartList) {
      if (element.itemName == productModel.itemName) {
        int elementPosition = diningCartList.indexOf(element);
        productModelModified = diningCartList[elementPosition];
      }
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SetQtySetion(
          valueNotifier: setQtyNotifier,
          productModel: productModelModified,
        ),
        Text(
            "₹ ${productModelModified.itemPrice}/Qty Only" ?? "₹ 120/Qty Only"),
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

class SetQtySetion extends StatelessWidget {
  final MainAxisAlignment? mainAxisAlignment;
  final ValueNotifier<int?> valueNotifier;
  final ProductModel productModel;
  const SetQtySetion({
    super.key,
    this.mainAxisAlignment,
    required this.valueNotifier,
    required this.productModel,
  });

  @override
  Widget build(BuildContext context) {
    valueNotifier.value ??= productModel.orderedQty ?? 0;
    return ValueListenableBuilder(
        valueListenable: valueNotifier,
        builder: (context, newValue, _) {
          return Row(
            mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  // count decrease button pressed
                  if (newValue != 0) {
                    valueNotifier.value = newValue! - 1;
                    valueNotifier.notifyListeners();
                    ProductModel productModelModified =
                        productModel.copyWith(orderedQty: valueNotifier.value);
                    int? elementPosition;
                    for (var element in diningCartList) {
                      if (element.itemName == productModel.itemName) {
                        elementPosition = diningCartList.indexOf(element);
                        break;
                      }
                    }
                    if (elementPosition != null) {
                      diningCartList[elementPosition] = productModelModified;
                    } else {
                      diningCartList.add(productModelModified);
                    }
                  }
                  if (newValue == 1 || newValue == 0) {
                    int? elementPosition;
                    for (var element in diningCartList) {
                      if (element.itemName == productModel.itemName) {
                        elementPosition = diningCartList.indexOf(element);
                        break;
                      }
                    }
                    if (elementPosition != null) {
                      diningCartList.removeAt(elementPosition);
                    }
                  }
                },
                icon: const Text(
                  "-",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Text(
                "$newValue",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              IconButton(
                onPressed: () {
                  // count increase button pressed
                  valueNotifier.value = newValue! + 1;
                  valueNotifier.notifyListeners();
                  ProductModel productModelModified =
                      productModel.copyWith(orderedQty: valueNotifier.value);
                  int? elementPosition;
                  for (var element in diningCartList) {
                    if (element.itemName == productModel.itemName) {
                      elementPosition = diningCartList.indexOf(element);
                      break;
                    }
                  }
                  if (elementPosition != null) {
                    diningCartList[elementPosition] = productModelModified;
                  } else {
                    diningCartList.add(productModelModified);
                  }
                },
                icon: const Text(
                  "+",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ],
          );
        });
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
