import 'package:cafemenu_app/core/provider/bloc/diningcart_page/diningcart_page_bloc.dart';
import 'package:cafemenu_app/ui/pages/user/diningcart_page/sections/ordered_listview.dart';
import 'package:cafemenu_app/ui/pages/user/diningcart_page/widgets/diningcart_item.dart';
import 'package:cafemenu_app/utils/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// this widget is ListViewof diningCartItem
class DiningCartItemListview extends StatelessWidget {
  const DiningCartItemListview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    /// rebuild widget when streambuilder using diningCartListViewNotifier
    return BlocBuilder<DiningcartPageBloc, DiningcartPageState>(
      builder: (context, state) {
        /// shows OrderedListView widget if diningCartListViewNotifier value is "oredredList"
        /// "oredredList" means List(listView) of ordered items after customer/user pressed confirmOrderButton
        return state.diningCartButtonType ==
                DiningCartButtonFunctionality.orderConfirm
            ? const OrderedListView()
            : Center(
                /// this listView for shows diningCartItems List
                child: ListView.separated(
                  itemCount: state.diningCartList.length,

                  /// diningCart item (itemBuilder)
                  itemBuilder: ((context, index) => DiningCartItem(
                        index: index,
                        diningCartItemsList: state.diningCartList,
                      )),
                  separatorBuilder: (context, index) {
                    return const SizedBox();
                  },
                ),
              );
        //   },
        // );
      },
    );
  }
}
