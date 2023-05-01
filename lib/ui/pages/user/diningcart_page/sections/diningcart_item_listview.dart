import 'package:cafemenu_app/ui/pages/user/diningcart_page/page_diningcart.dart';
import 'package:cafemenu_app/ui/pages/user/diningcart_page/sections/ordered_listview.dart';
import 'package:cafemenu_app/ui/pages/user/diningcart_page/widgets/diningcart_item.dart';
import 'package:cafemenu_app/utils/constants/lists.dart';
import 'package:flutter/material.dart';

/// this widget is ListViewof diningCartItem
class DiningCartItemListview extends StatelessWidget {
  const DiningCartItemListview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    /// rebuild widget when streambuilder using diningCartListViewNotifier
    return ValueListenableBuilder(
      valueListenable: PageDiningCart.diningCartListViewNotifier,
      builder: (context, newValue, _) {
        /// shows OrderedListView widget if diningCartListViewNotifier value is "oredredList"
        /// "oredredList" means List(listView) of ordered items after customer/user pressed confirmOrderButton
        /// shows diningCartList widget if diningCartListViewNotifier value is not "oredredList"
        return newValue == "oredredList"
            ? const OrderedListView()
            : Center(
                /// this listView for shows diningCartItems List
                child: ListView.separated(
                  itemCount: diningCartList.length,
                  /// diningCart item (itemBuilder)
                  itemBuilder: ((context, index) => DiningCartItem(
                        index: index,
                        diningCartItemsList: diningCartList,
                      )),
                  separatorBuilder: (context, index) {
                    return const SizedBox();
                  },
                ),
              );
      },
    );
  }
}
