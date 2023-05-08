import 'package:cafemenu_app/core/services/firebase/firebase_refs.dart';
import 'package:cafemenu_app/ui/pages/admin/admin_auth_page/page_admin_auth.dart';
import 'package:cafemenu_app/utils/constants/enums.dart';

/// method for get already registered mainAdmin email and admincode,
/// and show screen as sign in admin(AuthentiationType change to signInAdmin).
/// show screen as register Main Admin if not get main admin email and adminCode.
///
Future<AuthentiationType> getMainAdminEmailAndAdminCode() async {
  /// get admin reference child path from firebase database,
  final mainAdminEmailAndCodePath = FirebaseRefs.mainAminChild();
  final getMainAdminEmailAndCodeSnapshot =
      await mainAdminEmailAndCodePath.get();

  /// check availablity main admin email and adminCode with firebase database keys.
  final hasMainAdminEmail =
      getMainAdminEmailAndCodeSnapshot.hasChild("mainAdminEmail");
  final hasAdminCode = getMainAdminEmailAndCodeSnapshot.hasChild("adminCode");

  /// get values as String and assinn to variables and
  /// return AuthentiationType changed to signInAdmin if has mainAdminEmail and adminCode.
  /// return AuthentiationType changed to registerMainAdmin if has not mainAdminEmail and adminCode.
  if (![hasMainAdminEmail, hasAdminCode].contains(false)) {
    final valuesByMap =
        getMainAdminEmailAndCodeSnapshot.value as Map<dynamic, dynamic>;
    PageAdminAuth.mainAdminEmail = valuesByMap["mainAdminEmail"] as String;
    PageAdminAuth.adminCode = valuesByMap["adminCode"] as String;
    return AuthentiationType.signInAdmin;
  } else {
    return AuthentiationType.registerMainAdmin;
  }
}
