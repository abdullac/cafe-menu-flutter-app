import 'package:cafemenu_app/core/model/available_item/available_item_model.dart';
import 'package:cafemenu_app/core/provider/bloc/menucard_page/menucard_page_bloc.dart';
import 'package:cafemenu_app/core/provider/logics/get_shop_location.dart';
import 'package:cafemenu_app/core/provider/logics/user/menucard_page/find_location.dart';
import 'package:cafemenu_app/core/provider/logics/user/menucard_page/get_user_distence_condition.dart';
import 'package:cafemenu_app/core/services/firebase/firebase_refs.dart';
import 'package:cafemenu_app/ui/pages/user/menucard_page/widgets/category_list.dart';
import 'package:cafemenu_app/utils/constants/lists.dart';
import 'package:cafemenu_app/core/provider/logics/user/diningcart_page/make_diningcart_list.dart';
import 'package:cafemenu_app/core/provider/logics/user/menucard_page/get_availableitems_list.dart';
import 'package:cafemenu_app/core/provider/logics/user/menucard_page/productmodel_list_by_category.dart';
import 'package:cafemenu_app/utils/constants/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/menucard_page_appbar.dart';

/// this widget is like a screen/page for shows available items.
/// This Page shows items(list of AvailableItemModel)
/// this is the listView page.
/// each listView items Contains horizontal Pageview by items category name.
/// pageview items shows items(available items)by their cateegory name.
class PageMenuCard extends StatelessWidget {
  /// list of items(AvailableItemModel/available items) from realtime database
  const PageMenuCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      /// Bloc provider for Cirular prograss (isLocationLoading)
      BlocProvider.of<MenucardPageBloc>(context).add(const FindLocationByStream(
        // isLocationLoading: locationDistence == null ? true : false,
        isLocationLoading: false,
      ));

      getUserDistenceCondition();
      if (userDistenceCondition != null) {
        /// method for get shop location from firebase(admin side location)
        await getShopLocation();

        /// method for find user location and call blocProvider for rebuild menuCardPage
        /// show Available items listview when user is inside around shoplocation
        /// hide Available items listview when user is outside around shoplocation
        await positionStream(
          blocProvider: () {
            BlocProvider.of<MenucardPageBloc>(context)
                .add(const FindLocationByStream(
              isLocationLoading: false,
            ));
          },
        );
      }
    });

    /// mwnuCard page created with Stream builder for rebuild widget/page
    /// when get any change in available items of firebase database backend
    return Scaffold(
      /// appBar with goto DiningCart page button
      appBar: const PreferredSize(
        preferredSize: Size(100, 60),
        child: MenuCardPageAppBar(),
      ),

      /// this is a ListView contains Horizontal Pageview by CategryName
      body: BlocBuilder<MenucardPageBloc, MenucardPageState>(
        builder: (context, state) {
          return Stack(
            fit: StackFit.expand,
            children: [
              state.isLocationLoading == true
                  ? const Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Opacity(
                      opacity: state.isInsideLocation != true ? 0.6 : 1.0,
                      child: StreamBuilder(
                        /// get reference and child path from Firebasebackend class
                        /// for get event from database with stream of sytream builder.
                        stream: FirebaseRefs.availableItemsChild().onValue,
                        builder: (context, snapshot) {
                          Map<String, List<AvailableItemModel>>
                              availableItemsListByCategoryMap = {};
                          if (snapshot.data != null) {
                            // WidgetsBinding.instance.addPostFrameCallback((_) {
                              /// get list of available Items by stream builder snapshot
                            getAvailableItemsListByStreamBuilder(snapshot);

                            /// make/set diningCart List when streamBuilder build widget
                            /// diningCart list is cart List(order items list) of customer/user.
                            makeDiningCartListByStreamBuilder(
                                availableItemsList);
                                 /// method for making AvalableItemModel Map by categoryNames.
                          /// Map key is category name,
                          /// Map value is list of availableItems By that categoryName.
                          // Map<String, List<AvailableItemModel>>
                              availableItemsListByCategoryMap =
                              makeAvailableItemsListByCategoryMap(
                                  availableItemsList);
                            // });
                          }

                         
                          return ListView.separated(
                            /// listview length is CategoryNames length
                            itemCount: availableItemsListByCategoryMap.length,
                            itemBuilder: (contxt, categoryIndex) {
                              /// ListView item builder is
                              /// pageview of availableItems by categoryName
                              return PageviewOfAvailableitemsByCategoryname(
                                categoryIndex: categoryIndex,
                                availableItemsListByCategoryMap:
                                    availableItemsListByCategoryMap,
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(),
                          );
                        },
                      ),
                    ),
              state.isInsideLocation != true || state.isLocationLoading == true
                  ? Align(
                      alignment: Alignment.bottomCenter,
                      child: Visibility(
                        visible: true,
                        child: Container(
                          width: double.infinity,
                          color: Colors.red.withOpacity(0.4),
                          child: Text(
                            state.isInsideLocation != true
                                ? "You are not inside around shop"
                                : state.isLocationLoading == true
                                    ? "Location loading"
                                    : "",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          );
        },
      ),
    );
  }
}
