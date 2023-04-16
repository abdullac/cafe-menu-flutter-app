import 'dart:math';
import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/ui/pages/item_page/page_item.dart';
import 'package:cafemenu_app/ui/pages/menucard_page/widgets/count_price_widgets.dart';
import 'package:cafemenu_app/utils/constants/colors.dart';
import 'package:cafemenu_app/utils/constants/enums.dart';
import 'package:flutter/material.dart';

/// this widget is builder item(productModel) widget of Listview by categoryName
class ItemByCategory extends StatelessWidget {
  final ProductModel productModel;
  const ItemByCategory({
    super.key,
    required this.productModel,
  });

  @override
  Widget build(BuildContext context) {
    /// inkWell widget for onTap function on list item
    return InkWell(
      onTap: () {
        // catyegory item image taped
        /// Navigate to pageItem with productModel by pushReplacement when tap list item.
        /// and pass current page info(page info is before navigate page info)
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => PageItem(
              productModel: productModel,
              comingPage: ComingPage.menuCard,
            ),
          ),
        );
      },

      /// list item container widget for shows item imag,item name, price... etc.
      child: Container(
        margin: const EdgeInsets.all(5),
        color: color[Random().nextInt(color.length)],

        /// olumn widget for shows widgets vertical alignment
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// text widget
            /// shows itemName of productModel
            Padding(
              padding: const EdgeInsets.only(top: 35),
              child: Text(
                productModel.itemName ?? "Sub CategoryList Name",
                style: const TextStyle(fontSize: 20),
              ),
            ),

            /// text widget
            /// shows leftQty(available item quantity) of productModel
            /// or availability(closed or not) ProductModel. 
            Text(
              productModel.isClosed == null && productModel.leftQty == null
                  ? ""
                  : productModel.leftQty != null
                      ? "Left ${productModel.leftQty} only"
                      : productModel.isClosed == true
                          ? "Closed"
                          : "",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple.withOpacity(0.5)),
            ),

            /// show price and manage Qty widgets in Row
            CountPriceWidgets(
              productModel: productModel,
            )
          ],
        ),
      ),
    );
  }
}
