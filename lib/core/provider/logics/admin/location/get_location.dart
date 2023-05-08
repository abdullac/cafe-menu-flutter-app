import 'dart:async';
import 'dart:developer';
import 'package:cafemenu_app/core/provider/logics/location_position.dart';
import 'package:cafemenu_app/utils/functions/show_snackbar.dart';
import 'package:geolocator/geolocator.dart';

/// get current location using geoLocator
Future<Position?> getLocation() async {
  Position? position;
  try {
    /// check permission location cranded
    bool isGrandedLocationPermission = await determinePosition();
    if(isGrandedLocationPermission == true){
      position = await Geolocator.getCurrentPosition();
    }
  } catch (e) {
     log("getLocation $e");
    showSnackBar(e);
  }
  return position;
}
