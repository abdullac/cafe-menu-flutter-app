import 'dart:developer';
import 'package:cafemenu_app/ui/pages/admin/admin_auth_page/widgets/admin_register_signin.dart';
import 'package:cafemenu_app/utils/constants/enums.dart';
import 'package:cafemenu_app/core/provider/logics/admin/sign_up/signup_main_admin.dart';
import 'package:cafemenu_app/core/provider/logics/admin/sign_up/signup_sub_admin.dart';
import 'package:cafemenu_app/utils/functions/show_snackbar.dart';

/// method for register/sign up admin when press adminAuthPage button
signUp(AuthentiationType? newAuthentiationType) {
  /// get values as String from textFields.
  String adminEmail = RegisterOrSigninAdmin.adminEmailEditingController.text;
  String adminPassword =
      RegisterOrSigninAdmin.adminPasswordEditingController.text;
  String adminCode = RegisterOrSigninAdmin.adminCodeEditingController.text;

  /// check values for contains null and empty
  List registerFields = [
    adminEmail,
    adminPassword,
    adminCode,
  ];
  if (!registerFields.contains("") && !registerFields.contains(null)) {
    try {
      if (newAuthentiationType == AuthentiationType.registerSubAdmin) {
        /// method for save/register to FirebaseAuth as SubAdmin
        signUpSubAdmin(
          adminEmail: adminEmail,
          adminPassword: adminPassword,
          adminCode: adminCode,
        );
      } else if (newAuthentiationType == AuthentiationType.registerMainAdmin) {
        /// method for save/register to FirebaseAuth as MainAdmin
        signUpMainAdmin(
          adminEmail: adminEmail,
          adminPassword: adminPassword,
          adminCode: adminCode,
        );
      }
    } catch (e) {
      /// show error when canoot register to firebase
      showSnackBar("Somthing went wrong");
      log("email password register error cathe $e");
    }
  } else {
    /// show warning message when pressed button with empty/null values
    showSnackBar("please fill fields");
  }
}
