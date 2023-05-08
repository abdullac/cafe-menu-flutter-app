// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_page_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LocationPageEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCurrentLocation,
    required TResult Function(Position location) saveLocation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCurrentLocation,
    TResult? Function(Position location)? saveLocation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCurrentLocation,
    TResult Function(Position location)? saveLocation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetCurrentLocation value) getCurrentLocation,
    required TResult Function(SaveLocation value) saveLocation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetCurrentLocation value)? getCurrentLocation,
    TResult? Function(SaveLocation value)? saveLocation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetCurrentLocation value)? getCurrentLocation,
    TResult Function(SaveLocation value)? saveLocation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationPageEventCopyWith<$Res> {
  factory $LocationPageEventCopyWith(
          LocationPageEvent value, $Res Function(LocationPageEvent) then) =
      _$LocationPageEventCopyWithImpl<$Res, LocationPageEvent>;
}

/// @nodoc
class _$LocationPageEventCopyWithImpl<$Res, $Val extends LocationPageEvent>
    implements $LocationPageEventCopyWith<$Res> {
  _$LocationPageEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetCurrentLocationCopyWith<$Res> {
  factory _$$GetCurrentLocationCopyWith(_$GetCurrentLocation value,
          $Res Function(_$GetCurrentLocation) then) =
      __$$GetCurrentLocationCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetCurrentLocationCopyWithImpl<$Res>
    extends _$LocationPageEventCopyWithImpl<$Res, _$GetCurrentLocation>
    implements _$$GetCurrentLocationCopyWith<$Res> {
  __$$GetCurrentLocationCopyWithImpl(
      _$GetCurrentLocation _value, $Res Function(_$GetCurrentLocation) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetCurrentLocation implements GetCurrentLocation {
  const _$GetCurrentLocation();

  @override
  String toString() {
    return 'LocationPageEvent.getCurrentLocation()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetCurrentLocation);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCurrentLocation,
    required TResult Function(Position location) saveLocation,
  }) {
    return getCurrentLocation();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCurrentLocation,
    TResult? Function(Position location)? saveLocation,
  }) {
    return getCurrentLocation?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCurrentLocation,
    TResult Function(Position location)? saveLocation,
    required TResult orElse(),
  }) {
    if (getCurrentLocation != null) {
      return getCurrentLocation();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetCurrentLocation value) getCurrentLocation,
    required TResult Function(SaveLocation value) saveLocation,
  }) {
    return getCurrentLocation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetCurrentLocation value)? getCurrentLocation,
    TResult? Function(SaveLocation value)? saveLocation,
  }) {
    return getCurrentLocation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetCurrentLocation value)? getCurrentLocation,
    TResult Function(SaveLocation value)? saveLocation,
    required TResult orElse(),
  }) {
    if (getCurrentLocation != null) {
      return getCurrentLocation(this);
    }
    return orElse();
  }
}

abstract class GetCurrentLocation implements LocationPageEvent {
  const factory GetCurrentLocation() = _$GetCurrentLocation;
}

/// @nodoc
abstract class _$$SaveLocationCopyWith<$Res> {
  factory _$$SaveLocationCopyWith(
          _$SaveLocation value, $Res Function(_$SaveLocation) then) =
      __$$SaveLocationCopyWithImpl<$Res>;
  @useResult
  $Res call({Position location});
}

/// @nodoc
class __$$SaveLocationCopyWithImpl<$Res>
    extends _$LocationPageEventCopyWithImpl<$Res, _$SaveLocation>
    implements _$$SaveLocationCopyWith<$Res> {
  __$$SaveLocationCopyWithImpl(
      _$SaveLocation _value, $Res Function(_$SaveLocation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = null,
  }) {
    return _then(_$SaveLocation(
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Position,
    ));
  }
}

/// @nodoc

class _$SaveLocation implements SaveLocation {
  const _$SaveLocation({required this.location});

  @override
  final Position location;

  @override
  String toString() {
    return 'LocationPageEvent.saveLocation(location: $location)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveLocation &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @override
  int get hashCode => Object.hash(runtimeType, location);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveLocationCopyWith<_$SaveLocation> get copyWith =>
      __$$SaveLocationCopyWithImpl<_$SaveLocation>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCurrentLocation,
    required TResult Function(Position location) saveLocation,
  }) {
    return saveLocation(location);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCurrentLocation,
    TResult? Function(Position location)? saveLocation,
  }) {
    return saveLocation?.call(location);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCurrentLocation,
    TResult Function(Position location)? saveLocation,
    required TResult orElse(),
  }) {
    if (saveLocation != null) {
      return saveLocation(location);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetCurrentLocation value) getCurrentLocation,
    required TResult Function(SaveLocation value) saveLocation,
  }) {
    return saveLocation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetCurrentLocation value)? getCurrentLocation,
    TResult? Function(SaveLocation value)? saveLocation,
  }) {
    return saveLocation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetCurrentLocation value)? getCurrentLocation,
    TResult Function(SaveLocation value)? saveLocation,
    required TResult orElse(),
  }) {
    if (saveLocation != null) {
      return saveLocation(this);
    }
    return orElse();
  }
}

abstract class SaveLocation implements LocationPageEvent {
  const factory SaveLocation({required final Position location}) =
      _$SaveLocation;

  Position get location;
  @JsonKey(ignore: true)
  _$$SaveLocationCopyWith<_$SaveLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LocationPageState {
  Position? get currentLocation => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool? get hasLocationSaved => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LocationPageStateCopyWith<LocationPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationPageStateCopyWith<$Res> {
  factory $LocationPageStateCopyWith(
          LocationPageState value, $Res Function(LocationPageState) then) =
      _$LocationPageStateCopyWithImpl<$Res, LocationPageState>;
  @useResult
  $Res call(
      {Position? currentLocation, bool isLoading, bool? hasLocationSaved});
}

/// @nodoc
class _$LocationPageStateCopyWithImpl<$Res, $Val extends LocationPageState>
    implements $LocationPageStateCopyWith<$Res> {
  _$LocationPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentLocation = freezed,
    Object? isLoading = null,
    Object? hasLocationSaved = freezed,
  }) {
    return _then(_value.copyWith(
      currentLocation: freezed == currentLocation
          ? _value.currentLocation
          : currentLocation // ignore: cast_nullable_to_non_nullable
              as Position?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasLocationSaved: freezed == hasLocationSaved
          ? _value.hasLocationSaved
          : hasLocationSaved // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LocationPageStateCopyWith<$Res>
    implements $LocationPageStateCopyWith<$Res> {
  factory _$$_LocationPageStateCopyWith(_$_LocationPageState value,
          $Res Function(_$_LocationPageState) then) =
      __$$_LocationPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Position? currentLocation, bool isLoading, bool? hasLocationSaved});
}

/// @nodoc
class __$$_LocationPageStateCopyWithImpl<$Res>
    extends _$LocationPageStateCopyWithImpl<$Res, _$_LocationPageState>
    implements _$$_LocationPageStateCopyWith<$Res> {
  __$$_LocationPageStateCopyWithImpl(
      _$_LocationPageState _value, $Res Function(_$_LocationPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentLocation = freezed,
    Object? isLoading = null,
    Object? hasLocationSaved = freezed,
  }) {
    return _then(_$_LocationPageState(
      currentLocation: freezed == currentLocation
          ? _value.currentLocation
          : currentLocation // ignore: cast_nullable_to_non_nullable
              as Position?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasLocationSaved: freezed == hasLocationSaved
          ? _value.hasLocationSaved
          : hasLocationSaved // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$_LocationPageState implements _LocationPageState {
  const _$_LocationPageState(
      {required this.currentLocation,
      required this.isLoading,
      required this.hasLocationSaved});

  @override
  final Position? currentLocation;
  @override
  final bool isLoading;
  @override
  final bool? hasLocationSaved;

  @override
  String toString() {
    return 'LocationPageState(currentLocation: $currentLocation, isLoading: $isLoading, hasLocationSaved: $hasLocationSaved)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LocationPageState &&
            (identical(other.currentLocation, currentLocation) ||
                other.currentLocation == currentLocation) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasLocationSaved, hasLocationSaved) ||
                other.hasLocationSaved == hasLocationSaved));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, currentLocation, isLoading, hasLocationSaved);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LocationPageStateCopyWith<_$_LocationPageState> get copyWith =>
      __$$_LocationPageStateCopyWithImpl<_$_LocationPageState>(
          this, _$identity);
}

abstract class _LocationPageState implements LocationPageState {
  const factory _LocationPageState(
      {required final Position? currentLocation,
      required final bool isLoading,
      required final bool? hasLocationSaved}) = _$_LocationPageState;

  @override
  Position? get currentLocation;
  @override
  bool get isLoading;
  @override
  bool? get hasLocationSaved;
  @override
  @JsonKey(ignore: true)
  _$$_LocationPageStateCopyWith<_$_LocationPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
