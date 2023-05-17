import 'package:cafemenu_app/utils/constants/values.dart';
import 'package:cafemenu_app/utils/functions/show_snackbar.dart';
import 'package:geolocator/geolocator.dart';

/// method for find user location distence from shop location
findlocationDistence() {
  if (shopLocationByUser != null && userLocation != null) {
    locationDistence = Geolocator.distanceBetween(
      shopLocationByUser!.latitude,
      shopLocationByUser!.longitude,
      userLocation!.latitude,
      userLocation!.longitude,
    );
    showSnackBar(locationDistence != null
        ? "${locationDistence!.round()} meter distence from shop"
        : "Cannot get location distence");
  }
}

