import 'package:cafemenu_app/core/model/available_item/available_item_model.dart';
import 'package:cafemenu_app/core/services/firebase/firebase_refs.dart';
import 'package:cafemenu_app/utils/constants/lists.dart';
import 'package:cafemenu_app/utils/functions/user/diningcart_page/make_diningcart_list.dart';
import 'package:cafemenu_app/utils/functions/user/menucard_page/get_availableitems_list.dart';
import 'package:cafemenu_app/utils/functions/user/menucard_page/productmodel_list_by_category.dart';
import 'package:flutter/material.dart';
import 'widgets/category_list.dart';
import 'widgets/menucard_page_appbar.dart';

/// this widget is like a screen/page for shows available items.
/// This Page shows items(list of ProductModel)
/// this is the listView page.
/// each listView items Contains horizontal Pageview by items category name.
/// pageview items shows items(available items)by their cateegory name.
class PageMenuCard extends StatelessWidget {
  /// list of items(ProductModel/available items) from realtime database
  const PageMenuCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// mwnuCard page created with Stream builder for rebuild widget/page
    /// when get any change in available items of firebase database backend
    return StreamBuilder(
      /// get reference and child path from Firebasebackend class
      /// for get event from database with stream of sytream builder.
      stream: FirebaseRefs.availableItemsChild().onValue,
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          /// get list of available Items by stream builder snapshot
          getAvailableItemsListByStreamBuilder(snapshot);

          /// make/set diningCart List when streamBuilder build widget
          /// diningCart list is cart List(order items list) of customer/user.
          makeDiningCartListByStreamBuilder(availableItemsList);
        }

        /// method for making AvalableItemModel Map by categoryNames.
        /// Map key is category name,
        /// Map value is list of availableItems By that categoryName.
        Map<String, List<AvailableItemModel>> availableItemsListByCategoryMap =
            makeAvailableItemsListByCategoryMap(availableItemsList);
        return Scaffold(
          /// appBar with goto DiningCart page button
          appBar: const PreferredSize(
            preferredSize: Size(100, 60),
            child: MenuCardPageAppBar(),
          ),

          /// this is a ListView contains Horizontal Pageview by CategryName
          body: ListView.separated(
            /// listview length is CategoryNames length
            itemCount: availableItemsListByCategoryMap.length,
            itemBuilder: (contxt, categoryIndex) {
              /// ListView item builder is
              /// pageview of availableItems by categoryName
              return PageviewOfAvailableitemsByCategoryname(
                categoryIndex: categoryIndex,
                availableItemsListByCategoryMap: availableItemsListByCategoryMap,
              );
            },
            separatorBuilder: (context, index) => const SizedBox(),
          ),
        );
      },
    );
  }
}
