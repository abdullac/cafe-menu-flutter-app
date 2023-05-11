import 'dart:developer';
import 'package:cafemenu_app/ui/pages/admin/admin_auth_page/page_admin_auth.dart';
import 'package:cafemenu_app/ui/pages/admin/admin_auth_page/widgets/admin_register_signin.dart';
import 'package:cafemenu_app/utils/functions/show_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

/// method for sign in admin with admin code
/// and get return UserCridential.
Future<UserCredential?> signIn(BuildContext context) async {
  /// get text values from Textfields and check values contains null or empty.
  List registerFields = [
    RegisterOrSigninAdmin.adminEmailEditingController.text,
    RegisterOrSigninAdmin.adminPasswordEditingController.text,
    RegisterOrSigninAdmin.adminCodeEditingController.text
  ];
  UserCredential? userCridential;
  if (!registerFields.contains("") && !registerFields.contains(null)) {
    try {
      /// check is admin adminCode.
      /// sign in to firebaseAuth if correct adminCode.
      if (RegisterOrSigninAdmin.adminCodeEditingController.text ==
          PageAdminAuth.adminCode) {
        /// sign in to firebaseAuth
        userCridential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: RegisterOrSigninAdmin.adminEmailEditingController.text.trim(),
          password:
              RegisterOrSigninAdmin.adminPasswordEditingController.text.trim(),
        );
      } else {
        /// show warning if incorrect adminCode.
        showSnackBar("C'nt sign in. adminCode incorrect");
      }
    } catch (e) {
      /// show error message when gets any error while sign in to firebaseAuth.
      showSnackBar("Somthing went wrong while sign in");
      log("email password sign in error cache $e");
      userCridential = null;
    }
  } else {
    /// show warning when textfield values null or empty.
    showSnackBar("please fill fields");
    userCridential = null;
  }

  /// show message user Credential if sign in,
  /// null value user Credential if not sign in
  if(userCridential != null && userCridential.user !=null) {
    showSnackBar(userCridential.user!.email ?? "C'nt signIn");
  }
  return userCridential;
}
