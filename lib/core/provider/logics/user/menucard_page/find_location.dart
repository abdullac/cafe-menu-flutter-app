import 'dart:async';
import 'dart:developer';
import 'package:cafemenu_app/core/provider/logics/find_location_distence.dart';
import 'package:cafemenu_app/core/provider/logics/location_position.dart';
import 'package:cafemenu_app/core/provider/logics/location_settings.dart';
import 'package:cafemenu_app/utils/constants/values.dart';
import 'package:cafemenu_app/utils/functions/show_snackbar.dart';
import 'package:geolocator/geolocator.dart';

/// method for customer location Stream
Future<StreamSubscription<Position>?> positionStream({
  required void Function() blocProvider,
}) async {
  StreamSubscription<Position>? streamPosition;
  try {
    /// method determinePosition() for is urer granded Location permission
    if (await determinePosition() == true) {
      /// listen user location by stream
      streamPosition =
          Geolocator.getPositionStream(locationSettings: locationSettings())
              .listen((Position? position) {
        log(position == null
            ? 'Location: N/A'
            : 'Location: ${position.latitude.toString()}, ${position.longitude.toString()}');
        showSnackBar(position == null
            ? 'Location: N/A'
            : 'Location: ${position.latitude.toString()}, ${position.longitude.toString()}');
        /// assign position to userLocation
        userLocation = position;
        /// method for find user location destense.
        /// for, is user iside shop ?
        findlocationDistence();
        /// MenucardPageBloc for FindLocationByStream event
        blocProvider();
      });
    } else {
      showSnackBar("C'not get location");
    }
  } catch (e) {
    log("positionStream $e");
    showSnackBar("C'not get your location, please enable location servie");
  }
  return streamPosition;
}
