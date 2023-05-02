import 'package:cafemenu_app/utils/functions/admin/sign_up/save_mainadmin_code_email.dart';
import 'package:cafemenu_app/utils/functions/show_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// method for register as Main admin
Future signUpMainAdmin({
  required String adminEmail,
  required String adminPassword,
  required String adminCode,
}) async {
    showSnackBar("Register Proccessing...");
  /// register to firebaseAuth
  final userCridential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: adminEmail.trim(),
    password: adminPassword.trim(),
  );
  /// adminCode admin email save to firebase Database after register MainAdmin to firebase Auth
  String adminEmailFromSnapshot;
  if (userCridential.user != null && userCridential.user!.email != null) {
    adminEmailFromSnapshot = userCridential.user!.email!;
    /// method for adminCode and admin email save to firebase Database.
    saveMainAdminEmailAndAdminCode(
      mainAdminEmail: adminEmailFromSnapshot,
      adminCode: adminCode,
    );
  }
}
