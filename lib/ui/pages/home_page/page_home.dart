import 'package:cafemenu_app/main.dart';
import 'package:cafemenu_app/ui/pages/menucard_page/page_menucard.dart';
import 'package:cafemenu_app/utils/constants/size.dart';
import 'package:flutter/material.dart';

class PageHome extends StatelessWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.green,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 100),
            child: ElevatedButton(
              onPressed: () {
                // MenuCard button pressed
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const PageMenuCard()));
              },
              child: const Text("Menu Card"),
            ),
          ),
        ),
      ],
    );
  }
}
