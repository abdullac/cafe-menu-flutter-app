import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/ui/pages/diningcart_page/page_diningcart.dart';
import 'package:cafemenu_app/ui/pages/item_page/page_item.dart';
import 'package:cafemenu_app/ui/pages/menucard_page/widgets/item_by_category.dart';
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
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: DiningcartListItemSerialNumberAndIsSelectCheckBox(
                index: index,
                productModel: productModel,
                productModellist: productModellist,
                isSelectNotifier: isSelectNotifier,
              ),
            ),
            Expanded(
              flex: 3,
              child: DinngcartListItemImageContainerAndPrice(
                  productModel: productModel),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: SizedBox(
                  // width: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DiningcartListItemCategoryNameAndItemName(
                          productModel: productModel),
                      InfoToCustomer(productModel: productModel),
                      DiningcartListItemQty(
                          productModel: productModel,
                          setQtyNotifier: setQtyNotifier,
                          isSelectNotifier: isSelectNotifier),
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
                    DiningcartListItemDeleteButton(productModel: productModel),
                    // const DiningcartListItemIsRecievedCheckBox(),
                    const Text(
                      "8:41\nPM",
                      textAlign: TextAlign.center,
                    ),
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

class DinngcartListItemImageContainerAndPrice extends StatelessWidget {
  final ProductModel productModel;
  const DinngcartListItemImageContainerAndPrice({
    super.key,
    required this.productModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 90,
          width: 90,
          decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.grey[300]!.withOpacity(0.7), width: 2.5),
              shape: BoxShape.circle,
              color: Colors.teal[700],
              image: DecorationImage(
                  image: NetworkImage(
                      productModel.verticalImageUrl ?? sampleImageUrl),
                  fit: BoxFit.cover)),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
          margin: const EdgeInsets.only(bottom: 4),
          decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.5),
              borderRadius: const BorderRadius.all(Radius.circular(8))),
          child: Text(productModel.itemPrice != null
              ? "₹ ${productModel.itemPrice}/Pc"
              : "₹ N/A"),
        ),
      ],
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
        Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.5), shape: BoxShape.circle),
          child: Text("${index + 1}"),
        ),

        /// is diningCarlList item isSelect
        ValueListenableBuilder(
            valueListenable: isSelectNotifier,
            builder: (context, newValue, _) {
              return Checkbox(
                fillColor:
                    MaterialStateProperty.all(Colors.red.withOpacity(0.2)),
                checkColor: Colors.red,
                value: newValue,
                onChanged: (isSelect) {
                  // checkbox on changed (select unselect)
                  print("Qty${diningCartList[0].orderedQty}");
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
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(8), topRight: Radius.circular(8)),
          image: DecorationImage(
              image:
                  NetworkImage(productModel.verticalImageUrl ?? sampleImageUrl),
              fit: BoxFit.cover),
        ),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(8),
                  topRight: Radius.circular(8)),
              color: Colors.blue.withOpacity(1),
              gradient: LinearGradient(colors: [
                Colors.white,
                Colors.white.withOpacity(0.85),
                Colors.white.withOpacity(0.8),
              ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productModel.categoryName ?? "Category Name",
                style: const TextStyle(fontSize: 15),
              ),
              Text(
                productModel.itemName ?? "Sub category Name",
                maxLines: 2,
                overflow: TextOverflow.fade,
                style: TextStyle(
                    fontSize: productModel.itemName != null &&
                            productModel.itemName!.length > 15
                        ? 12
                        : 20,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DiningcartListItemQty extends StatelessWidget {
  const DiningcartListItemQty({
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
    return Padding(
      padding: EdgeInsets.only(top: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SetQtySetion(
            valueNotifier: setQtyNotifier,
            productModel: productModel,
            removeitemAtQty0: false,
            onIncreasePressed: () {
              additionalIncreaseOrDecreaseButtonPressed(
                  isSelectNotifier: isSelectNotifier);
              PageDiningCart.diningCartListViewNotifier.notifyListeners();
              print("QtyA ${diningCartList[0].orderedQty}");
            },
            onDecreasePressed: () {
              additionalIncreaseOrDecreaseButtonPressed(
                  isSelectNotifier: isSelectNotifier);
            },
          ),
        ],
      ),
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
    return InkWell(
      onTap: () {
        // cart item delete button pressed
        print("deleting progress...");
        deleteItemFromDiningCartList(productModel);
        PageDiningCart.diningCartListViewNotifier.value = diningCartList;
        PageDiningCart.diningCartListViewNotifier.notifyListeners();
      },
      child: Icon(
        Icons.delete,
        color: Colors.red.withOpacity(0.7),
      ),
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
      fillColor: MaterialStateProperty.all(Colors.red.withOpacity(0.2)),
      checkColor: Colors.red,
      value: false,
      onChanged: (value) {
        // item recieved checkbox changed
      },
    );
  }
}

class InfoToCustomer extends StatelessWidget {
  final ProductModel productModel;
  const InfoToCustomer({
    super.key,
    required this.productModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        productModel.infoToCustomer??"",
        style: TextStyle(fontSize: 10, color: Colors.red),
      ),
    );
  }
}
