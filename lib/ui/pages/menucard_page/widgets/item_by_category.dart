import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/ui/pages/item_page/page_item.dart';
import 'package:cafemenu_app/ui/pages/menucard_page/widgets/count_price_widgets.dart';
import 'package:cafemenu_app/utils/constants/enums.dart';
import 'package:cafemenu_app/utils/constants/image_links.dart';
import 'package:flutter/material.dart';

/// this widget is itembuilder for availableItem widget of pageView by categoryName
class AvailableItemByCategory extends StatelessWidget {
  final ProductModel availableItem;
  const AvailableItemByCategory({
    super.key,
    required this.availableItem,
  });

  @override
  Widget build(BuildContext context) {
    /// inkWell widget for onTap function on list item
    return InkWell(
      onTap: () {
        // catyegory item image taped
        /// Navigate to pageItem with availableItem by pushReplacement when tap list item.
        /// and pass current page info(page info is before navigate page info)
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => PageItem(
              availableItem: availableItem,
              comingPage: ComingPage.menuCard,
            ),
          ),
        );
      },

      /// list item container widget for shows item image,item name, price... etc.
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(8)),

            /// background image
            image: DecorationImage(
                opacity: 0.4,
                image: NetworkImage(
                  availableItem.verticalImageUrl ?? sampleImageUrl,
                ),
                fit: BoxFit.cover)),

        /// Stack widget for shows availableItem details forground
        child: Stack(
          children: [
            Positioned(
              left: 10,
              bottom: 10,

              /// container for round forground image with border
              child: Container(
                height: 190,
                width: 190,
                decoration: BoxDecoration(
                  border:
                      Border.all(color: Colors.grey.withOpacity(0.7), width: 7),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                        availableItem.verticalImageUrl ?? sampleImageUrl,
                      ),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 15, bottom: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    /// text widget
                    /// shows itemName of availableItem
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Text(
                        availableItem.itemName ?? "N/A",
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                          /// blur shadows for highlite text
                          shadows: [
                            Shadow(
                              color: Colors.white,
                              blurRadius: 20,
                            )
                          ],
                        ),
                      ),
                    ),

                    /// text widget
                    /// shows leftQty(available item quantity) of availableItem
                    /// or availability(closed or not) availableItem.
                    Text(
                      availableItem.isClosed == null &&
                              availableItem.leftQty == null
                          ? ""
                          : availableItem.leftQty != null
                              ? "Left ${availableItem.leftQty} only"
                              : availableItem.isClosed == true
                                  ? "Closed"
                                  : "",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple.withOpacity(0.5)),
                    ),

                    /// show price and manage Qty widgets in Row
                    QtyPriceWidgets(
                      availableItem: availableItem,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
