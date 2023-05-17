import 'package:cafemenu_app/core/provider/bloc/diningcart_page/diningcart_page_bloc.dart';
import 'package:cafemenu_app/core/services/firebase/firebase_refs.dart';
import 'package:cafemenu_app/ui/pages/user/diningcart_page/sections/customername_and_chairnumber.dart';
import 'package:cafemenu_app/ui/pages/user/diningcart_page/sections/diningcart_item_listview.dart';
import 'package:cafemenu_app/ui/pages/user/diningcart_page/sections/order_number_and_time.dart';
import 'package:cafemenu_app/ui/pages/user/diningcart_page/sections/total_items_qty_amount.dart';
import 'package:cafemenu_app/ui/pages/user/diningcart_page/widgets/diningcart_button.dart';
import 'package:cafemenu_app/ui/pages/user/menucard_page/page_menucard.dart';
import 'package:cafemenu_app/utils/constants/lists.dart';
import 'package:cafemenu_app/utils/constants/values.dart';
import 'package:cafemenu_app/core/provider/logics/user/diningcart_page/make_diningcart_list.dart';
import 'package:cafemenu_app/core/provider/logics/user/menucard_page/get_availableitems_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// this widget is a page/screen for shows list of DiningCartItem(selected available item by user/customer)
class PageDiningCart extends StatelessWidget {
  const PageDiningCart({
    Key? key,
  }) : super(key: key);

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
        stream: FirebaseRefs.availableItemsChild().onValue,
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            /// method for get list of AvailableItem using streambuilder snapshot
            getAvailableItemsListByStreamBuilder(snapshot);

            /// method for make diningCartList/ new diningCartList when sreamBuilder
            makeDiningCartListByStreamBuilder(availableItemsList);

            /// BlocProvider for rebuild listView Widget when streamBuilder
            /// and bottum Widgets(total item,Qty,Amount,
            /// name,positionode, orderId,Time, diningCartButton)
            BlocProvider.of<DiningcartPageBloc>(context)
                .add(DiningCartButtonPressed(
              diningCartButtonType: diningCartButtonType,
            ));
          }
          return BlocBuilder<DiningcartPageBloc, DiningcartPageState>(
            builder: (context, state) {
              /// show empty message and goto menuCardPage button
              /// if diningCartList is empty
              return state.diningCartList.isEmpty
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
                                  builder: (context) => const PageMenuCard(),
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
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                                color: Colors.red[200],
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    topLeft: Radius.circular(10))),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                /// total items, quantity, amount.
                                TotalItemQtyAmount(),

                                /// name and positionCode
                                NameAndPositionCode(),

                                /// OrderId and ordered time
                                OrderIdAndTime(),

                                /// diningCart button for deffrent functionality
                                /// takeNow order, confirmOrder,..
                                DiningCartButton(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
              // });
            },
          );
        },
      ),
    );
  }
}
