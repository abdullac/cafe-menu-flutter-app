import 'package:cafemenu_app/ui/pages/admin/admin_auth_page/page_admin_auth.dart';
import 'package:cafemenu_app/utils/functions/show_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// method for register as sub admin
Future signUpSubAdmin({
  required String adminEmail,
  required String adminPassword,
  required String adminCode,
}) async {
  /// register to firebaseAuth if admin code match for currect admincode
  if (adminCode == PageAdminAuth.adminCode) {
    showSnackBar("Register Proccessing...");
    final userCridential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: adminEmail.trim(),
      password: adminPassword.trim(),
    );

    /// show message after register
    showSnackBar(userCridential.user != null
        ? "Registered as Sub admin\n${userCridential.user!.email}"
        : "Registered as Sub admin");
  } else {
    /// show warning when incorrect adminCode
    showSnackBar("C'nt register,please enter correct Admin Code");
  }
}
