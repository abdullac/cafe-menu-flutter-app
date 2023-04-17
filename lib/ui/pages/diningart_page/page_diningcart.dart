import 'package:cafemenu_app/core/model/customer/customer_model.dart';
import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/ui/pages/item_page/page_item.dart';
import 'package:cafemenu_app/ui/pages/menucard_page/page_menucard.dart';
import 'package:cafemenu_app/ui/pages/menucard_page/widgets/set_qty_section.dart';
import 'package:cafemenu_app/utils/constants/enums.dart';
import 'package:cafemenu_app/utils/constants/lists.dart';
import 'package:cafemenu_app/utils/functions/diningcart_page/find_total_itemsqtyamount.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

int orderLength = 5;
int additionalOrderLength = 3;
int runningOrderLength = 2;
int length = orderLength + additionalOrderLength + runningOrderLength;

int? orderNumber;
DateTime? orderedTime;

int setOrderNumber() {
  /// create method for get last number from firebase realtime database.
  int? lastOrderNumberFromFirebase = 611 + 1;

  /// set new order number to irebase realtime database.
  return lastOrderNumberFromFirebase ?? 10023;
}

DateTime setOrderTime() {
  DateTime getDateTimeNow = DateTime.now();

  /// method for set ordertime to firebase.
  return getDateTimeNow;
}

int setCustometId() {
  /// get last customer id number from firebase.
  /// create new ustomer id number.
  /// set new customer id number to  fire base.
  return 2051;
}

class PageDiningCart extends StatelessWidget {
  // final List<ProductModel> diningCartList;
  const PageDiningCart({
    Key? key,
    // required this.diningCartList,
  }) : super(key: key);

  static ValueNotifier diningCartListViewNotifier = ValueNotifier("_value");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              // appBar back button pressed
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) =>
                      PageMenuCard(productModelList: initialProductModelList)));
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text("Your Dining Cart"),
      ),
      body: ValueListenableBuilder(
          valueListenable: diningCartListViewNotifier,
          builder: (context, newValue, _) {
            return diningCartList.isEmpty
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text("You h'nt selected any item"),
                        IconButton(
                            onPressed: () {
                              // goto menucard page
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => PageMenuCard(
                                          productModelList:
                                              initialProductModelList)));
                            },
                            icon: const Icon(
                              Icons.add_circle,
                              color: Colors.green,
                            ))
                      ],
                    ),
                  )
                : Stack(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 290),
                          child: ListView.separated(
                            itemCount: diningCartList.length,
                            itemBuilder: ((context, index) => DiningCartItem(
                                  index: index,
                                  productModellist: diningCartList,
                                )),
                            separatorBuilder: (context, index) {
                              Widget container(Color color, String title) =>
                                  Container(
                                    height: 30,
                                    color: color,
                                    child: Center(child: Text(title)),
                                  );
                              if (index == orderLength - 1 &&
                                  additionalOrderLength > 0) {
                                return container(Colors.cyan, "Additional");
                              } else if (index ==
                                      (orderLength +
                                          additionalOrderLength -
                                          1) &&
                                  runningOrderLength > 0) {
                                return container(Colors.deepOrange, "Running");
                              } else {
                                return const SizedBox();
                              }
                            },
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TotalItemQtyAmount(diningCartList: diningCartList),
                            NameChairNumber(),
                            const OrderNumberTime(),
                            const DiningCartButton(),
                          ],
                        ),
                      ),
                    ],
                  );
          }),
    );
  }
}

class TotalItemQtyAmount extends StatelessWidget {
  final List<ProductModel> diningCartList;
  const TotalItemQtyAmount({
    super.key,
    required this.diningCartList,
  });

  static ValueNotifier<Map<String, dynamic>> diningCartTotalNotifier =
      ValueNotifier(findTotalitemsQtyAmount());
  @override
  Widget build(BuildContext context) {
    // Map<String, dynamic> findTotal = findTotalitemsQtyAmount();
    diningCartTotalNotifier.value = findTotalitemsQtyAmount();
    diningCartTotalNotifier.notifyListeners();
    return Column(
      children: [
        const Text(
          "Total",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        ValueListenableBuilder(
            valueListenable: diningCartTotalNotifier,
            builder: (context, findTotal, _) {
              return Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const Text("Items"),
                        Text("${findTotal['items']}"),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const Text("Qty"),
                        Text("${findTotal['Qty']}"),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const Text("Amount"),
                        Text("${findTotal['amount']}"),
                      ],
                    ),
                  ),
                ],
              );
            }),
      ],
    );
  }
}

class NameChairNumber extends StatelessWidget {
  NameChairNumber({
    super.key,
  });

  ValueNotifier<TableOrChair?> tableOrChairNotifier = ValueNotifier(null);
  static ValueNotifier<String?> tableOrChairNumberNotifier =
      ValueNotifier(null);
  static TextEditingController customerNameEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: DiningCartButton.diningCartButtonNotifier,
        builder: (context, diningCartButtonType, _) {
          return diningCartButtonType == null
              ? Container(
                  height: 5,
                  width: 200,
                  color: Colors.pink.withOpacity(0.4),
                )
              : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),

                      /// customer name textFieald
                      child: TextField(
                        controller: customerNameEditingController,
                        decoration: const InputDecoration(
                          hintText: "Name:",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Table/Chair No: "),
                        ValueListenableBuilder(
                            valueListenable: tableOrChairNotifier,
                            builder: (context, tableOrChair, _) {
                              /// select table or chair dropDown
                              return DropdownButton(
                                value: tableOrChair,
                                items: const <DropdownMenuItem<dynamic>>[
                                  DropdownMenuItem(
                                    value: null,
                                    child: Text("-Select-"),
                                  ),
                                  DropdownMenuItem(
                                    value: TableOrChair.table,
                                    child: Text("Table"),
                                  ),
                                  DropdownMenuItem(
                                    value: TableOrChair.chair,
                                    child: Text("Chair"),
                                  ),
                                ],
                                onChanged: (value) {
                                  // dropdown item changed
                                  tableOrChairNotifier.value = value;
                                  tableOrChairNotifier.notifyListeners();
                                  tableOrChairNumberNotifier.value =
                                      value == null ? null : "-1";
                                  tableOrChairNumberNotifier.notifyListeners();
                                },
                              );
                            }),
                        ValueListenableBuilder(
                            valueListenable: tableOrChairNumberNotifier,
                            builder: (context, newValue, _) {
                              /// seat number by table/chair
                              return DropdownButton(
                                value: newValue,
                                items: dropDownMenuItems(
                                    tableOrChairNotifier.value),
                                onChanged: (value) {
                                  // dropdown item changed
                                  tableOrChairNumberNotifier.value = value;
                                  tableOrChairNumberNotifier.notifyListeners();
                                },
                              );
                            }),
                      ],
                    ),
                  ],
                );
        });
  }
}

class OrderNumberTime extends StatelessWidget {
  const OrderNumberTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String? formattedOrderedTime;
    if (orderedTime != null) {
      formattedOrderedTime = DateFormat("hh:mm aa").format(orderedTime!);
    }
    return ValueListenableBuilder(
        valueListenable: DiningCartButton.diningCartButtonNotifier,
        builder: (context, diningCartButtonType, _) {
          return [null, DiningCartButtonType.takeNow]
                  .contains(diningCartButtonType)
              ? Container(
                  height: 5,
                  width: 200,
                  color: Colors.orange.withOpacity(0.4),
                )
              : Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Order no: ${orderNumber ?? ''}"),
                        Text("Time: ${formattedOrderedTime ?? ''}"),
                      ],
                    ),
                  ],
                );
        });
  }
}

class DiningCartItem extends StatelessWidget {
  final int index;
  final List<ProductModel> productModellist;
  DiningCartItem({
    super.key,
    required this.index,
    required this.productModellist,
  });

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isSelectNotifier =
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
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("${index + 1}"),
                ValueListenableBuilder(
                    valueListenable: isSelectNotifier,
                    builder: (context, newValue, _) {
                      return Checkbox(
                        value: newValue,
                        onChanged: (isSelect) {
                          // checkbox on changed (select unselect)
                          print(isSelect);
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
            ),
            Container(
              height: 140,
              width: 100,
              decoration: BoxDecoration(color: Colors.teal[700]),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
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
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(productModel.itemPrice != null
                          ? "₹ ${productModel.itemPrice}/Pc"
                          : "₹ N/A"),
                      SetQtySetion(
                        valueNotifier: setQtyNotifier,
                        productModel: productModel,
                        onIncreasePressed: () => changeDiningCartTotal(),
                        onDecreasePressed: () => changeDiningCartTotal(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    // cart item delete button pressed
                    print("deleteng progres...");
                    deleteItemFromDiningCartList(productModel);
                    PageDiningCart.diningCartListViewNotifier.notifyListeners();
                  },
                  icon: const Icon(Icons.delete_outline),
                ),
                Checkbox(
                  value: false,
                  onChanged: (value) {
                    // item recieved checkbox changed
                  },
                ),
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

class DiningCartButton extends StatelessWidget {
  const DiningCartButton({
    super.key,
  });

  static ValueNotifier<DiningCartButtonType?> diningCartButtonNotifier =
      ValueNotifier(null);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // take(Order) now button pressed
        setDiningCartButtonType(diningCartButtonNotifier);
      },
      child: ValueListenableBuilder(
          valueListenable: diningCartButtonNotifier,
          builder: (context, buttonValue, _) {
            return Text(setDiningCartButtonTitle(buttonValue));
          }),
    );
  }
}

enum DiningCartButtonType {
  takeNow,
  orderConfirm,
  additionalOrder,
  confirmAdditionalOrder,
  runningOrder,
  confirmRunningOrder,
  gotoGallery,
  // cancelOrder,
  // payAmount
}
// "Take Now/additional/Running/paid/confirm order"

void setDiningCartButtonType(
    ValueNotifier<DiningCartButtonType?> diningCartButtonNotifier) {
  switch (diningCartButtonNotifier.value) {
    case null:
      diningCartButtonNotifier.value = DiningCartButtonType.takeNow;
      break;
    case DiningCartButtonType.takeNow:
      String customerName = NameChairNumber.customerNameEditingController.text;
      if (customerName.isEmpty ||
          [null, -1]
              .contains(NameChairNumber.tableOrChairNumberNotifier.value)) {
        print("Please fill Name or select Table/Chair");
      } else {
        orderNumber = setOrderNumber();
        orderedTime = setOrderTime();
        final customerModelJson = createCustemerModelJson();
        /////// orderSaveToFireBaseDatabase(customerModelJson); /// important
        diningCartButtonNotifier.value = DiningCartButtonType.orderConfirm;
      }
      break;
    case DiningCartButtonType.orderConfirm:
      diningCartButtonNotifier.value = DiningCartButtonType.additionalOrder;
      break;
    case DiningCartButtonType.additionalOrder:
      diningCartButtonNotifier.value =
          DiningCartButtonType.confirmAdditionalOrder;
      break;
    case DiningCartButtonType.confirmAdditionalOrder:
      diningCartButtonNotifier.value = DiningCartButtonType.runningOrder;
      break;
    case DiningCartButtonType.runningOrder:
      diningCartButtonNotifier.value = DiningCartButtonType.confirmRunningOrder;
      break;
    case DiningCartButtonType.confirmRunningOrder:
      //
      break;

    default:
  }
  diningCartButtonNotifier.notifyListeners();
}

Map<String, dynamic> createCustemerModelJson() {
  final diningCartitemJsonList = diningCartList.map((e) {
    return e.toJson();
  }).toList();
  final totalItemsQtyAmount = TotalItemQtyAmount.diningCartTotalNotifier.value;
  CustomerModel customerModel = CustomerModel(
      productModelOrderList: diningCartitemJsonList,
      customerId: setCustometId(),
      customerName: NameChairNumber.customerNameEditingController.text,
      isTakeNow: true,
      isOrderConfirmed: true,
      orderNumber: orderNumber,
      orderedTime: orderedTime,
      totalItems: totalItemsQtyAmount["items"],
      totalQty: totalItemsQtyAmount["Qty"],
      totalAmount: totalItemsQtyAmount["amount"],
      positionCode: NameChairNumber.tableOrChairNumberNotifier.value,
      orderType: OrderType.order);
  return customerModel.toJson();
}

orderSaveToFireBaseDatabase(Map<String, dynamic> customerModelJson) {
  DatabaseReference databaseRef = FirebaseDatabase.instance.ref();
  databaseRef.child("cafeMenu/orders/orderList").update({
    "1": customerModelJson
  });
  print("saving...");
  // fireBaseDatabaseReference.child("cafeMenu/menuCard/").set({"itemsSample": [pM, pMt, pMr, pMg]});
}

String setDiningCartButtonTitle(DiningCartButtonType? buttonValue) {
  return buttonValue == null
      ? "Take Now"
      : buttonValue == DiningCartButtonType.takeNow
          ? "Confirm Order"
          : buttonValue == DiningCartButtonType.orderConfirm
              ? "Additional Order"
              : buttonValue == DiningCartButtonType.additionalOrder
                  ? "Confirm Additional Order"
                  : buttonValue == DiningCartButtonType.confirmAdditionalOrder
                      ? "Running Order"
                      : buttonValue == DiningCartButtonType.runningOrder
                          ? "Confirm Running Order"
                          : buttonValue ==
                                  DiningCartButtonType.confirmAdditionalOrder
                              ? "Cafe Gallery"
                              : "!!!";
}

changeDiningCartTotal() {
  TotalItemQtyAmount.diningCartTotalNotifier.value = findTotalitemsQtyAmount();
  TotalItemQtyAmount.diningCartTotalNotifier.notifyListeners();
}

enum TableOrChair {
  table,
  chair,
}

List<DropdownMenuItem> dropDownMenuItems(TableOrChair? tableOrChair) {
  List<DropdownMenuItem> dropDownItemList = [];
  if (tableOrChair == null) {
    dropDownItemList
        .add(const DropdownMenuItem(value: null, child: Text("--")));
  } else {
    int count = tableOrChair == TableOrChair.table ? 8 : 40;
    for (int index = 0; index < count; index++) {
      if (index == 0) {
        dropDownItemList.add(const DropdownMenuItem(
          value: "-1",
          child: Text("-Select-"),
        ));
      } else {
        dropDownItemList.add(DropdownMenuItem(
          value: tableOrChair == TableOrChair.table ? "T$index" : "C$index",
          child: Text("$index"),
        ));
      }
    }
  }
  return dropDownItemList;
}

deleteItemFromDiningCartList(ProductModel productModel) {
  String? itemNameTemp = productModel.itemName;
  if (itemNameTemp == null) {
    print("C'nt delete Item");
  } else {
    int? itemPosition;
    for (var element in diningCartList) {
      if (element.itemName == itemNameTemp) {
        itemPosition = diningCartList.indexOf(element);
        break;
      }
    }
    if (itemPosition != null) {
      diningCartList.removeAt(itemPosition);
    } else {
      print("Sorry, C'nt find item");
    }
  }
}

selectOrUnselectItem(
    {required ProductModel productModel,
    required bool? isSelect,
    required ValueNotifier<bool> isSelectNotifier}) {
  int? getLatestOrderedQty;
  diningCartList.forEach((element) {
    if (element.itemName == productModel.itemName) {
      getLatestOrderedQty = element.orderedQty;
    }
  });
  if (isSelect != null && getLatestOrderedQty != null) {
    print(
        "orderedQty : notLatest${productModel.orderedQty}, latest $getLatestOrderedQty");
    Map<String, dynamic> currentCartTotals =
        TotalItemQtyAmount.diningCartTotalNotifier.value;
    if (isSelect == false) {
      currentCartTotals["items"] -= 1;
      currentCartTotals["Qty"] -= getLatestOrderedQty;
      if (![getLatestOrderedQty, productModel.itemPrice].contains(null)) {
        currentCartTotals["amount"] -=
            ((getLatestOrderedQty!).toDouble() * productModel.itemPrice!);
      }
      updateProductModelToDiningCartList(
          productModel, getLatestOrderedQty!, isSelect);
      isSelectNotifier.value = isSelect;
      isSelectNotifier.notifyListeners();
    } else {
      currentCartTotals["items"] += 1;
      currentCartTotals["Qty"] += getLatestOrderedQty;
      if (![getLatestOrderedQty, productModel.itemPrice].contains(null)) {
        currentCartTotals["amount"] +=
            ((getLatestOrderedQty!).toDouble() * productModel.itemPrice!);
      }
      updateProductModelToDiningCartList(
          productModel, getLatestOrderedQty!, isSelect);
      isSelectNotifier.value = isSelect;
      isSelectNotifier.notifyListeners();
    }

    TotalItemQtyAmount.diningCartTotalNotifier.value = currentCartTotals;
    TotalItemQtyAmount.diningCartTotalNotifier.notifyListeners();
  }
}

updateProductModelToDiningCartList(
    ProductModel productModel, int orderedQty, bool isSelect) {
  /// int elementPosition for gets current position of that ProdutModel from diningCartList. temporary usage
  /// iterate diningCartList for find current position of that ProdutModel position.
  int? elementPosition;
  for (var element in diningCartList) {
    if (element.itemName == productModel.itemName) {
      elementPosition = diningCartList.indexOf(element);
      break;
    }
  }

  /// upadate ProductModel to that position of diningCartList if elementPosition contains any value
  /// add new data to diningCartList as productModel if elementPosition is null
  if (elementPosition != null) {
    diningCartList[elementPosition] = productModel.copyWith(
        orderedQty: orderedQty, isSelectDiningCart: isSelect);
  } else {
    diningCartList.add(productModel.copyWith(
        orderedQty: orderedQty, isSelectDiningCart: isSelect));
  }
  print("isSelcet $isSelect");
}
