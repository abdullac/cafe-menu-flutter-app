import 'package:cafemenu_app/ui/pages/menucard_page/page_menucard.dart';
import 'package:cafemenu_app/utils/constants/lists.dart';
import 'package:flutter/material.dart';

/// this is Elevated button widget for go to menucardPage

class MenuCardButton extends StatelessWidget {
  const MenuCardButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 100),
        child: ElevatedButton(
          onPressed: () async {
            // MenuCard button pressed
            /// Navigator with initialProductModelList,
            /// initialProductModelList for show all product Items(list of 'productModel') from firebase realtime database
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PageMenuCard(
                      productModelList: productModelList,
                    )));
          },
          child: const Text("Menu Card"),
        ),
      ),
    );
  }
}
