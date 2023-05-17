
import 'package:cafemenu_app/core/services/firebase/firebase_refs.dart';
import 'package:cafemenu_app/ui/pages/admin/orders_page/widgets/order_by_customer.dart';
import 'package:cafemenu_app/utils/constants/lists.dart';
import 'package:cafemenu_app/core/provider/logics/admin/orders/orderedlist_from_firebase.dart';
import 'package:flutter/material.dart';

/// this widget/Screen is show listview with orderedList
class PageOrdersPageView extends StatelessWidget {
  const PageOrdersPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// stream builder for rebuild widget/Pageview when any changes in firebase database orderedList
    return StreamBuilder(
        stream: FirebaseRefs.orderedListChild().onValue,
        builder: (context, snapshot) {
          /// method for add orders to orderedListFromFireBase when rebuild streamBuilder.
          getOrderedListFromFireBase(snapshot);
          return Scaffold(
            /// appBar with Done Button
            appBar: AppBar(
              actions: [
                ElevatedButton(
                  onPressed: () {
                    // appBar done Button pressed
                  },
                  child: const Text("Done"),
                ),
              ],
            ),
            body: SafeArea(

                /// show empty text if no orders in orderedList.
                child: orderedListFromFireBase.isEmpty
                    ? const Center(
                        child: Text("Order List Empty"),
                      )

                    /// show PageView if any orders in OrderedList.
                    /// pageView contains list of All customers Ordered Items
                    /// each PageView Items each customer Ordered Items and customer details.
                    : PageView.builder(
                        itemCount: orderedListFromFireBase.length,
                        itemBuilder: (context, pageViewItemIndex) {
                          /// Pageview ItemBuilder shows Order By One customer
                          return OrderByCustomer(
                            pageViewItemIndex: pageViewItemIndex,
                            snapshot: snapshot,
                          );
                        },
                      )),
          );
        });
  }
}
