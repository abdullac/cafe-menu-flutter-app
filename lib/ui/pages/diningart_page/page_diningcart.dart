import 'package:cafemenu_app/ui/pages/item_page/page_item.dart';
import 'package:cafemenu_app/ui/pages/menucard_page/page_menucard.dart';
import 'package:flutter/material.dart';

class PageDiningCart extends StatelessWidget {
  const PageDiningCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                // appBar back button pressed
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back)),
          title: const Text("Your Dining Cart"),
        ),
        body: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 290),
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: ((context, index) => const DiningCartItem()),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  TotalItemQtyAmount(),
                  NameChair(),
                  OrderNumberTime(),
                  MultiPurposeButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TotalItemQtyAmount extends StatelessWidget {
  const TotalItemQtyAmount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Total"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Text("Items"),
            Text("Qty"),
            Text("Amount"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Text("5"),
            Text("9"),
            Text("890"),
          ],
        ),
      ],
    );
  }
}

class NameChair extends StatelessWidget {
  const NameChair({
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
      child: const Text("Take Now/additional/Running"),
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
  const DiningCartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Checkbox(
            value: true,
            onChanged: (value) {
              // checkbox on changed
            },
            shape: const CircleBorder(),
          ),
          InkWell(
            onTap: () {
              // cart item image taped
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const PageItem()));
            },
            child: Container(
              height: 140,
              width: 100,
              decoration: BoxDecoration(color: Colors.teal[700]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Category Name",
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      "Sub category Name",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text("₹ 120.00"),
                    CountSection(),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
              onPressed: () {
                // cart item delete button pressed
              },
              icon: const Icon(Icons.delete_outline))
        ],
      ),
    );
  }
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
