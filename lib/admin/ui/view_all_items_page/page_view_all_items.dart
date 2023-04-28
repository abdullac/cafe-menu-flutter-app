import 'package:cafemenu_app/ui/pages/menucard_page/widgets/item_by_category.dart';
import 'package:flutter/material.dart';

class PageViewAllItems extends StatelessWidget {
  const PageViewAllItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return productModelItemTile(
                index: index,
              );
            },
            separatorBuilder: (context, index) => Container(
              color: Colors.red,
              height: 5,
            ),
            itemCount: 3,
          ),
        ),
      ),
    );
  }
}

class productModelItemTile extends StatelessWidget {
  final int index;
  const productModelItemTile({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text("Item Id : "),
        const Text("Item Name : "),
        const Text("Category Name : "),
        const Text("Item Price : "),
        const Text("Item Type : "),
        const Text("Available Qty : "),
        const Text("Left Qty : "),
        const Text("Is Closed : "),
        const Text("Item : "),
        Image(image: NetworkImage(sampleImageUrl)),
        ElevatedButton(
          onPressed: () {
            // item Edit button
          },
          child: const Text("Edit Item"),
        ),
        ElevatedButton(
          onPressed: () {
            // item Delete button
          },
          child: const Text("Delete Item"),
        ),
      ],
    );
  }
}
