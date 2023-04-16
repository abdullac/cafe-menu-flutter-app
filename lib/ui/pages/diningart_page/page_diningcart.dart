import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/ui/pages/item_page/page_item.dart';
import 'package:cafemenu_app/ui/pages/menucard_page/page_menucard.dart';
import 'package:cafemenu_app/ui/pages/menucard_page/widgets/set_qty_section.dart';
import 'package:cafemenu_app/utils/constants/enums.dart';
import 'package:cafemenu_app/utils/constants/lists.dart';
import 'package:cafemenu_app/utils/functions/diningcart_page/find_total_itemsqtyamount.dart';
import 'package:flutter/material.dart';

int orderLength = 5;
int additionalOrderLength = 3;
int runningOrderLength = 2;
int length = orderLength + additionalOrderLength + runningOrderLength;

class PageDiningCart extends StatelessWidget {
  final List<ProductModel> diningCartList;
  const PageDiningCart({
    Key? key,
    required this.diningCartList,
  }) : super(key: key);

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
      body: diningCartList.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("You h'nt selected any item"),
                  IconButton(
                      onPressed: () {
                        // goto menucard page
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => PageMenuCard(
                                productModelList: initialProductModelList)));
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
                                (orderLength + additionalOrderLength - 1) &&
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
                      const NameChairNumber(),
                      const OrderNumberTime(),
                      const MultiPurposeButton(),
                    ],
                  ),
                ),
              ],
            ),
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
  const NameChairNumber({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Name:",
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Table/Chair No: "),
            DropdownButton(
              items: const <DropdownMenuItem<dynamic>>[
                DropdownMenuItem(value: "table",child: Text("Table"),),
                DropdownMenuItem(value: "chair",child: Text("Chair"),),
              ],
              onChanged: (value){
                print(value);
              },
            ),
            DropdownButton(
              value: 1,
              items: dropDownMenuItems(TableOrChair.chair),
              onChanged: (value) {
                // dropdown item changed
                print(value);
              },
            ),
          ],
        ),
      ],
    );
  }
}

class MultiPurposeButton extends StatelessWidget {
  const MultiPurposeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // take(Order) now button pressed
      },
      child: const Text("Take Now/additional/Running/paid/confirm order"),
    );
  }
}

class OrderNumberTime extends StatelessWidget {
  const OrderNumberTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Text("Order no: 598"),
            Text("Time: 8:31 PM"),
          ],
        ),
      ],
    );
  }
}

class DiningCartItem extends StatelessWidget {
  final int index;
  final List<ProductModel> productModellist;
  const DiningCartItem({
    super.key,
    required this.index,
    required this.productModellist,
  });

  //  static ValueNotifier<int?> setQtyNotifier = ValueNotifier(null);
  @override
  Widget build(BuildContext context) {
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
                Checkbox(
                  value: true,
                  onChanged: (value) {
                    // checkbox on changed
                  },
                  shape: const CircleBorder(),
                ),
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

changeDiningCartTotal() {
  TotalItemQtyAmount.diningCartTotalNotifier.value = findTotalitemsQtyAmount();
  TotalItemQtyAmount.diningCartTotalNotifier.notifyListeners();
}

enum TableOrChair {
  table,
  chair,
}

List<DropdownMenuItem> dropDownMenuItems(TableOrChair tableOrChair) {
  List<DropdownMenuItem> dropDownItemList = [];
  int count = tableOrChair == TableOrChair.table ? 7 : 40;
  for (int index = 0; index < count; index++) {
    dropDownItemList.add(DropdownMenuItem(
      value: index + 1,
      child: Text("${index + 1}"),
    ));
  }
  return dropDownItemList;
}
