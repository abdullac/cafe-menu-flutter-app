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
  int get categoryIndex => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool reachToStart, int categoryIndex)
        leftScrollIndicator,
    required TResult Function(bool reachToEnd, int categoryIndex)
        rightScrollIndicator,
    required TResult Function(
            UserScrollNotification notification, int categoryIndex)
        userScrolledPageview,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool reachToStart, int categoryIndex)?
        leftScrollIndicator,
    TResult? Function(bool reachToEnd, int categoryIndex)? rightScrollIndicator,
    TResult? Function(UserScrollNotification notification, int categoryIndex)?
        userScrolledPageview,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool reachToStart, int categoryIndex)? leftScrollIndicator,
    TResult Function(bool reachToEnd, int categoryIndex)? rightScrollIndicator,
    TResult Function(UserScrollNotification notification, int categoryIndex)?
        userScrolledPageview,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LeftScrollIndicator value) leftScrollIndicator,
    required TResult Function(RightScrollIndicator value) rightScrollIndicator,
    required TResult Function(UserScrolledPageview value) userScrolledPageview,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LeftScrollIndicator value)? leftScrollIndicator,
    TResult? Function(RightScrollIndicator value)? rightScrollIndicator,
    TResult? Function(UserScrolledPageview value)? userScrolledPageview,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LeftScrollIndicator value)? leftScrollIndicator,
    TResult Function(RightScrollIndicator value)? rightScrollIndicator,
    TResult Function(UserScrolledPageview value)? userScrolledPageview,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MenucardPageEventCopyWith<MenucardPageEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenucardPageEventCopyWith<$Res> {
  factory $MenucardPageEventCopyWith(
          MenucardPageEvent value, $Res Function(MenucardPageEvent) then) =
      _$MenucardPageEventCopyWithImpl<$Res, MenucardPageEvent>;
  @useResult
  $Res call({int categoryIndex});
}

/// @nodoc
class _$MenucardPageEventCopyWithImpl<$Res, $Val extends MenucardPageEvent>
    implements $MenucardPageEventCopyWith<$Res> {
  _$MenucardPageEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryIndex = null,
  }) {
    return _then(_value.copyWith(
      categoryIndex: null == categoryIndex
          ? _value.categoryIndex
          : categoryIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeftScrollIndicatorCopyWith<$Res>
    implements $MenucardPageEventCopyWith<$Res> {
  factory _$$LeftScrollIndicatorCopyWith(_$LeftScrollIndicator value,
          $Res Function(_$LeftScrollIndicator) then) =
      __$$LeftScrollIndicatorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool reachToStart, int categoryIndex});
}

/// @nodoc
class __$$LeftScrollIndicatorCopyWithImpl<$Res>
    extends _$MenucardPageEventCopyWithImpl<$Res, _$LeftScrollIndicator>
    implements _$$LeftScrollIndicatorCopyWith<$Res> {
  __$$LeftScrollIndicatorCopyWithImpl(
      _$LeftScrollIndicator _value, $Res Function(_$LeftScrollIndicator) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reachToStart = null,
    Object? categoryIndex = null,
  }) {
    return _then(_$LeftScrollIndicator(
      reachToStart: null == reachToStart
          ? _value.reachToStart
          : reachToStart // ignore: cast_nullable_to_non_nullable
              as bool,
      categoryIndex: null == categoryIndex
          ? _value.categoryIndex
          : categoryIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LeftScrollIndicator implements LeftScrollIndicator {
  const _$LeftScrollIndicator(
      {required this.reachToStart, required this.categoryIndex});

  @override
  final bool reachToStart;
  @override
  final int categoryIndex;

  @override
  String toString() {
    return 'MenucardPageEvent.leftScrollIndicator(reachToStart: $reachToStart, categoryIndex: $categoryIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeftScrollIndicator &&
            (identical(other.reachToStart, reachToStart) ||
                other.reachToStart == reachToStart) &&
            (identical(other.categoryIndex, categoryIndex) ||
                other.categoryIndex == categoryIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reachToStart, categoryIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeftScrollIndicatorCopyWith<_$LeftScrollIndicator> get copyWith =>
      __$$LeftScrollIndicatorCopyWithImpl<_$LeftScrollIndicator>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool reachToStart, int categoryIndex)
        leftScrollIndicator,
    required TResult Function(bool reachToEnd, int categoryIndex)
        rightScrollIndicator,
    required TResult Function(
            UserScrollNotification notification, int categoryIndex)
        userScrolledPageview,
  }) {
    return leftScrollIndicator(reachToStart, categoryIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool reachToStart, int categoryIndex)?
        leftScrollIndicator,
    TResult? Function(bool reachToEnd, int categoryIndex)? rightScrollIndicator,
    TResult? Function(UserScrollNotification notification, int categoryIndex)?
        userScrolledPageview,
  }) {
    return leftScrollIndicator?.call(reachToStart, categoryIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool reachToStart, int categoryIndex)? leftScrollIndicator,
    TResult Function(bool reachToEnd, int categoryIndex)? rightScrollIndicator,
    TResult Function(UserScrollNotification notification, int categoryIndex)?
        userScrolledPageview,
    required TResult orElse(),
  }) {
    if (leftScrollIndicator != null) {
      return leftScrollIndicator(reachToStart, categoryIndex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LeftScrollIndicator value) leftScrollIndicator,
    required TResult Function(RightScrollIndicator value) rightScrollIndicator,
    required TResult Function(UserScrolledPageview value) userScrolledPageview,
  }) {
    return leftScrollIndicator(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LeftScrollIndicator value)? leftScrollIndicator,
    TResult? Function(RightScrollIndicator value)? rightScrollIndicator,
    TResult? Function(UserScrolledPageview value)? userScrolledPageview,
  }) {
    return leftScrollIndicator?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LeftScrollIndicator value)? leftScrollIndicator,
    TResult Function(RightScrollIndicator value)? rightScrollIndicator,
    TResult Function(UserScrolledPageview value)? userScrolledPageview,
    required TResult orElse(),
  }) {
    if (leftScrollIndicator != null) {
      return leftScrollIndicator(this);
    }
    return orElse();
  }
}

abstract class LeftScrollIndicator implements MenucardPageEvent {
  const factory LeftScrollIndicator(
      {required final bool reachToStart,
      required final int categoryIndex}) = _$LeftScrollIndicator;

  bool get reachToStart;
  @override
  int get categoryIndex;
  @override
  @JsonKey(ignore: true)
  _$$LeftScrollIndicatorCopyWith<_$LeftScrollIndicator> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RightScrollIndicatorCopyWith<$Res>
    implements $MenucardPageEventCopyWith<$Res> {
  factory _$$RightScrollIndicatorCopyWith(_$RightScrollIndicator value,
          $Res Function(_$RightScrollIndicator) then) =
      __$$RightScrollIndicatorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool reachToEnd, int categoryIndex});
}

/// @nodoc
class __$$RightScrollIndicatorCopyWithImpl<$Res>
    extends _$MenucardPageEventCopyWithImpl<$Res, _$RightScrollIndicator>
    implements _$$RightScrollIndicatorCopyWith<$Res> {
  __$$RightScrollIndicatorCopyWithImpl(_$RightScrollIndicator _value,
      $Res Function(_$RightScrollIndicator) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reachToEnd = null,
    Object? categoryIndex = null,
  }) {
    return _then(_$RightScrollIndicator(
      reachToEnd: null == reachToEnd
          ? _value.reachToEnd
          : reachToEnd // ignore: cast_nullable_to_non_nullable
              as bool,
      categoryIndex: null == categoryIndex
          ? _value.categoryIndex
          : categoryIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RightScrollIndicator implements RightScrollIndicator {
  const _$RightScrollIndicator(
      {required this.reachToEnd, required this.categoryIndex});

  @override
  final bool reachToEnd;
  @override
  final int categoryIndex;

  @override
  String toString() {
    return 'MenucardPageEvent.rightScrollIndicator(reachToEnd: $reachToEnd, categoryIndex: $categoryIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RightScrollIndicator &&
            (identical(other.reachToEnd, reachToEnd) ||
                other.reachToEnd == reachToEnd) &&
            (identical(other.categoryIndex, categoryIndex) ||
                other.categoryIndex == categoryIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reachToEnd, categoryIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RightScrollIndicatorCopyWith<_$RightScrollIndicator> get copyWith =>
      __$$RightScrollIndicatorCopyWithImpl<_$RightScrollIndicator>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool reachToStart, int categoryIndex)
        leftScrollIndicator,
    required TResult Function(bool reachToEnd, int categoryIndex)
        rightScrollIndicator,
    required TResult Function(
            UserScrollNotification notification, int categoryIndex)
        userScrolledPageview,
  }) {
    return rightScrollIndicator(reachToEnd, categoryIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool reachToStart, int categoryIndex)?
        leftScrollIndicator,
    TResult? Function(bool reachToEnd, int categoryIndex)? rightScrollIndicator,
    TResult? Function(UserScrollNotification notification, int categoryIndex)?
        userScrolledPageview,
  }) {
    return rightScrollIndicator?.call(reachToEnd, categoryIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool reachToStart, int categoryIndex)? leftScrollIndicator,
    TResult Function(bool reachToEnd, int categoryIndex)? rightScrollIndicator,
    TResult Function(UserScrollNotification notification, int categoryIndex)?
        userScrolledPageview,
    required TResult orElse(),
  }) {
    if (rightScrollIndicator != null) {
      return rightScrollIndicator(reachToEnd, categoryIndex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LeftScrollIndicator value) leftScrollIndicator,
    required TResult Function(RightScrollIndicator value) rightScrollIndicator,
    required TResult Function(UserScrolledPageview value) userScrolledPageview,
  }) {
    return rightScrollIndicator(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LeftScrollIndicator value)? leftScrollIndicator,
    TResult? Function(RightScrollIndicator value)? rightScrollIndicator,
    TResult? Function(UserScrolledPageview value)? userScrolledPageview,
  }) {
    return rightScrollIndicator?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LeftScrollIndicator value)? leftScrollIndicator,
    TResult Function(RightScrollIndicator value)? rightScrollIndicator,
    TResult Function(UserScrolledPageview value)? userScrolledPageview,
    required TResult orElse(),
  }) {
    if (rightScrollIndicator != null) {
      return rightScrollIndicator(this);
    }
    return orElse();
  }
}

abstract class RightScrollIndicator implements MenucardPageEvent {
  const factory RightScrollIndicator(
      {required final bool reachToEnd,
      required final int categoryIndex}) = _$RightScrollIndicator;

  bool get reachToEnd;
  @override
  int get categoryIndex;
  @override
  @JsonKey(ignore: true)
  _$$RightScrollIndicatorCopyWith<_$RightScrollIndicator> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserScrolledPageviewCopyWith<$Res>
    implements $MenucardPageEventCopyWith<$Res> {
  factory _$$UserScrolledPageviewCopyWith(_$UserScrolledPageview value,
          $Res Function(_$UserScrolledPageview) then) =
      __$$UserScrolledPageviewCopyWithImpl<$Res>;
  @override
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
    required TResult Function(bool reachToStart, int categoryIndex)
        leftScrollIndicator,
    required TResult Function(bool reachToEnd, int categoryIndex)
        rightScrollIndicator,
    required TResult Function(
            UserScrollNotification notification, int categoryIndex)
        userScrolledPageview,
  }) {
    return userScrolledPageview(notification, categoryIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool reachToStart, int categoryIndex)?
        leftScrollIndicator,
    TResult? Function(bool reachToEnd, int categoryIndex)? rightScrollIndicator,
    TResult? Function(UserScrollNotification notification, int categoryIndex)?
        userScrolledPageview,
  }) {
    return userScrolledPageview?.call(notification, categoryIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool reachToStart, int categoryIndex)? leftScrollIndicator,
    TResult Function(bool reachToEnd, int categoryIndex)? rightScrollIndicator,
    TResult Function(UserScrollNotification notification, int categoryIndex)?
        userScrolledPageview,
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
    required TResult Function(LeftScrollIndicator value) leftScrollIndicator,
    required TResult Function(RightScrollIndicator value) rightScrollIndicator,
    required TResult Function(UserScrolledPageview value) userScrolledPageview,
  }) {
    return userScrolledPageview(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LeftScrollIndicator value)? leftScrollIndicator,
    TResult? Function(RightScrollIndicator value)? rightScrollIndicator,
    TResult? Function(UserScrolledPageview value)? userScrolledPageview,
  }) {
    return userScrolledPageview?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LeftScrollIndicator value)? leftScrollIndicator,
    TResult Function(RightScrollIndicator value)? rightScrollIndicator,
    TResult Function(UserScrolledPageview value)? userScrolledPageview,
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
  @override
  int get categoryIndex;
  @override
  @JsonKey(ignore: true)
  _$$UserScrolledPageviewCopyWith<_$UserScrolledPageview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MenucardPageState {
  bool get showLeftArrow => throw _privateConstructorUsedError;
  bool get showRightArrow => throw _privateConstructorUsedError;
  int? get categoryIndex => throw _privateConstructorUsedError;

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
  $Res call({bool showLeftArrow, bool showRightArrow, int? categoryIndex});
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
  $Res call({bool showLeftArrow, bool showRightArrow, int? categoryIndex});
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
    ));
  }
}

/// @nodoc

class _$_MenucardPageState implements _MenucardPageState {
  const _$_MenucardPageState(
      {required this.showLeftArrow,
      required this.showRightArrow,
      required this.categoryIndex});

  @override
  final bool showLeftArrow;
  @override
  final bool showRightArrow;
  @override
  final int? categoryIndex;

  @override
  String toString() {
    return 'MenucardPageState(showLeftArrow: $showLeftArrow, showRightArrow: $showRightArrow, categoryIndex: $categoryIndex)';
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
                other.categoryIndex == categoryIndex));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, showLeftArrow, showRightArrow, categoryIndex);

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
      required final int? categoryIndex}) = _$_MenucardPageState;

  @override
  bool get showLeftArrow;
  @override
  bool get showRightArrow;
  @override
  int? get categoryIndex;
  @override
  @JsonKey(ignore: true)
  _$$_MenucardPageStateCopyWith<_$_MenucardPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
