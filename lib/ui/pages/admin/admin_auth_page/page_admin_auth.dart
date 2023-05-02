import 'package:cafemenu_app/ui/pages/admin/admin_auth_page/widgets/admin_register_signin.dart';
import 'package:cafemenu_app/ui/pages/admin/admin_home_page/page_admin_home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

/// this widget is page/screen for sign up or sign in admin.
/// this widget works with streamBuilder for
/// rebuild widget when any changes in this admin firebase authentiation state.
class PageAdminAuth extends StatelessWidget {
  const PageAdminAuth({Key? key}) : super(key: key);

  /// mainAdminEmail,adminCode are main admin sign in details
  /// understoood, has not sign in yet main admin if mainAdminEmail,adminCode are null.
  static String? mainAdminEmail;
  static String? adminCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        /// stream builder rebuild widget when any changes in this admin firebase authentiation state.
        child: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              return snapshot.connectionState == ConnectionState.waiting

                  /// show prores indicater when check admin connetion state.
                  ? const CircularProgressIndicator()

                  /// show error text when gets any error after check admin connetion state.
                  : snapshot.hasError
                      ? const Text("Somthing Went wrong")
                      : snapshot.hasData

                          /// show PageAdminHome widget/screen if firebaseAuth contains this admin data.
                          ? PageAdminHome()

                          /// show RegisterOrSigninAdmin widegt/screen if firebaseAuth contains this admin data.
                          : const RegisterOrSigninAdmin();
            }),
      ),
    );
  }
}
