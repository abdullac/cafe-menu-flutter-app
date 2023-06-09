import 'package:cafemenu_app/core/model/available_item/available_item_model.dart';
import 'package:cafemenu_app/ui/pages/user/diningcart_page/widgets/categoryname_and_itemname.dart';
import 'package:cafemenu_app/ui/pages/user/diningcart_page/widgets/diningcartlist_item_quandity.dart';
import 'package:cafemenu_app/ui/pages/user/diningcart_page/widgets/diningcartlitem_delete_button.dart';
import 'package:cafemenu_app/ui/pages/user/diningcart_page/widgets/imagecontainer_and_price.dart';
import 'package:cafemenu_app/ui/pages/user/diningcart_page/widgets/info_to_customer.dart';
import 'package:cafemenu_app/ui/pages/user/diningcart_page/widgets/serialnumber_and_selectchackbox.dart';
import 'package:cafemenu_app/ui/shared/pages/item_page/page_item.dart';
import 'package:cafemenu_app/utils/constants/enums.dart';
import 'package:flutter/material.dart';

/// this widget is itemBuilder(diningCartItem) of diningartList.
class DiningCartItem extends StatelessWidget {
  final int index;
  final List<AvailableItemModel> diningCartItemsList;
  const DiningCartItem({
    super.key,
    required this.index,
    required this.diningCartItemsList,
  });


  @override
  Widget build(BuildContext context) {
    /// get diningCartItem from diningCartItemsList using
    AvailableItemModel diningCartItem = diningCartItemsList[index];

    /// create setQtyNotifier for shows ordered Quantity
    ValueNotifier<int?> setQtyNotifier = ValueNotifier(null);

    return InkWell(
      onTap: () {
        // cart item image taped
        /// go to pageItem for shows This diningCartItem
        /// when tap on diningCartItem with pushReplacement.
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => PageItem(
              availableItem: diningCartItem,
              comingPage: ComingPage.diningCart,
            ),
          ),
        );
      },

      /// this container for setheight and margin for diningCartItem of diningCartList.
      child: Container(
        height: 155,
        margin: const EdgeInsets.all(5),
        child: Row(
          children: [
            Expanded(
              flex: 1,

              /// this widget contains serialNumbeer and isSelet CheckBox.
              child: DiningcartListItemSerialNumberAndIsSelectCheckBox(
                index: index,
                diningCartItem: diningCartItem,
                diningCartItemsList: diningCartItemsList,
              ),
            ),
            Expanded(
              flex: 3,

              /// this Widget contains image and price.
              child: DinngcartListItemImageContainerAndPrice(
                  diningCartItem: diningCartItem),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// this Widget contains CategoryName and ItemName.
                      DiningcartListItemCategoryNameAndItemName(
                          diningCartItem: diningCartItem),

                      /// this Widget contains any information/message to custmer.
                      InfoToCustomer(diningCartItem: diningCartItem),

                      /// this Widget contains Quantity and increase or decreadse button.
                      DiningcartListItemQty(
                        diningCartItem: diningCartItem,
                        setQtyNotifier: setQtyNotifier,
                        // isSelectNotifier: isSelectNotifier,
                        itemIndex: index,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    /// this Widget contains delete button.
                    DiningcartListItemDeleteButton(
                        diningCartItem: diningCartItem),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
