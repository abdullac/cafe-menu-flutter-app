import 'dart:math';

import 'package:cafemenu_app/ui/pages/diningart_page/page_diningcart.dart';
import 'package:flutter/material.dart';

class PageMenuCard extends StatelessWidget {
  const PageMenuCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shop Name"),
        actions: [
          IconButton(
              onPressed: () {
                // goto dining cart button pressed
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const PageDiningCart()));
              },
              icon: const Icon(Icons.dining))
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (contxt, categoryIndex) =>
            Category(categoryIndex: categoryIndex),
      ),
    );
  }
}

class Category extends StatelessWidget {
  final int categoryIndex;
  const Category({super.key, required this.categoryIndex});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          PageView.builder(
            itemCount: 5,
            itemBuilder: (context, categoryItemIndex) =>
                CategoryItem(categoryItemIndex: categoryItemIndex),
          ),
          const Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                "Category Name",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final int categoryItemIndex;
  const CategoryItem({super.key, required this.categoryItemIndex});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.all(5),
          color: color[Random().nextInt(color.length)],
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Sub Category Name",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "Closed/Left",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple.withOpacity(0.5)),
                ),
                const CountPriceCartButtonSection()
              ],
            ),
          ),
        )
      ],
    );
  }
}

class CountPriceCartButtonSection extends StatelessWidget {
  const CountPriceCartButtonSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CountSection(),
        const Text("120/pc Only"),
        IconButton(
          onPressed: () {
            // dining cart button pressed
          },
          icon: const Icon(Icons.dining_outlined),
        )
      ],
    );
  }
}

class CountSection extends StatelessWidget {
  final MainAxisAlignment? mainAxisAlignment;
  const CountSection({
    super.key,
    this.mainAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () {
            // count decrease button pressed
          },
          icon: const Text(
            "-",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        const Text(
          "2",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        IconButton(
          onPressed: () {
            // count increase button pressed
          },
          icon: const Text(
            "+",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ],
    );
  }
}

List<Color> color = [
  Colors.blue,
  Colors.deepOrange,
  Colors.blueAccent,
  Colors.deepOrange,
  Colors.indigoAccent,
  Colors.lightBlue,
  Colors.indigo,
  Colors.green,
  Colors.pink,
  Colors.red,
];
