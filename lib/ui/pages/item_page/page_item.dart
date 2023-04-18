import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/ui/pages/diningcart_page/page_diningcart.dart';
import 'package:cafemenu_app/ui/pages/menucard_page/page_menucard.dart';
import 'package:cafemenu_app/utils/functions/diningcart_page/deleteitem_from_diningcartlist.dart';
import 'package:cafemenu_app/utils/functions/set_qty_section.dart';
import 'package:cafemenu_app/utils/constants/enums.dart';
import 'package:cafemenu_app/utils/constants/lists.dart';
import 'package:flutter/material.dart';

class PageItem extends StatelessWidget {
  final ProductModel productModel;
  final ComingPage comingPage;
  const PageItem({
    Key? key,
    required this.productModel,
    required this.comingPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int?> setQtyNotifier = ValueNotifier(null);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            // appBar back button pressed
            if (comingPage == ComingPage.menuCard) {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) =>
                      PageMenuCard(productModelList: productModelList)));
            } else if (comingPage == ComingPage.diningCart) {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const PageDiningCart(
                      // diningCartList: diningCartList,
                      )));
            }
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text("Your Cart Item"),
        actions: comingPage == ComingPage.menuCard
        ? []
        : [
          IconButton(
            onPressed: () {
              // appBar item delete/cart button
              if (comingPage == ComingPage.diningCart) {
                deleteItemFromDiningCartList(productModel);
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const PageDiningCart(
                        // diningCartList: diningCartList,
                        )));
              }
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
              padding: const EdgeInsets.only(bottom: 70),
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
                removeitemAtQty0: comingPage == ComingPage.menuCard
                    ? true
                    : comingPage == ComingPage.diningCart
                        ? false
                        : false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
