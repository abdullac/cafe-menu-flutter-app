import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/ui/pages/menucard_page/widgets/item_by_category.dart';
import 'package:flutter/material.dart';

/// this is child Listview (pageview) by categoryName of productModelList.
/// each child listview(pageview) with gategoryItems(items by category).
class CategoryListviewOfProductPageview extends StatelessWidget {
  final int categoryIndex;
  final Map<String, List<ProductModel>> listOfProductmodelByCategory;
  const CategoryListviewOfProductPageview({
    super.key,
    required this.categoryIndex,
    required this.listOfProductmodelByCategory,
  });

  @override
  Widget build(BuildContext context) {
    /// sizedBox widget for set hight of listview
    return SizedBox(
      height: 280,

      /// Stack widget for make categoryName top of ListView (pageview)
      /// it makes, no scroll categoryName with listView (pageview)
      child: Stack(
        children: [
          /// pageview with items by categoryName.
          PageView.builder(
            itemCount: listOfProductmodelByCategory.values
                .toList()[categoryIndex]
                .length,
            itemBuilder: (context, categoryItemIndex) => productItemByCategory(
              /// convert Map values to values list for make Product Model list by that catgoryName,
              /// and pass item(productModel) to ItemByCategory widget
              productModel: listOfProductmodelByCategory.values
                  .toList()[categoryIndex][categoryItemIndex],
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
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: Colors.white,
                        blurRadius: 25,
                      )
                    ]),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              style: ButtonStyle(),
              onPressed: () {
                //
              },
              icon: Transform.scale(
                scaleX: -1.25,
                scaleY: 3,
                child: Icon(Icons.double_arrow_rounded,color: Colors.red.withOpacity(0.4),)),
            ),
          )
        ],
      ),
    );
  }
}
