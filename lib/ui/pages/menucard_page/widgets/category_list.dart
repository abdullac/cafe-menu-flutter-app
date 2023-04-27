import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/ui/pages/menucard_page/widgets/item_by_category.dart';
import 'package:flutter/material.dart';

/// this is child Listview (pageview) by categoryName of productModelList.
/// each child listview(pageview) with gategoryItems(items by category).
class CategoryListviewOfProductPageview extends StatelessWidget {
  final int categoryIndex;
  final Map<String, List<ProductModel>> listOfProductmodelByCategory;
  CategoryListviewOfProductPageview({
    super.key,
    required this.categoryIndex,
    required this.listOfProductmodelByCategory,
  });

  ValueNotifier<bool> pageViewLeftScrollNotifier = ValueNotifier(false);
  ValueNotifier<bool> pageViewRightScrollNotifier = ValueNotifier(true);
  PageController paeViewController = PageController();

  @override
  Widget build(BuildContext context) {
    /// sizedBox widget for set hight of listview
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if(categoryIndex == 0&& listOfProductmodelByCategory.length>1) {
        paeViewController.animateTo(200.0, duration: const Duration(seconds: 1), curve: Curves.linear);
      }
    });
    return SizedBox(
      height: 280,

      /// Stack widget for make categoryName top of ListView (pageview)
      /// it makes, no scroll categoryName with listView (pageview)
      child: Stack(
        children: [
          /// pageview with items by categoryName.
          NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              if (notification.metrics.extentBefore ==
                  notification.metrics.minScrollExtent) {
                pageViewLeftScrollNotifier.value = false;
              } else {
                pageViewLeftScrollNotifier.value = true;
              }
              if (notification.metrics.extentBefore ==
                  notification.metrics.maxScrollExtent) {
                pageViewRightScrollNotifier.value = false;
              } else {
                pageViewRightScrollNotifier.value = true;
              }
              return true;
            },
            child: PageView.builder(
              controller: paeViewController,
              itemCount: listOfProductmodelByCategory.values
                  .toList()[categoryIndex]
                  .length,
              itemBuilder: (context, categoryItemIndex) =>
                  productItemByCategory(
                /// convert Map values to values list for make Product Model list by that catgoryName,
                /// and pass item(productModel) to ItemByCategory widget
                productModel: listOfProductmodelByCategory.values
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
                listOfProductmodelByCategory.keys.toList()[categoryIndex],
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.red[400],
                    shadows:  [
                      const Shadow(
                        color: Colors.white,
                        blurRadius: 25,
                      ),
                      Shadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 0.5,
                        offset: const Offset(1, 1)
                      ),
                    ]),
              ),
            ),
          ),

          /// pageView previos button
          ValueListenableBuilder(
              valueListenable: pageViewLeftScrollNotifier,
              builder: (context, newLeftScrollValue, _) {
                return newLeftScrollValue == false
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
                              )),
                        ),
                      );
              }),

          /// pageView next button
          ValueListenableBuilder(
              valueListenable: pageViewRightScrollNotifier,
              builder: (context, newRightScrollValue, _) {
                return newRightScrollValue == false
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
              }),
        ],
      ),
    );
  }
}
