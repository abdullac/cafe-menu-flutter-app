import 'package:flutter/material.dart';

class PageGetOrderitem extends StatelessWidget {
  const PageGetOrderitem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            /// itemId
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.badge_outlined),
                SizedBox(width: 15),
                Text("itemId"),
              ],
            ),

            /// itemName
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.dining_outlined),
                SizedBox(width: 15),
                Text("itemName"),
              ],
            ),

            /// categoryName
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.category_outlined),
                SizedBox(width: 15),
                Text("categoryName"),
              ],
            ),

            /// itemPrice
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.money),
                SizedBox(width: 15),
                Text("itemPrice"),
              ],
            ),

            /// orderQty
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Qty"),
                SizedBox(width: 15),
                Text("orderedQty"),
              ],
            ),

            /// recivedTime
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.timer_outlined),
                SizedBox(width: 15),
                Text("recivedTime"),
              ],
            ),

            /// isDiningCart
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("isDiningCart"),
                SizedBox(width: 15),
                Text("Yes"),
              ],
            ),

            /// itemType
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("itemType"),
                SizedBox(width: 15),
                Icon(Icons.coffee),
              ],
            ),

            /// leftQty
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("leftQty"),
                SizedBox(width: 15),
                Text("leftQty"),
              ],
            ),

            ///

            /// vertical image
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon(Icons.image),
                // SizedBox(width: 15),
                Container(
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
