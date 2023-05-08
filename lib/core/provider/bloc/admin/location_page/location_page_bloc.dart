import 'package:bloc/bloc.dart';
import 'package:cafemenu_app/core/provider/logics/admin/location/get_location.dart';
import 'package:cafemenu_app/core/provider/logics/admin/location/save_location_to_firebase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';

part 'location_page_event.dart';
part 'location_page_state.dart';
part 'location_page_bloc.freezed.dart';

class LocationPageBloc extends Bloc<LocationPageEvent, LocationPageState> {
  LocationPageBloc() : super(LocationPageState.inintial()) {
    /// get currend location rebuild location text
    on<GetCurrentLocation>((event, emit) async {
      emit(state.copyWith(
        currentLocation: null,
        isLoading: true,
      ));
      Position? currentLocation = await getLocation();
      emit(state.copyWith(
        currentLocation: currentLocation,
        isLoading: false,
      ));
    });
    /// save location 
    on<SaveLocation>((event, emit) async {
      bool? hasLocationSaved = await saveLocationToFirebase(event.location);
      emit(state.copyWith(
        hasLocationSaved: hasLocationSaved,
      ));
    });
  }
}
