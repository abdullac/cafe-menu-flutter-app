import 'dart:convert';
import 'dart:developer';

import 'package:cafemenu_app/core/services/firebase/firebase_refs.dart';
import 'package:cafemenu_app/utils/functions/show_snackbar.dart';

Future<bool?> saveDistenceLocation(double? distenceMeter) async {
  bool? hasSavedDestence;
  try{
  await FirebaseRefs.distenceLocation().set(jsonDecode(jsonEncode(distenceMeter)));
    showSnackBar("Distence Saved");
    hasSavedDestence = true; 
  }catch (e){
    log("saveDistenceLocation $e");
    showSnackBar("C'not Save distence");
  }
  return hasSavedDestence;
}
