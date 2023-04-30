import 'package:cafemenu_app/admin/ui/admin_login_page/page_admin_login.dart';
import 'package:cafemenu_app/ui/pages/home_page/widgets/menu_card_button.dart';
import 'package:cafemenu_app/utils/constants/colors.dart';
import 'package:cafemenu_app/utils/constants/image_links.dart';
import 'package:flutter/material.dart';

class PageHome extends StatelessWidget {
  const PageHome({Key? key}) : super(key: key);

  static ValueNotifier<bool> isAdminButtonNotifier = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Home page background image container
      /// No set currently - image shows with networkImage,firebase storage image url
      /// currently - defualt NetWork image.
      body: Container(
        decoration: BoxDecoration(
          color: clrGreen,
          image: DecorationImage(
            image: NetworkImage(
              /// this image url is defualt network image url. we can make image from firebase storage (futurly)
              sampleImageUrl,
            ),
            fit: BoxFit.cover,
          ),
        ),

        /// Goto Menu Cadr button, goto admin page button. inside of column
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              /// button for goto menu card page
              const MenuCardButton(),

              /// this text is info for show admin page button (temperary porpose)
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  "Menu Card button long press for go to admin page",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),

              /// button for goto admin register or sign in
              /// this button show/hide when long press menu card buttton
              ValueListenableBuilder(
                  valueListenable: isAdminButtonNotifier,
                  builder: (context, newValue, _) {
                    return newValue == false

                        /// once, long press menucard button , then shows goto admin page button
                        /// again, long press menucard button , then hide goto admin page button(with sized box)
                        ? const SizedBox()
                        : IconButton(
                            onPressed: () {
                              /// admin iconButton pressed
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const PageAdminAuthorization(),
                                ),
                              );
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
