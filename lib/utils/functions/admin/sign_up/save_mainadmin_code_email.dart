import 'package:cafemenu_app/firebase_backend.dart';
import 'package:cafemenu_app/utils/functions/show_snackbar.dart';

/// method for save mainAdmin code and email to firebase Database 
Future saveMainAdminEmailAndAdminCode({
  required String mainAdminEmail,
  required String adminCode,
}) async {
  /// save to firebase database with firebase keys
  await FirebaseBackend.mainAminChildRef()
      .set({"mainAdminEmail": mainAdminEmail, "adminCode": adminCode});
      /// show message after save admin code and email.
  showSnackBar("admin code saved");
}
