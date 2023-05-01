import 'package:cafemenu_app/firebase_backend.dart';
import 'package:cafemenu_app/ui/pages/user/diningcart_page/sections/customername_and_chairnumber.dart';
import 'package:cafemenu_app/ui/pages/user/diningcart_page/sections/diningcart_item_listview.dart';
import 'package:cafemenu_app/ui/pages/user/diningcart_page/sections/order_number_and_time.dart';
import 'package:cafemenu_app/ui/pages/user/diningcart_page/sections/total_items_qty_amount.dart';
import 'package:cafemenu_app/ui/pages/user/diningcart_page/widgets/diningcart_button.dart';
import 'package:cafemenu_app/ui/pages/user/menucard_page/page_menucard.dart';
import 'package:cafemenu_app/utils/constants/lists.dart';
import 'package:cafemenu_app/utils/functions/diningcart_page/make_diningcart_list.dart';
import 'package:cafemenu_app/utils/functions/menucard_page/get_availableitems_list.dart';
import 'package:flutter/material.dart';

/// this widgeet is a page/screen for shows list of DiningCartItem(selected available item by user/customer)
class PageDiningCart extends StatelessWidget {
  const PageDiningCart({
    Key? key,
  }) : super(key: key);

  /// diningCartListViewNotifier for rebuild PageDiningCart when streamBuilder
  static ValueNotifier diningCartListViewNotifier = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              // appBar back button pressed
              /// pushReplacement to pageMenuCard 
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const PageMenuCard(),
                ),
              );
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text("Your Dining Cart"),
      ),

      /// stream builder for rebuild pageDiningCart widgets
      /// when any changes availableItems in firebaseDatabase suh as availableQty
      body: StreamBuilder(
        /// availableItemsChildRef is List of availableItem child path of FirebaseDatabase
        stream: FirebaseBackend.availableItemsChildRef().onValue,
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            /// method for get list of AvailableItem using streambuilder snapshot
            getAvailableItemsListByStreamBuilder(snapshot);

            /// method for make diningCartList/ new diningCartList when sreamBuilder
            makeDiningCartListByStreamBuilder(availableItemsList);

            /// notify diningCartListViewNotifier when streamBuilder for rebuild listView Widget
            /// and bottum Widgets(total item,Qty,Amount,
            /// name,positionode, orderId,Time, diningCartButton)
            diningCartListViewNotifier.notifyListeners();
          }
          return ValueListenableBuilder(
              valueListenable: diningCartListViewNotifier,
              builder: (context, newValue, _) {
                /// show empty message and goto menuCaardPage button
                /// if diningCartList is empty
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
                                    builder: (context) => const PageMenuCard(
                                        // productModelList: productModelList,
                                        ),
                                  ),
                                );
                              },
                              icon: const Icon(
                                Icons.add_circle,
                                color: Colors.green,
                              ),
                            )
                          ],
                        ),
                      )

                    /// show diningCart ListView and bottom Widgets(total item,Qty,Amount,
                    /// name,positionode, orderId,Time, diningCartButton)
                    : Column(
                        children: [
                          const Expanded(
                            /// diningCart listView
                            child: DiningCartItemListview(),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                /// total items, quantity, amount.
                                TotalItemQtyAmount(
                                    diningCartList: diningCartList),
                                NameChairNumber(),
                                const OrderIdAndTime(),
                                const DiningCartButton(),
                              ],
                            ),
                          ),
                        ],
                      );
              });
        },
      ),
    );
  }
}
