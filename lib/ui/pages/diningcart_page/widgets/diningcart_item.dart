import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/ui/pages/diningcart_page/page_diningcart.dart';
import 'package:cafemenu_app/ui/pages/item_page/page_item.dart';
import 'package:cafemenu_app/utils/constants/lists.dart';
import 'package:cafemenu_app/utils/functions/set_qty_section.dart';
import 'package:cafemenu_app/utils/constants/enums.dart';
import 'package:cafemenu_app/utils/functions/diningcart_page/deleteitem_from_diningcartlist.dart';
import 'package:cafemenu_app/utils/functions/diningcart_page/find_total_itemsqtyamount.dart';
import 'package:cafemenu_app/utils/functions/diningcart_page/select_unselect_item.dart';
import 'package:flutter/material.dart';

class DiningCartItem extends StatelessWidget {
  final int index;
  final List<ProductModel> productModellist;
  const DiningCartItem({
    super.key,
    required this.index,
    required this.productModellist,
  });

  static ValueNotifier<bool?> isSelectNotifier = ValueNotifier(null);
  @override
  Widget build(BuildContext context) {
    // ValueNotifier<bool> isSelectNotifier =
    //     ValueNotifier(productModellist[index].isSelectDiningCart ?? true);
    isSelectNotifier =
        ValueNotifier(productModellist[index].isSelectDiningCart ?? true);

    ValueNotifier<int?> setQtyNotifier = ValueNotifier(null);
    ProductModel productModel = productModellist[index];
    return InkWell(
      onTap: () {
        // cart item image taped
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => PageItem(
                  productModel: productModel,
                  comingPage: ComingPage.diningCart,
                )));
      },
      child: Container(
        height: 150,
        margin: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DiningcartListItemSerialNumberAndIsSelectCheckBox(
              index: index,
              productModel: productModel,
              productModellist: productModellist,
              isSelectNotifier: isSelectNotifier,
            ),
            const DinngcartListItemImageContainer(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DiningcartListItemCategoryNameAndItemName(
                      productModel: productModel),
                  DiningcartListItemPriceAndQty(
                      productModel: productModel,
                      setQtyNotifier: setQtyNotifier,
                      isSelectNotifier: isSelectNotifier),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DiningcartListItemDeleteButton(productModel: productModel),
                const DiningcartListItemIsRecievedCheckBox(),
                const Text(
                  "8:41\nPM",
                  textAlign: TextAlign.center,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class DinngcartListItemImageContainer extends StatelessWidget {
  const DinngcartListItemImageContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 100,
      decoration: BoxDecoration(color: Colors.teal[700]),
    );
  }
}

class DiningcartListItemSerialNumberAndIsSelectCheckBox
    extends StatelessWidget {
  const DiningcartListItemSerialNumberAndIsSelectCheckBox({
    super.key,
    required this.index,
    required this.productModel,
    required this.productModellist,
    required this.isSelectNotifier,
  });

  final int index;
  final ProductModel productModel;
  final List<ProductModel> productModellist;
  final ValueNotifier<bool?> isSelectNotifier;

  @override
  Widget build(BuildContext context) {
    // isSelectNotifier =
    //     ValueNotifier(productModellist[index].isSelectDiningCart ?? true);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text("${index + 1}"),

        /// is diningCarlList item isSelect
        ValueListenableBuilder(
            valueListenable: isSelectNotifier,
            builder: (context, newValue, _) {
              return Checkbox(
                value: newValue,
                onChanged: (isSelect) {
                  // checkbox on changed (select unselect)
                  selectOrUnselectItem(
                    productModel: productModel,
                    isSelect: isSelect,
                    isSelectNotifier: isSelectNotifier,
                  );
                },
                shape: const CircleBorder(),
              );
            }),
      ],
    );
  }
}

class DiningcartListItemCategoryNameAndItemName extends StatelessWidget {
  const DiningcartListItemCategoryNameAndItemName({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          productModel.categoryName ?? "Category Name",
          style: const TextStyle(fontSize: 15),
        ),
        Text(
          productModel.itemName ?? "Sub category Name",
          style: const TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}

class DiningcartListItemPriceAndQty extends StatelessWidget {
  const DiningcartListItemPriceAndQty({
    super.key,
    required this.productModel,
    required this.setQtyNotifier,
    required this.isSelectNotifier,
  });

  final ProductModel productModel;
  final ValueNotifier<int?> setQtyNotifier;
  final ValueNotifier<bool?> isSelectNotifier;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(productModel.itemPrice != null
            ? "₹ ${productModel.itemPrice}/Pc"
            : "₹ N/A"),
        SetQtySetion(
          valueNotifier: setQtyNotifier,
          productModel: productModel,
          removeitemAtQty0: false,
          onIncreasePressed: () {
            additionalIncreaseOrDecreaseButtonPressed(
                isSelectNotifier: isSelectNotifier);
          },
          onDecreasePressed: () {
            additionalIncreaseOrDecreaseButtonPressed(
                isSelectNotifier: isSelectNotifier);
          },
        ),
      ],
    );
  }
}

class DiningcartListItemDeleteButton extends StatelessWidget {
  const DiningcartListItemDeleteButton({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        // cart item delete button pressed
        print("deleting progress...");
        deleteItemFromDiningCartList(productModel);
        PageDiningCart.diningCartListViewNotifier.value = diningCartList;
        PageDiningCart.diningCartListViewNotifier.notifyListeners();
      },
      icon: const Icon(Icons.delete_outline),
    );
  }
}

class DiningcartListItemIsRecievedCheckBox extends StatelessWidget {
  const DiningcartListItemIsRecievedCheckBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: false,
      onChanged: (value) {
        // item recieved checkbox changed
      },
    );
  }
}
