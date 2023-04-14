import 'package:cafemenu_app/ui/pages/menucard_page/page_menucard.dart';
import 'package:flutter/material.dart';

class PageItem extends StatelessWidget {
  const PageItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Cart Item"),
        actions: [
          IconButton(
            onPressed: () {
              // appBar item delete/cart button
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: Stack(
        children: const [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text("Category Name"),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 40),
              child: Text("Sub Category Name"),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 70),
              child: Text("₹ 120.00/Pc only"),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: CountSection(mainAxisAlignment: MainAxisAlignment.center),
            ),
          ),
        ],
      ),
    );
  }
}
