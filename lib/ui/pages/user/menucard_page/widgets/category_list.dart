import 'dart:developer';
import 'package:cafemenu_app/core/model/available_item/available_item_model.dart';
import 'package:cafemenu_app/core/provider/bloc/menucard_page/menucard_page_bloc.dart';
import 'package:cafemenu_app/ui/pages/user/menucard_page/widgets/item_by_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// this is pageview by categoryName of availableItemModelList.
/// each pageview is List of availableItem (items by category).
/// pageView item shows availableItem
class PageviewOfAvailableitemsByCategoryname extends StatelessWidget {
  /// category index is position of category in availableItemsListByCategoryMap.
  final int categoryIndex;
  final Map<String, List<AvailableItemModel>> availableItemsListByCategoryMap;
  PageviewOfAvailableitemsByCategoryname({
    super.key,
    required this.categoryIndex,
    required this.availableItemsListByCategoryMap,
  });

  ///pageViewcontroller for automatic Animated scroll pageview
  PageController pageViewController = PageController();

  @override
  Widget build(BuildContext context) {
    int pageviewItemsCount =
        availableItemsListByCategoryMap.values.toList()[categoryIndex].length;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<MenucardPageBloc>(context).add(RightScrollIndicator(
          reachToEnd: pageviewItemsCount > 1 ? false : true,
          categoryIndex: categoryIndex));

      /// make automatically animated scroll for represent page view srollable,
      /// only animated scroll first pageView.
      if (categoryIndex == 0 && availableItemsListByCategoryMap.length > 1) {
        pageViewController.animateTo(
          150.0,
          duration: const Duration(milliseconds: 800),
          curve: Curves.linear,
        );
      }
    });

    /// set each pageview height
    return SizedBox(
      height: 280,

      /// Stack widget for make categoryName top of ListView (pageview)
      /// it makes, no scroll categoryName with listView (pageview)
      child: Stack(
        children: [
          /// UserScrollNotification for first pageView animated scroll
          NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              /// hide/show right or left sroll indicators when user scroll to pageview end  or start.
              BlocProvider.of<MenucardPageBloc>(context).add(
                  UserScrolledPageview(
                      notification: notification,
                      categoryIndex: categoryIndex));
              return true;
            },

            /// pageview with availableItemsList by categoryName.
            /// get values(AvailabliItemsList) from availableItemsListByCategoryMap
            child: PageView.builder(
              controller: pageViewController,
              itemCount: pageviewItemsCount,
              itemBuilder: (context, categoryItemIndex) =>
                  AvailableItemByCategory(
                /// get availableitem from values of availableItemsListByCategoryMap by category
                /// and pass AvailableItem as parameter to AvailableItemByCategory widget
                availableItem: availableItemsListByCategoryMap.values
                    .toList()[categoryIndex][categoryItemIndex],
              ),
            ),
          ),

          /// CategoryName text
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 10),

              /// convert Map keys to key List for give category title(text), top of listview.
              child: Text(
                availableItemsListByCategoryMap.keys.toList()[categoryIndex],
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.red[500],
                  shadows: [
                    const Shadow(
                      color: Colors.white,
                      blurRadius: 25,
                    ),
                    Shadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 0.5,
                        offset: const Offset(1, 1)),
                  ],
                ),
              ),
            ),
          ),

          /// pageView Left arrow
          BlocBuilder<MenucardPageBloc, MenucardPageState>(
            builder: (context, state) {
              return state.showLeftArrow == false &&
                      state.categoryIndex == categoryIndex
                  ? const SizedBox()
                  : Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        style: const ButtonStyle(),
                        onPressed: () {
                          //
                        },
                        icon: Transform.scale(
                          scaleX: 1.25,
                          scaleY: 3,
                          child: Icon(
                            Icons.double_arrow_rounded,
                            color: Colors.red.withOpacity(0.15),
                          ),
                        ),
                      ),
                    );
            },
          ),

          /// pageView Right Arrow
          BlocBuilder<MenucardPageBloc, MenucardPageState>(
            builder: (context, state) {
              return state.showRightArrow == false &&
                      state.categoryIndex == categoryIndex
                  ? const SizedBox()
                  : Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        style: const ButtonStyle(),
                        onPressed: () {
                          //
                        },
                        icon: Transform.scale(
                            scaleX: -1.25,
                            scaleY: 3,
                            child: Icon(
                              Icons.double_arrow_rounded,
                              color: Colors.red.withOpacity(0.15),
                            )),
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }
}

