part of 'location_page_bloc.dart';

@freezed
class LocationPageEvent with _$LocationPageEvent {
  const factory LocationPageEvent.getCurrentLocation() = GetCurrentLocation;
  const factory LocationPageEvent.saveLocation({
    required Position location,
  }) = SaveLocation;
}