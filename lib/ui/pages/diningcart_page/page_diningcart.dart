import 'dart:developer';

import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/ui/pages/diningcart_page/sections/customername_and_chairnumber.dart';
import 'package:cafemenu_app/ui/pages/diningcart_page/sections/diningcart_item_listview.dart';
import 'package:cafemenu_app/ui/pages/diningcart_page/sections/order_number_and_time.dart';
import 'package:cafemenu_app/ui/pages/diningcart_page/sections/total_items_qty_amount.dart';
import 'package:cafemenu_app/ui/pages/diningcart_page/widgets/diningcart_button.dart';
import 'package:cafemenu_app/ui/pages/menucard_page/page_menucard.dart';
import 'package:cafemenu_app/utils/constants/lists.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

int? orderId;
DateTime? orderedTime;

class PageDiningCart extends StatelessWidget {
  // final List<ProductModel> diningCartList;
  const PageDiningCart({
    Key? key,
    // required this.diningCartList,
  }) : super(key: key);

  static ValueNotifier diningCartListViewNotifier = ValueNotifier("_value");

  @override
  Widget build(BuildContext context) {
    ////////////////////////
    DatabaseReference fireBaseDatabaseReference =
        FirebaseDatabase.instance.ref();
    final productItemsPath =
        fireBaseDatabaseReference.child("cafeMenu/menuCard/itemsSample");
    ////////////////////////////////////
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              // appBar back button pressed
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => PageMenuCard(
                      // productModelList: productModelList,
                      )));
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text("Your Dining Cart"),
      ),
      body:
          //////////////////////////
          StreamBuilder(
              stream: productItemsPath.onValue,
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  List<ProductModel> listOfProductModel =
                      getItemsListByStreamBuilder(snapshot);
                  diningCartListByStreamBuilder(listOfProductModel);
                  productModelList = listOfProductModel;
                log("ABCDEFGHIJK");
                diningCartListViewNotifier.notifyListeners();
                }
                ///////////////////////////////
                return ValueListenableBuilder(
                    valueListenable: diningCartListViewNotifier,
                    builder: (context, newValue, _) {
                      return diningCartList.isEmpty
                          ? Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text("You h'nt selected any item"),
                                  IconButton(
                                      onPressed: () {
                                        // goto menucard page
                                        Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                            builder: (context) => PageMenuCard(
                                                // productModelList: productModelList,
                                                ),
                                          ),
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.add_circle,
                                        color: Colors.green,
                                      ))
                                ],
                              ),
                            )
                          : Column(
                              children: [
                                const Expanded(
                                  child: DiningCartItemListview(),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TotalItemQtyAmount(
                                          diningCartList: diningCartList),
                                      NameChairNumber(),
                                      const OrderNumberTime(),
                                      const DiningCartButton(),
                                    ],
                                  ),
                                ),
                              ],
                            );
                    });
              }),
    );
  }
}
