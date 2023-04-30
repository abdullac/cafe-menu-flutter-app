import 'dart:convert';
import 'package:cafemenu_app/admin/ui/admin_login_page/page_admin_login.dart';
import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/ui/pages/home_page/widgets/menu_card_button.dart';
import 'package:cafemenu_app/ui/pages/menucard_page/widgets/item_by_category.dart';
import 'package:cafemenu_app/utils/constants/colors.dart';
import 'package:cafemenu_app/utils/constants/lists.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class PageHome extends StatelessWidget {
  const PageHome({Key? key}) : super(key: key);

  static ValueNotifier<bool> isAdminButtonNotifier = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      /// menu card items list gets from firebase realtime database using getItemlist(),
      /// and returned asign to initialProductModelList.
      /// initialProductModelList is List of ProdectModel
      //  productModelList = await getItemslist();
      /// if porductModelList is empty, then shows circular progress indicator.
      /// if porductModelList is not empty, then show meuCard button
    });
    return Scaffold(
      /// Home page background image container
      /// image shows with networkImage,firebase storage image url
      body: Container(
        decoration: BoxDecoration(
          color: clrGreen,
          image: DecorationImage(image: NetworkImage(sampleImageUrl))
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              /// button for goto menu card page
              /// push Navigator with initialProductModelList
              const MenuCardButton(),
              const Text(
                "Menu Card button long press for go to admin page",
                style: TextStyle(color: Colors.black54, fontSize: 12),
              ),

              /// button for goto admin register or sign in
              ValueListenableBuilder(
                  valueListenable: isAdminButtonNotifier,
                  builder: (context, newValue, _) {
                    return newValue == false
                        ? SizedBox()
                        : IconButton(
                            onPressed: () {
                              /// admin iconButton pressed
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const PageAdminAuthorization()));
                            },
                            icon: const Icon(Icons.person),
                          );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
