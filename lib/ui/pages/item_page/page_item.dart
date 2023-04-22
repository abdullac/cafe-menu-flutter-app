import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/ui/pages/diningcart_page/page_diningcart.dart';
import 'package:cafemenu_app/ui/pages/menucard_page/page_menucard.dart';
import 'package:cafemenu_app/ui/pages/menucard_page/widgets/item_by_category.dart';
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
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                    opacity: 0.3,
                    image: NetworkImage(
                        productModel.verticalImageUrl ?? sampleImageUrl),
                    fit: BoxFit.cover)),
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage(
                    productModel.verticalImageUrl ?? sampleImageUrl),
              )),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                productModel.categoryName ?? "Category Name",
                style: const TextStyle(fontWeight: FontWeight.bold, shadows: [
                  Shadow(
                    color: Colors.white,
                    blurRadius: 25,
                  ),
                  Shadow(
                    color: Colors.white,
                    blurRadius: 25,
                  ),
                ]),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Text(
                productModel.itemName ?? "Sub Category Name",
                style: const TextStyle(fontWeight: FontWeight.w500, shadows: [
                  Shadow(
                    color: Colors.white,
                    blurRadius: 25,
                  ),
                  Shadow(
                    color: Colors.white,
                    blurRadius: 25,
                  ),
                ]),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 70),
              child: Text(
                productModel.itemPrice != null
                    ? "₹ ${productModel.itemPrice}/Pc only"
                    : "₹ N/A",
                style: const TextStyle(shadows: [
                  Shadow(
                    color: Colors.white,
                    blurRadius: 25,
                  ),
                  Shadow(
                    color: Colors.white,
                    blurRadius: 25,
                  ),
                ]),
              ),
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
