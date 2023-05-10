import 'dart:convert';
import 'dart:developer';

import 'package:cafemenu_app/core/services/firebase/firebase_refs.dart';
import 'package:cafemenu_app/utils/constants/values.dart';
import 'package:cafemenu_app/utils/functions/show_snackbar.dart';
import 'package:firebase_database/firebase_database.dart';

Future getUserDistenceCondition() async {
  try {
    DataSnapshot distenceConditionSnapShot =
        await FirebaseRefs.distenceLocation().get();

    /// snapshot convert to json
    final distenceConditionJson =
        jsonDecode(jsonEncode(distenceConditionSnapShot.value));
    userDistenceCondition = double.parse(distenceConditionJson.toString());
  } catch (e) {
    log("getUserDistenceCondition $e");
    showSnackBar("Cannot get distence condition");
  }
}
