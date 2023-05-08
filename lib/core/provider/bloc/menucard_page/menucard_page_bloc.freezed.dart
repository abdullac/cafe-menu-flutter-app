// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menucard_page_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MenucardPageEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            UserScrollNotification notification, int categoryIndex)
        userScrolledPageview,
    required TResult Function(bool isLocationLoading) findLocationByStream,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserScrollNotification notification, int categoryIndex)?
        userScrolledPageview,
    TResult? Function(bool isLocationLoading)? findLocationByStream,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserScrollNotification notification, int categoryIndex)?
        userScrolledPageview,
    TResult Function(bool isLocationLoading)? findLocationByStream,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserScrolledPageview value) userScrolledPageview,
    required TResult Function(FindLocationByStream value) findLocationByStream,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserScrolledPageview value)? userScrolledPageview,
    TResult? Function(FindLocationByStream value)? findLocationByStream,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserScrolledPageview value)? userScrolledPageview,
    TResult Function(FindLocationByStream value)? findLocationByStream,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenucardPageEventCopyWith<$Res> {
  factory $MenucardPageEventCopyWith(
          MenucardPageEvent value, $Res Function(MenucardPageEvent) then) =
      _$MenucardPageEventCopyWithImpl<$Res, MenucardPageEvent>;
}

/// @nodoc
class _$MenucardPageEventCopyWithImpl<$Res, $Val extends MenucardPageEvent>
    implements $MenucardPageEventCopyWith<$Res> {
  _$MenucardPageEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UserScrolledPageviewCopyWith<$Res> {
  factory _$$UserScrolledPageviewCopyWith(_$UserScrolledPageview value,
          $Res Function(_$UserScrolledPageview) then) =
      __$$UserScrolledPageviewCopyWithImpl<$Res>;
  @useResult
  $Res call({UserScrollNotification notification, int categoryIndex});
}

/// @nodoc
class __$$UserScrolledPageviewCopyWithImpl<$Res>
    extends _$MenucardPageEventCopyWithImpl<$Res, _$UserScrolledPageview>
    implements _$$UserScrolledPageviewCopyWith<$Res> {
  __$$UserScrolledPageviewCopyWithImpl(_$UserScrolledPageview _value,
      $Res Function(_$UserScrolledPageview) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notification = null,
    Object? categoryIndex = null,
  }) {
    return _then(_$UserScrolledPageview(
      notification: null == notification
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as UserScrollNotification,
      categoryIndex: null == categoryIndex
          ? _value.categoryIndex
          : categoryIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$UserScrolledPageview implements UserScrolledPageview {
  const _$UserScrolledPageview(
      {required this.notification, required this.categoryIndex});

  @override
  final UserScrollNotification notification;
  @override
  final int categoryIndex;

  @override
  String toString() {
    return 'MenucardPageEvent.userScrolledPageview(notification: $notification, categoryIndex: $categoryIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserScrolledPageview &&
            (identical(other.notification, notification) ||
                other.notification == notification) &&
            (identical(other.categoryIndex, categoryIndex) ||
                other.categoryIndex == categoryIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, notification, categoryIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserScrolledPageviewCopyWith<_$UserScrolledPageview> get copyWith =>
      __$$UserScrolledPageviewCopyWithImpl<_$UserScrolledPageview>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            UserScrollNotification notification, int categoryIndex)
        userScrolledPageview,
    required TResult Function(bool isLocationLoading) findLocationByStream,
  }) {
    return userScrolledPageview(notification, categoryIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserScrollNotification notification, int categoryIndex)?
        userScrolledPageview,
    TResult? Function(bool isLocationLoading)? findLocationByStream,
  }) {
    return userScrolledPageview?.call(notification, categoryIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserScrollNotification notification, int categoryIndex)?
        userScrolledPageview,
    TResult Function(bool isLocationLoading)? findLocationByStream,
    required TResult orElse(),
  }) {
    if (userScrolledPageview != null) {
      return userScrolledPageview(notification, categoryIndex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserScrolledPageview value) userScrolledPageview,
    required TResult Function(FindLocationByStream value) findLocationByStream,
  }) {
    return userScrolledPageview(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserScrolledPageview value)? userScrolledPageview,
    TResult? Function(FindLocationByStream value)? findLocationByStream,
  }) {
    return userScrolledPageview?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserScrolledPageview value)? userScrolledPageview,
    TResult Function(FindLocationByStream value)? findLocationByStream,
    required TResult orElse(),
  }) {
    if (userScrolledPageview != null) {
      return userScrolledPageview(this);
    }
    return orElse();
  }
}

abstract class UserScrolledPageview implements MenucardPageEvent {
  const factory UserScrolledPageview(
      {required final UserScrollNotification notification,
      required final int categoryIndex}) = _$UserScrolledPageview;

  UserScrollNotification get notification;
  int get categoryIndex;
  @JsonKey(ignore: true)
  _$$UserScrolledPageviewCopyWith<_$UserScrolledPageview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FindLocationByStreamCopyWith<$Res> {
  factory _$$FindLocationByStreamCopyWith(_$FindLocationByStream value,
          $Res Function(_$FindLocationByStream) then) =
      __$$FindLocationByStreamCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isLocationLoading});
}

/// @nodoc
class __$$FindLocationByStreamCopyWithImpl<$Res>
    extends _$MenucardPageEventCopyWithImpl<$Res, _$FindLocationByStream>
    implements _$$FindLocationByStreamCopyWith<$Res> {
  __$$FindLocationByStreamCopyWithImpl(_$FindLocationByStream _value,
      $Res Function(_$FindLocationByStream) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLocationLoading = null,
  }) {
    return _then(_$FindLocationByStream(
      isLocationLoading: null == isLocationLoading
          ? _value.isLocationLoading
          : isLocationLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$FindLocationByStream implements FindLocationByStream {
  const _$FindLocationByStream({required this.isLocationLoading});

  @override
  final bool isLocationLoading;

  @override
  String toString() {
    return 'MenucardPageEvent.findLocationByStream(isLocationLoading: $isLocationLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FindLocationByStream &&
            (identical(other.isLocationLoading, isLocationLoading) ||
                other.isLocationLoading == isLocationLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLocationLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FindLocationByStreamCopyWith<_$FindLocationByStream> get copyWith =>
      __$$FindLocationByStreamCopyWithImpl<_$FindLocationByStream>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            UserScrollNotification notification, int categoryIndex)
        userScrolledPageview,
    required TResult Function(bool isLocationLoading) findLocationByStream,
  }) {
    return findLocationByStream(isLocationLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserScrollNotification notification, int categoryIndex)?
        userScrolledPageview,
    TResult? Function(bool isLocationLoading)? findLocationByStream,
  }) {
    return findLocationByStream?.call(isLocationLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserScrollNotification notification, int categoryIndex)?
        userScrolledPageview,
    TResult Function(bool isLocationLoading)? findLocationByStream,
    required TResult orElse(),
  }) {
    if (findLocationByStream != null) {
      return findLocationByStream(isLocationLoading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserScrolledPageview value) userScrolledPageview,
    required TResult Function(FindLocationByStream value) findLocationByStream,
  }) {
    return findLocationByStream(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserScrolledPageview value)? userScrolledPageview,
    TResult? Function(FindLocationByStream value)? findLocationByStream,
  }) {
    return findLocationByStream?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserScrolledPageview value)? userScrolledPageview,
    TResult Function(FindLocationByStream value)? findLocationByStream,
    required TResult orElse(),
  }) {
    if (findLocationByStream != null) {
      return findLocationByStream(this);
    }
    return orElse();
  }
}

abstract class FindLocationByStream implements MenucardPageEvent {
  const factory FindLocationByStream({required final bool isLocationLoading}) =
      _$FindLocationByStream;

  bool get isLocationLoading;
  @JsonKey(ignore: true)
  _$$FindLocationByStreamCopyWith<_$FindLocationByStream> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MenucardPageState {
  bool get showLeftArrow => throw _privateConstructorUsedError;
  bool get showRightArrow => throw _privateConstructorUsedError;
  int? get categoryIndex => throw _privateConstructorUsedError;
  bool? get isInsideLocation => throw _privateConstructorUsedError;
  bool get isLocationLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MenucardPageStateCopyWith<MenucardPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenucardPageStateCopyWith<$Res> {
  factory $MenucardPageStateCopyWith(
          MenucardPageState value, $Res Function(MenucardPageState) then) =
      _$MenucardPageStateCopyWithImpl<$Res, MenucardPageState>;
  @useResult
  $Res call(
      {bool showLeftArrow,
      bool showRightArrow,
      int? categoryIndex,
      bool? isInsideLocation,
      bool isLocationLoading});
}

/// @nodoc
class _$MenucardPageStateCopyWithImpl<$Res, $Val extends MenucardPageState>
    implements $MenucardPageStateCopyWith<$Res> {
  _$MenucardPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showLeftArrow = null,
    Object? showRightArrow = null,
    Object? categoryIndex = freezed,
    Object? isInsideLocation = freezed,
    Object? isLocationLoading = null,
  }) {
    return _then(_value.copyWith(
      showLeftArrow: null == showLeftArrow
          ? _value.showLeftArrow
          : showLeftArrow // ignore: cast_nullable_to_non_nullable
              as bool,
      showRightArrow: null == showRightArrow
          ? _value.showRightArrow
          : showRightArrow // ignore: cast_nullable_to_non_nullable
              as bool,
      categoryIndex: freezed == categoryIndex
          ? _value.categoryIndex
          : categoryIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      isInsideLocation: freezed == isInsideLocation
          ? _value.isInsideLocation
          : isInsideLocation // ignore: cast_nullable_to_non_nullable
              as bool?,
      isLocationLoading: null == isLocationLoading
          ? _value.isLocationLoading
          : isLocationLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MenucardPageStateCopyWith<$Res>
    implements $MenucardPageStateCopyWith<$Res> {
  factory _$$_MenucardPageStateCopyWith(_$_MenucardPageState value,
          $Res Function(_$_MenucardPageState) then) =
      __$$_MenucardPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool showLeftArrow,
      bool showRightArrow,
      int? categoryIndex,
      bool? isInsideLocation,
      bool isLocationLoading});
}

/// @nodoc
class __$$_MenucardPageStateCopyWithImpl<$Res>
    extends _$MenucardPageStateCopyWithImpl<$Res, _$_MenucardPageState>
    implements _$$_MenucardPageStateCopyWith<$Res> {
  __$$_MenucardPageStateCopyWithImpl(
      _$_MenucardPageState _value, $Res Function(_$_MenucardPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showLeftArrow = null,
    Object? showRightArrow = null,
    Object? categoryIndex = freezed,
    Object? isInsideLocation = freezed,
    Object? isLocationLoading = null,
  }) {
    return _then(_$_MenucardPageState(
      showLeftArrow: null == showLeftArrow
          ? _value.showLeftArrow
          : showLeftArrow // ignore: cast_nullable_to_non_nullable
              as bool,
      showRightArrow: null == showRightArrow
          ? _value.showRightArrow
          : showRightArrow // ignore: cast_nullable_to_non_nullable
              as bool,
      categoryIndex: freezed == categoryIndex
          ? _value.categoryIndex
          : categoryIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      isInsideLocation: freezed == isInsideLocation
          ? _value.isInsideLocation
          : isInsideLocation // ignore: cast_nullable_to_non_nullable
              as bool?,
      isLocationLoading: null == isLocationLoading
          ? _value.isLocationLoading
          : isLocationLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_MenucardPageState implements _MenucardPageState {
  const _$_MenucardPageState(
      {required this.showLeftArrow,
      required this.showRightArrow,
      required this.categoryIndex,
      required this.isInsideLocation,
      required this.isLocationLoading});

  @override
  final bool showLeftArrow;
  @override
  final bool showRightArrow;
  @override
  final int? categoryIndex;
  @override
  final bool? isInsideLocation;
  @override
  final bool isLocationLoading;

  @override
  String toString() {
    return 'MenucardPageState(showLeftArrow: $showLeftArrow, showRightArrow: $showRightArrow, categoryIndex: $categoryIndex, isInsideLocation: $isInsideLocation, isLocationLoading: $isLocationLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MenucardPageState &&
            (identical(other.showLeftArrow, showLeftArrow) ||
                other.showLeftArrow == showLeftArrow) &&
            (identical(other.showRightArrow, showRightArrow) ||
                other.showRightArrow == showRightArrow) &&
            (identical(other.categoryIndex, categoryIndex) ||
                other.categoryIndex == categoryIndex) &&
            (identical(other.isInsideLocation, isInsideLocation) ||
                other.isInsideLocation == isInsideLocation) &&
            (identical(other.isLocationLoading, isLocationLoading) ||
                other.isLocationLoading == isLocationLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, showLeftArrow, showRightArrow,
      categoryIndex, isInsideLocation, isLocationLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MenucardPageStateCopyWith<_$_MenucardPageState> get copyWith =>
      __$$_MenucardPageStateCopyWithImpl<_$_MenucardPageState>(
          this, _$identity);
}

abstract class _MenucardPageState implements MenucardPageState {
  const factory _MenucardPageState(
      {required final bool showLeftArrow,
      required final bool showRightArrow,
      required final int? categoryIndex,
      required final bool? isInsideLocation,
      required final bool isLocationLoading}) = _$_MenucardPageState;

  @override
  bool get showLeftArrow;
  @override
  bool get showRightArrow;
  @override
  int? get categoryIndex;
  @override
  bool? get isInsideLocation;
  @override
  bool get isLocationLoading;
  @override
  @JsonKey(ignore: true)
  _$$_MenucardPageStateCopyWith<_$_MenucardPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
