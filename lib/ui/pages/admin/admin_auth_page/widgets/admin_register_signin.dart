import 'package:cafemenu_app/ui/pages/admin/admin_auth_page/page_admin_auth.dart';
import 'package:cafemenu_app/utils/constants/enums.dart';
import 'package:cafemenu_app/core/provider/logics/admin/sign_in/sign_in.dart';
import 'package:cafemenu_app/core/provider/logics/admin/sign_up/mainadmin_email_code.dart';
import 'package:cafemenu_app/core/provider/logics/admin/sign_up/page_for_signup.dart';
import 'package:cafemenu_app/core/provider/logics/admin/sign_up/signup_button_pressed.dart';
import 'package:cafemenu_app/utils/functions/show_snackbar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterOrSigninAdmin extends StatelessWidget {
  const RegisterOrSigninAdmin({
    super.key,
  });

  /// Notifier for which screen(register,main admin register,sign in) show in authentication page.
  static ValueNotifier<AuthentiationType?> authenticationTypeNotifier =
      ValueNotifier(null);

  /// Editing Controllers for get text from PageAdminAuth textFields
  static TextEditingController adminEmailEditingController =
      TextEditingController();
  static TextEditingController adminPasswordEditingController =
      TextEditingController();
  static TextEditingController adminCodeEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        if ([PageAdminAuth.mainAdminEmail, PageAdminAuth.adminCode]
            .contains(null)) {
          /// method for get already registered mainAdmin email and admincode,
          /// Notifier value change to returned AuthentiationType.
          /// NOtify Listner for change Widget/Screen as AuthentiationType value.
          authenticationTypeNotifier.value =
              await getMainAdminEmailAndAdminCode();
          authenticationTypeNotifier.notifyListeners();
        }
      },
    );
    return SingleChildScrollView(
      /// Value ListenerableBuilder for rebuild wdget/Screen as authenticationTypeNotifier value.
      child: ValueListenableBuilder(
          valueListenable: authenticationTypeNotifier,
          builder: (context, newAuthentiationType, _) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    /// PageAdminAuth Title text
                    Text(
                      /// title like as register Main Admin
                      AuthentiationType.registerMainAdmin ==
                              newAuthentiationType
                          ? "Register as Main Admin"

                          /// title like as register Sub Admin
                          : AuthentiationType.registerSubAdmin ==
                                  newAuthentiationType
                              ? "Register As Admin"

                              /// title like as Sign in Admin
                              : [AuthentiationType.signInAdmin]
                                      .contains(newAuthentiationType)
                                  ? "Sign in As Admin"
                                  : "Prepairing Authentication...",
                      textAlign: TextAlign.center,
                    ),

                    /// Email TextField
                    TextField(
                      controller: adminEmailEditingController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          hintText: "Email : ", border: OutlineInputBorder()),
                    ),

                    /// PassWord TextField
                    TextField(
                      controller: adminPasswordEditingController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: const InputDecoration(
                          hintText: "Password : ",
                          border: OutlineInputBorder()),
                    ),

                    /// AdminCode TextField
                    TextField(
                      controller: adminCodeEditingController,
                      obscureText: true,
                      decoration: const InputDecoration(
                          hintText: "Admin Code : ",
                          border: OutlineInputBorder()),
                    ),

                    ElevatedButton(
                      onPressed: () async {
                        /// registor/sign in button
                        /// button text and functionality change as authenticationType when
                        /// rebuild ValueNotifier builder.
                        /// button text as register, sign in
                        /// button functionality as register admin,register mainAdmin, sign in admin.
                        [
                          AuthentiationType.registerMainAdmin,
                          AuthentiationType.registerSubAdmin
                        ].contains(newAuthentiationType)

                            /// method for register admin onPress button
                            ? signUp(newAuthentiationType)
                            : [AuthentiationType.signInAdmin]
                                    .contains(newAuthentiationType)

                                /// method for sign in admin onPress button
                                ? await signIn(context)
                                : showSnackBar("no choosed register / sign in");
                      },
                      child: Text([
                        AuthentiationType.registerMainAdmin,
                        AuthentiationType.registerSubAdmin
                      ].contains(newAuthentiationType)
                          ? "Sign up"
                          : [AuthentiationType.signInAdmin]
                                  .contains(newAuthentiationType)
                              ? "Sign in"
                              : "!!!"),
                    ),

                    /// TextSpan with clickable text,
                    /// for change ui sing in to register
                    /// or register to sign in.
                    /// and change rich text as newAuthentiationType value
                    RichText(
                      text: TextSpan(
                          text: [
                            AuthentiationType.registerMainAdmin,
                            AuthentiationType.registerSubAdmin
                          ].contains(newAuthentiationType)
                              ? "No account. "
                              : [AuthentiationType.signInAdmin]
                                      .contains(newAuthentiationType)
                                  ? "Already have an account. "
                                  : "!!!",
                          style: const TextStyle(color: Colors.black),
                          children: [
                            TextSpan(

                                /// change page ui as register sub admin.mainAddmin, sign in.
                                recognizer: TapGestureRecognizer()
                                  ..onTap = pageForSignUp,
                                text: [
                                  AuthentiationType.registerMainAdmin,
                                  AuthentiationType.registerSubAdmin
                                ].contains(newAuthentiationType)
                                    ? "Sign in"
                                    : [AuthentiationType.signInAdmin]
                                            .contains(newAuthentiationType)
                                        ? "Sign up"
                                        : "!!!",
                                style: const TextStyle(color: Colors.blue))
                          ]),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
