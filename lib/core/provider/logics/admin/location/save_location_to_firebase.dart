import 'dart:convert';
import 'dart:developer';
import 'package:cafemenu_app/core/services/firebase/firebase_refs.dart';
import 'package:cafemenu_app/utils/functions/show_snackbar.dart';
import 'package:geolocator/geolocator.dart';

/// method for save shop location to firebase
Future<bool?> saveLocationToFirebase(Position location) async {
  bool? hasLocationSave;
  try {
    /// convert Position(location) to Object(json) and 
    /// save location to firebase location child path 
    await FirebaseRefs.location().set(jsonDecode(jsonEncode(location)));
    showSnackBar("Location saved");
    hasLocationSave = true;
  } catch (e) {
    log("saveLocationToFirebase $e");
    showSnackBar("C'not save location");
    hasLocationSave = false;
  }
  return hasLocationSave;
}
