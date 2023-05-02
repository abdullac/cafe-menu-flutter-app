import 'package:cafemenu_app/ui/pages/admin/admin_auth_page/page_admin_auth.dart';
import 'package:cafemenu_app/ui/pages/admin/admin_auth_page/widgets/admin_register_signin.dart';
import 'package:cafemenu_app/utils/constants/enums.dart';

/// method for change page ui as register sub admin.mainAddmin, sign in,
/// using authenticationTypeNotifier value.
pageForSignUp() {
  final authentiationType =
      RegisterOrSigninAdmin.authenticationTypeNotifier.value;
  if ([AuthentiationType.registerMainAdmin, AuthentiationType.registerSubAdmin]
      .contains(authentiationType)) {
    RegisterOrSigninAdmin.authenticationTypeNotifier.value =
        AuthentiationType.signInAdmin;
  } else if (AuthentiationType.signInAdmin == authentiationType) {
    ///check adminCode for set value to authenticationTypeNotifier as main or sub admin.
    if (![PageAdminAuth.mainAdminEmail, PageAdminAuth.adminCode]
        .contains(null)) {
      RegisterOrSigninAdmin.authenticationTypeNotifier.value =
          AuthentiationType.registerSubAdmin;
    } else {
      RegisterOrSigninAdmin.authenticationTypeNotifier.value =
          AuthentiationType.registerMainAdmin;
    }
  }
  /// notify authenticationTypeNotifier for change authentication page ui.
  RegisterOrSigninAdmin.authenticationTypeNotifier.notifyListeners();
}
