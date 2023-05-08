part of 'location_page_bloc.dart';

@freezed
class LocationPageState with _$LocationPageState {
  const factory LocationPageState({
    required Position? currentLocation,
    required bool isLoading,
    required bool? hasLocationSaved,
  }) = _LocationPageState;
  factory LocationPageState.inintial() {
    return const LocationPageState(
      currentLocation: null,
      isLoading: false,
      hasLocationSaved: null,
    );
  }
}
