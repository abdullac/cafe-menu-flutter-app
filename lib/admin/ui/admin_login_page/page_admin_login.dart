import 'package:cafemenu_app/admin/ui/admin_home_page/page_admin_home.dart';
import 'package:cafemenu_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class PageAdminAuthorization extends StatelessWidget {
  const PageAdminAuthorization({Key? key}) : super(key: key);

  static String? mainAdminEmail;
  static String? adminCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              return snapshot.connectionState == ConnectionState.waiting
                  ? const CircularProgressIndicator()
                  : snapshot.hasError
                      ? const Text("Somthing Went wrong")
                      : snapshot.hasData
                          ? PageAdminHome()
                          : const RegisterAsMainAdmin();
            }),
      ),
    );
  }
}

enum AuthentiationType {
  registerMainAdmin,
  registerSubAdmin,
  // signInMainAdmin,
  // signInSubAdmin,
  signInAdmin,
}

class RegisterAsMainAdmin extends StatelessWidget {
  const RegisterAsMainAdmin({
    super.key,
  });

  static ValueNotifier<AuthentiationType?> authenticationTypeNotifier =
      ValueNotifier(null);
  static TextEditingController adminEmailEditingController =
      TextEditingController();
  static TextEditingController adminPasswordEditingController =
      TextEditingController();
  static TextEditingController adminCodeEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if ([
        PageAdminAuthorization.mainAdminEmail,
        PageAdminAuthorization.adminCode
      ].contains(null)) {
        authenticationTypeNotifier.value =
            await getMainAdminEmailAndAdminCode();
        authenticationTypeNotifier.notifyListeners();
      }
    });
    return SingleChildScrollView(
      child: ValueListenableBuilder(
          valueListenable: authenticationTypeNotifier,
          builder: (context, newAuthentiationType, _) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      AuthentiationType.registerMainAdmin ==
                              newAuthentiationType
                          ? "Register as Main Admin"
                          : AuthentiationType.registerSubAdmin ==
                                  newAuthentiationType
                              ? "Register As Admin"
                              : [
                                  // AuthentiationType.signInMainAdmin,
                                  // AuthentiationType.signInSubAdmin
                                  AuthentiationType.signInAdmin
                                ].contains(newAuthentiationType)
                                  ? "Sign in As Admin"
                                  : "Prepairing Authentication...",
                      textAlign: TextAlign.center,
                    ),
                    TextField(
                      controller: adminEmailEditingController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          hintText: "Email : ", border: OutlineInputBorder()),
                    ),
                    TextField(
                      controller: adminPasswordEditingController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: const InputDecoration(
                          hintText: "Password : ",
                          border: OutlineInputBorder()),
                    ),
                    TextField(
                      controller: adminCodeEditingController,
                      obscureText: true,
                      decoration: const InputDecoration(
                          hintText: "Admin Code : ",
                          border: OutlineInputBorder()),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        /// registor button

                        [
                          AuthentiationType.registerMainAdmin,
                          AuthentiationType.registerSubAdmin
                        ].contains(newAuthentiationType)
                            ? onClickedSignUp(newAuthentiationType)
                            : [
                                // AuthentiationType.signInMainAdmin,
                                // AuthentiationType.signInSubAdmin
                                AuthentiationType.signInAdmin
                              ].contains(newAuthentiationType)
                                ? await signIn(context)
                                : print("no choosed register / sign in");

                        // final userCridential = await signIn(context);
                        // print(userCridential ?? "C'nt registor");
                      },
                      child: Text([
                        AuthentiationType.registerMainAdmin,
                        AuthentiationType.registerSubAdmin
                      ].contains(newAuthentiationType)
                          ? "Sign up"
                          : [
                              // AuthentiationType.signInMainAdmin,
                              // AuthentiationType.signInSubAdmin
                              AuthentiationType.signInAdmin
                            ].contains(newAuthentiationType)
                              ? "Sign in"
                              : "!!!"),
                    ),
                    RichText(
                      text: TextSpan(
                          text: [
                            AuthentiationType.registerMainAdmin,
                            AuthentiationType.registerSubAdmin
                          ].contains(newAuthentiationType)
                              ? "No account. "
                              : [
                                  // AuthentiationType.signInMainAdmin,
                                  // AuthentiationType.signInSubAdmin
                                  AuthentiationType.signInAdmin
                                ].contains(newAuthentiationType)
                                  ? "Already have account. "
                                  : "!!!",
                          style: const TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = pageForSignUp,
                                text: [
                                  AuthentiationType.registerMainAdmin,
                                  AuthentiationType.registerSubAdmin
                                ].contains(newAuthentiationType)
                                    ? "Sign in"
                                    : [
                                        // AuthentiationType.signInMainAdmin,
                                        // AuthentiationType.signInSubAdmin
                                        AuthentiationType.signInAdmin
                                      ].contains(newAuthentiationType)
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

class SignInAsSubAdmin extends StatelessWidget {
  const SignInAsSubAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

pageForSignUp() {
  final authentiationType =
      RegisterAsMainAdmin.authenticationTypeNotifier.value;
  if ([AuthentiationType.registerMainAdmin, AuthentiationType.registerSubAdmin]
      .contains(authentiationType)) {
    RegisterAsMainAdmin.authenticationTypeNotifier.value =
        AuthentiationType.signInAdmin;
  } else if (AuthentiationType.signInAdmin == authentiationType) {
    if (![
      PageAdminAuthorization.mainAdminEmail,
      PageAdminAuthorization.adminCode
    ].contains(null)) {
      RegisterAsMainAdmin.authenticationTypeNotifier.value =
          AuthentiationType.registerSubAdmin;
    } else {
      RegisterAsMainAdmin.authenticationTypeNotifier.value =
          AuthentiationType.registerMainAdmin;
    }
  }
  RegisterAsMainAdmin.authenticationTypeNotifier.notifyListeners();
}

Future<UserCredential?> signIn(BuildContext context) async {
  List registerFields = [
    RegisterAsMainAdmin.adminEmailEditingController.text,
    RegisterAsMainAdmin.adminPasswordEditingController.text,
    RegisterAsMainAdmin.adminCodeEditingController.text
  ];
  UserCredential? userCridential;
  if (!registerFields.contains("") && !registerFields.contains(null)) {
    // showDialog(
    //     context: context,
    //     barrierDismissible: false,
    //     builder: (context) => const Center(
    //           child: CircularProgressIndicator(strokeWidth: 2),
    //         ));
    try {
      if (RegisterAsMainAdmin.adminCodeEditingController.text ==
          PageAdminAuthorization.adminCode) {
        userCridential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: RegisterAsMainAdmin.adminEmailEditingController.text.trim(),
          password:
              RegisterAsMainAdmin.adminPasswordEditingController.text.trim(),
        );
      } else {
        print("C'nt sign in. adminCode incorrect");
      }
    } catch (e) {
      print("email password register error ache $e");
      userCridential = null;
    }
    // navigatorKey.currentState!.popUntil((route) => route.isFirst);
  } else {
    print("please fill fields");
    userCridential = null;
  }
  print(userCridential ?? "C'nt signIn");
  return userCridential;
}

onClickedSignUp(AuthentiationType? newAuthentiationType) {
  String adminEmail = RegisterAsMainAdmin.adminEmailEditingController.text;
  String adminPassword =
      RegisterAsMainAdmin.adminPasswordEditingController.text;
  String adminCode = RegisterAsMainAdmin.adminCodeEditingController.text;
  List registerFields = [
    adminEmail,
    adminPassword,
    adminCode,
  ];
  if (!registerFields.contains("") && !registerFields.contains(null)) {
    // showDialog(
    //     context: context,
    //     barrierDismissible: true,
    //     builder: (builder) => Center(
    //           child: CircularProgressIndicator(),
    //         ));
    try {
      if (newAuthentiationType == AuthentiationType.registerSubAdmin) {
        signUpSubAdmin(
          adminEmail: adminEmail,
          adminPassword: adminPassword,
          adminCode: adminCode,
        );
      } else if (newAuthentiationType == AuthentiationType.registerMainAdmin) {
        signUpMainAdmin(
          adminEmail: adminEmail,
          adminPassword: adminPassword,
          adminCode: adminCode,
        );
      }
    } catch (e) {
      print("email password register error cathe $e");
    }
    // navigatorKey.currentState!.popUntil((route) => route.isFirst);
  } else {
    print("please fill fields");
  }
}

Future signUpSubAdmin({
  required String adminEmail,
  required String adminPassword,
  required String adminCode,
}) async {
  if (adminCode == PageAdminAuthorization.adminCode) {
    final userCridential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: adminEmail.trim(),
      password: adminPassword.trim(),
    );
    print(userCridential);
  } else {
    print("C'nt register, AdminCode is not correct");
  }
}

Future signUpMainAdmin({
  required String adminEmail,
  required String adminPassword,
  required String adminCode,
}) async {
  final userCridential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: adminEmail.trim(),
    password: adminPassword.trim(),
  );
  String adminEmailFromSnapshot;
  if (userCridential.user != null && userCridential.user!.email != null) {
    adminEmailFromSnapshot = userCridential.user!.email!;
    setMainAdminEmailAndAdminCode(
      mainAdminEmail: adminEmailFromSnapshot,
      adminCode: adminCode,
    );
  }
}

Future setMainAdminEmailAndAdminCode({
  required String mainAdminEmail,
  required String adminCode,
}) async {
  DatabaseReference firebaseRef = FirebaseDatabase.instance.ref();
  final mainAdminEmailAndCodePath =
      firebaseRef.child("cafeMenu/admin/mainAdmin");
  await mainAdminEmailAndCodePath
      .set({"mainAdminEmail": mainAdminEmail, "adminCode": adminCode});
  print("after trying seet mainAdminEmail and  adminCode");
}

Future<AuthentiationType> getMainAdminEmailAndAdminCode() async {
  DatabaseReference firebaseRef = FirebaseDatabase.instance.ref();
  final mainAdminEmailAndCodePath =
      firebaseRef.child("cafeMenu/admin/mainAdmin");
  final getMainAdminEmailAndCodeSnapshot =
      await mainAdminEmailAndCodePath.get();
  final hasMainAdminEmail =
      getMainAdminEmailAndCodeSnapshot.hasChild("mainAdminEmail");
  final hasAdminCode = getMainAdminEmailAndCodeSnapshot.hasChild("adminCode");

  if (![hasMainAdminEmail, hasAdminCode].contains(false)) {
    final valuesByMap =
        getMainAdminEmailAndCodeSnapshot.value as Map<dynamic, dynamic>;
    PageAdminAuthorization.mainAdminEmail =
        valuesByMap["mainAdminEmail"] as String;
    PageAdminAuthorization.adminCode = valuesByMap["adminCode"] as String;
    print(
        "${PageAdminAuthorization.mainAdminEmail}, ${PageAdminAuthorization.adminCode}");
    return AuthentiationType.signInAdmin;
  } else {
    //
    print(
        "${PageAdminAuthorization.mainAdminEmail}, ${PageAdminAuthorization.adminCode}");
    return AuthentiationType.registerMainAdmin;
  }
}

  

  // final getMainAdminEmailAndCodeSnapshot =
  //     await mainAdminEmailAndCodePath.set({"mainAdminEmail":"asdfg@gmail.com","adminCode":"asdfgCode"});