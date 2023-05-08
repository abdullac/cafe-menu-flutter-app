import 'dart:convert';
import 'dart:developer';
import 'package:cafemenu_app/core/services/firebase/firebase_refs.dart';
import 'package:cafemenu_app/utils/constants/values.dart';
import 'package:cafemenu_app/utils/functions/show_snackbar.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:geolocator/geolocator.dart';

/// get shop location from firebase by user
getShopLocation() async {
  try {
    /// firebase location child path and snapshot 
    DataSnapshot locationSnapShot = await FirebaseRefs.location().get();
    /// snapshot convert to json
    final shopLocationJson = jsonDecode(jsonEncode(locationSnapShot.value));
    /// json manually convert to Position 
    /// and assign to shopLocationByUser
    shopLocationByUser = Position(
      longitude: double.parse(shopLocationJson["longitude"].toString()),
      latitude: double.parse(shopLocationJson["latitude"].toString()),
      timestamp: DateTime.tryParse(shopLocationJson["timestamp"].toString()),
      accuracy: double.parse(shopLocationJson["accuracy"].toString()),
      altitude: double.parse(shopLocationJson["altitude"].toString()),
      heading: double.parse(shopLocationJson["heading"].toString()),
      speedAccuracy:
          double.parse(shopLocationJson["speed_accuracy"].toString()),
      speed: double.parse(shopLocationJson["speed"].toString()),
      isMocked: shopLocationJson["is_mocked"] as bool,
    );
  } catch (e) {
    log("getShopLocation $e");
    showSnackBar("C'not get shop location");
  }
}
