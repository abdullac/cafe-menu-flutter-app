import 'package:cafemenu_app/utils/functions/show_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// method for logout this admin.
Future<void> logOut() async {
  await FirebaseAuth.instance.signOut();
  showSnackBar("signed out");
}
