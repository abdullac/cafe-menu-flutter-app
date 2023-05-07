// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diningcart_page_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DiningcartPageEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AvailableItemModel diningCartItem, int itemIndex)
        userClickedCheckbox,
    required TResult Function() editTotalSection,
    required TResult Function(PositionType? changedPositionTypeValue)
        changePositionType,
    required TResult Function(String? changedPositionNumberValue)
        changePositionNumber,
    required TResult Function(
            DiningCartButtonFunctionality? diningCartButtonType,
            bool? isReTakeDiningCart,
            String? positionCode,
            AvailableItemModel? diningCartItemForDelete)
        diningCartButtonPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AvailableItemModel diningCartItem, int itemIndex)?
        userClickedCheckbox,
    TResult? Function()? editTotalSection,
    TResult? Function(PositionType? changedPositionTypeValue)?
        changePositionType,
    TResult? Function(String? changedPositionNumberValue)? changePositionNumber,
    TResult? Function(
            DiningCartButtonFunctionality? diningCartButtonType,
            bool? isReTakeDiningCart,
            String? positionCode,
            AvailableItemModel? diningCartItemForDelete)?
        diningCartButtonPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AvailableItemModel diningCartItem, int itemIndex)?
        userClickedCheckbox,
    TResult Function()? editTotalSection,
    TResult Function(PositionType? changedPositionTypeValue)?
        changePositionType,
    TResult Function(String? changedPositionNumberValue)? changePositionNumber,
    TResult Function(
            DiningCartButtonFunctionality? diningCartButtonType,
            bool? isReTakeDiningCart,
            String? positionCode,
            AvailableItemModel? diningCartItemForDelete)?
        diningCartButtonPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserClickedCheckbox value) userClickedCheckbox,
    required TResult Function(EditTotalSection value) editTotalSection,
    required TResult Function(ChangePositionType value) changePositionType,
    required TResult Function(ChangePositionNumber value) changePositionNumber,
    required TResult Function(DiningCartButtonPressed value)
        diningCartButtonPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserClickedCheckbox value)? userClickedCheckbox,
    TResult? Function(EditTotalSection value)? editTotalSection,
    TResult? Function(ChangePositionType value)? changePositionType,
    TResult? Function(ChangePositionNumber value)? changePositionNumber,
    TResult? Function(DiningCartButtonPressed value)? diningCartButtonPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserClickedCheckbox value)? userClickedCheckbox,
    TResult Function(EditTotalSection value)? editTotalSection,
    TResult Function(ChangePositionType value)? changePositionType,
    TResult Function(ChangePositionNumber value)? changePositionNumber,
    TResult Function(DiningCartButtonPressed value)? diningCartButtonPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiningcartPageEventCopyWith<$Res> {
  factory $DiningcartPageEventCopyWith(
          DiningcartPageEvent value, $Res Function(DiningcartPageEvent) then) =
      _$DiningcartPageEventCopyWithImpl<$Res, DiningcartPageEvent>;
}

/// @nodoc
class _$DiningcartPageEventCopyWithImpl<$Res, $Val extends DiningcartPageEvent>
    implements $DiningcartPageEventCopyWith<$Res> {
  _$DiningcartPageEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UserClickedCheckboxCopyWith<$Res> {
  factory _$$UserClickedCheckboxCopyWith(_$UserClickedCheckbox value,
          $Res Function(_$UserClickedCheckbox) then) =
      __$$UserClickedCheckboxCopyWithImpl<$Res>;
  @useResult
  $Res call({AvailableItemModel diningCartItem, int itemIndex});

  $AvailableItemModelCopyWith<$Res> get diningCartItem;
}

/// @nodoc
class __$$UserClickedCheckboxCopyWithImpl<$Res>
    extends _$DiningcartPageEventCopyWithImpl<$Res, _$UserClickedCheckbox>
    implements _$$UserClickedCheckboxCopyWith<$Res> {
  __$$UserClickedCheckboxCopyWithImpl(
      _$UserClickedCheckbox _value, $Res Function(_$UserClickedCheckbox) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? diningCartItem = null,
    Object? itemIndex = null,
  }) {
    return _then(_$UserClickedCheckbox(
      diningCartItem: null == diningCartItem
          ? _value.diningCartItem
          : diningCartItem // ignore: cast_nullable_to_non_nullable
              as AvailableItemModel,
      itemIndex: null == itemIndex
          ? _value.itemIndex
          : itemIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $AvailableItemModelCopyWith<$Res> get diningCartItem {
    return $AvailableItemModelCopyWith<$Res>(_value.diningCartItem, (value) {
      return _then(_value.copyWith(diningCartItem: value));
    });
  }
}

/// @nodoc

class _$UserClickedCheckbox implements UserClickedCheckbox {
  const _$UserClickedCheckbox(
      {required this.diningCartItem, required this.itemIndex});

  @override
  final AvailableItemModel diningCartItem;
  @override
  final int itemIndex;

  @override
  String toString() {
    return 'DiningcartPageEvent.userClickedCheckbox(diningCartItem: $diningCartItem, itemIndex: $itemIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserClickedCheckbox &&
            (identical(other.diningCartItem, diningCartItem) ||
                other.diningCartItem == diningCartItem) &&
            (identical(other.itemIndex, itemIndex) ||
                other.itemIndex == itemIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, diningCartItem, itemIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserClickedCheckboxCopyWith<_$UserClickedCheckbox> get copyWith =>
      __$$UserClickedCheckboxCopyWithImpl<_$UserClickedCheckbox>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AvailableItemModel diningCartItem, int itemIndex)
        userClickedCheckbox,
    required TResult Function() editTotalSection,
    required TResult Function(PositionType? changedPositionTypeValue)
        changePositionType,
    required TResult Function(String? changedPositionNumberValue)
        changePositionNumber,
    required TResult Function(
            DiningCartButtonFunctionality? diningCartButtonType,
            bool? isReTakeDiningCart,
            String? positionCode,
            AvailableItemModel? diningCartItemForDelete)
        diningCartButtonPressed,
  }) {
    return userClickedCheckbox(diningCartItem, itemIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AvailableItemModel diningCartItem, int itemIndex)?
        userClickedCheckbox,
    TResult? Function()? editTotalSection,
    TResult? Function(PositionType? changedPositionTypeValue)?
        changePositionType,
    TResult? Function(String? changedPositionNumberValue)? changePositionNumber,
    TResult? Function(
            DiningCartButtonFunctionality? diningCartButtonType,
            bool? isReTakeDiningCart,
            String? positionCode,
            AvailableItemModel? diningCartItemForDelete)?
        diningCartButtonPressed,
  }) {
    return userClickedCheckbox?.call(diningCartItem, itemIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AvailableItemModel diningCartItem, int itemIndex)?
        userClickedCheckbox,
    TResult Function()? editTotalSection,
    TResult Function(PositionType? changedPositionTypeValue)?
        changePositionType,
    TResult Function(String? changedPositionNumberValue)? changePositionNumber,
    TResult Function(
            DiningCartButtonFunctionality? diningCartButtonType,
            bool? isReTakeDiningCart,
            String? positionCode,
            AvailableItemModel? diningCartItemForDelete)?
        diningCartButtonPressed,
    required TResult orElse(),
  }) {
    if (userClickedCheckbox != null) {
      return userClickedCheckbox(diningCartItem, itemIndex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserClickedCheckbox value) userClickedCheckbox,
    required TResult Function(EditTotalSection value) editTotalSection,
    required TResult Function(ChangePositionType value) changePositionType,
    required TResult Function(ChangePositionNumber value) changePositionNumber,
    required TResult Function(DiningCartButtonPressed value)
        diningCartButtonPressed,
  }) {
    return userClickedCheckbox(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserClickedCheckbox value)? userClickedCheckbox,
    TResult? Function(EditTotalSection value)? editTotalSection,
    TResult? Function(ChangePositionType value)? changePositionType,
    TResult? Function(ChangePositionNumber value)? changePositionNumber,
    TResult? Function(DiningCartButtonPressed value)? diningCartButtonPressed,
  }) {
    return userClickedCheckbox?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserClickedCheckbox value)? userClickedCheckbox,
    TResult Function(EditTotalSection value)? editTotalSection,
    TResult Function(ChangePositionType value)? changePositionType,
    TResult Function(ChangePositionNumber value)? changePositionNumber,
    TResult Function(DiningCartButtonPressed value)? diningCartButtonPressed,
    required TResult orElse(),
  }) {
    if (userClickedCheckbox != null) {
      return userClickedCheckbox(this);
    }
    return orElse();
  }
}

abstract class UserClickedCheckbox implements DiningcartPageEvent {
  const factory UserClickedCheckbox(
      {required final AvailableItemModel diningCartItem,
      required final int itemIndex}) = _$UserClickedCheckbox;

  AvailableItemModel get diningCartItem;
  int get itemIndex;
  @JsonKey(ignore: true)
  _$$UserClickedCheckboxCopyWith<_$UserClickedCheckbox> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EditTotalSectionCopyWith<$Res> {
  factory _$$EditTotalSectionCopyWith(
          _$EditTotalSection value, $Res Function(_$EditTotalSection) then) =
      __$$EditTotalSectionCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EditTotalSectionCopyWithImpl<$Res>
    extends _$DiningcartPageEventCopyWithImpl<$Res, _$EditTotalSection>
    implements _$$EditTotalSectionCopyWith<$Res> {
  __$$EditTotalSectionCopyWithImpl(
      _$EditTotalSection _value, $Res Function(_$EditTotalSection) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EditTotalSection implements EditTotalSection {
  const _$EditTotalSection();

  @override
  String toString() {
    return 'DiningcartPageEvent.editTotalSection()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EditTotalSection);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AvailableItemModel diningCartItem, int itemIndex)
        userClickedCheckbox,
    required TResult Function() editTotalSection,
    required TResult Function(PositionType? changedPositionTypeValue)
        changePositionType,
    required TResult Function(String? changedPositionNumberValue)
        changePositionNumber,
    required TResult Function(
            DiningCartButtonFunctionality? diningCartButtonType,
            bool? isReTakeDiningCart,
            String? positionCode,
            AvailableItemModel? diningCartItemForDelete)
        diningCartButtonPressed,
  }) {
    return editTotalSection();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AvailableItemModel diningCartItem, int itemIndex)?
        userClickedCheckbox,
    TResult? Function()? editTotalSection,
    TResult? Function(PositionType? changedPositionTypeValue)?
        changePositionType,
    TResult? Function(String? changedPositionNumberValue)? changePositionNumber,
    TResult? Function(
            DiningCartButtonFunctionality? diningCartButtonType,
            bool? isReTakeDiningCart,
            String? positionCode,
            AvailableItemModel? diningCartItemForDelete)?
        diningCartButtonPressed,
  }) {
    return editTotalSection?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AvailableItemModel diningCartItem, int itemIndex)?
        userClickedCheckbox,
    TResult Function()? editTotalSection,
    TResult Function(PositionType? changedPositionTypeValue)?
        changePositionType,
    TResult Function(String? changedPositionNumberValue)? changePositionNumber,
    TResult Function(
            DiningCartButtonFunctionality? diningCartButtonType,
            bool? isReTakeDiningCart,
            String? positionCode,
            AvailableItemModel? diningCartItemForDelete)?
        diningCartButtonPressed,
    required TResult orElse(),
  }) {
    if (editTotalSection != null) {
      return editTotalSection();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserClickedCheckbox value) userClickedCheckbox,
    required TResult Function(EditTotalSection value) editTotalSection,
    required TResult Function(ChangePositionType value) changePositionType,
    required TResult Function(ChangePositionNumber value) changePositionNumber,
    required TResult Function(DiningCartButtonPressed value)
        diningCartButtonPressed,
  }) {
    return editTotalSection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserClickedCheckbox value)? userClickedCheckbox,
    TResult? Function(EditTotalSection value)? editTotalSection,
    TResult? Function(ChangePositionType value)? changePositionType,
    TResult? Function(ChangePositionNumber value)? changePositionNumber,
    TResult? Function(DiningCartButtonPressed value)? diningCartButtonPressed,
  }) {
    return editTotalSection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserClickedCheckbox value)? userClickedCheckbox,
    TResult Function(EditTotalSection value)? editTotalSection,
    TResult Function(ChangePositionType value)? changePositionType,
    TResult Function(ChangePositionNumber value)? changePositionNumber,
    TResult Function(DiningCartButtonPressed value)? diningCartButtonPressed,
    required TResult orElse(),
  }) {
    if (editTotalSection != null) {
      return editTotalSection(this);
    }
    return orElse();
  }
}

abstract class EditTotalSection implements DiningcartPageEvent {
  const factory EditTotalSection() = _$EditTotalSection;
}

/// @nodoc
abstract class _$$ChangePositionTypeCopyWith<$Res> {
  factory _$$ChangePositionTypeCopyWith(_$ChangePositionType value,
          $Res Function(_$ChangePositionType) then) =
      __$$ChangePositionTypeCopyWithImpl<$Res>;
  @useResult
  $Res call({PositionType? changedPositionTypeValue});
}

/// @nodoc
class __$$ChangePositionTypeCopyWithImpl<$Res>
    extends _$DiningcartPageEventCopyWithImpl<$Res, _$ChangePositionType>
    implements _$$ChangePositionTypeCopyWith<$Res> {
  __$$ChangePositionTypeCopyWithImpl(
      _$ChangePositionType _value, $Res Function(_$ChangePositionType) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? changedPositionTypeValue = freezed,
  }) {
    return _then(_$ChangePositionType(
      changedPositionTypeValue: freezed == changedPositionTypeValue
          ? _value.changedPositionTypeValue
          : changedPositionTypeValue // ignore: cast_nullable_to_non_nullable
              as PositionType?,
    ));
  }
}

/// @nodoc

class _$ChangePositionType implements ChangePositionType {
  const _$ChangePositionType({required this.changedPositionTypeValue});

  @override
  final PositionType? changedPositionTypeValue;

  @override
  String toString() {
    return 'DiningcartPageEvent.changePositionType(changedPositionTypeValue: $changedPositionTypeValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangePositionType &&
            (identical(
                    other.changedPositionTypeValue, changedPositionTypeValue) ||
                other.changedPositionTypeValue == changedPositionTypeValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, changedPositionTypeValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangePositionTypeCopyWith<_$ChangePositionType> get copyWith =>
      __$$ChangePositionTypeCopyWithImpl<_$ChangePositionType>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AvailableItemModel diningCartItem, int itemIndex)
        userClickedCheckbox,
    required TResult Function() editTotalSection,
    required TResult Function(PositionType? changedPositionTypeValue)
        changePositionType,
    required TResult Function(String? changedPositionNumberValue)
        changePositionNumber,
    required TResult Function(
            DiningCartButtonFunctionality? diningCartButtonType,
            bool? isReTakeDiningCart,
            String? positionCode,
            AvailableItemModel? diningCartItemForDelete)
        diningCartButtonPressed,
  }) {
    return changePositionType(changedPositionTypeValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AvailableItemModel diningCartItem, int itemIndex)?
        userClickedCheckbox,
    TResult? Function()? editTotalSection,
    TResult? Function(PositionType? changedPositionTypeValue)?
        changePositionType,
    TResult? Function(String? changedPositionNumberValue)? changePositionNumber,
    TResult? Function(
            DiningCartButtonFunctionality? diningCartButtonType,
            bool? isReTakeDiningCart,
            String? positionCode,
            AvailableItemModel? diningCartItemForDelete)?
        diningCartButtonPressed,
  }) {
    return changePositionType?.call(changedPositionTypeValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AvailableItemModel diningCartItem, int itemIndex)?
        userClickedCheckbox,
    TResult Function()? editTotalSection,
    TResult Function(PositionType? changedPositionTypeValue)?
        changePositionType,
    TResult Function(String? changedPositionNumberValue)? changePositionNumber,
    TResult Function(
            DiningCartButtonFunctionality? diningCartButtonType,
            bool? isReTakeDiningCart,
            String? positionCode,
            AvailableItemModel? diningCartItemForDelete)?
        diningCartButtonPressed,
    required TResult orElse(),
  }) {
    if (changePositionType != null) {
      return changePositionType(changedPositionTypeValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserClickedCheckbox value) userClickedCheckbox,
    required TResult Function(EditTotalSection value) editTotalSection,
    required TResult Function(ChangePositionType value) changePositionType,
    required TResult Function(ChangePositionNumber value) changePositionNumber,
    required TResult Function(DiningCartButtonPressed value)
        diningCartButtonPressed,
  }) {
    return changePositionType(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserClickedCheckbox value)? userClickedCheckbox,
    TResult? Function(EditTotalSection value)? editTotalSection,
    TResult? Function(ChangePositionType value)? changePositionType,
    TResult? Function(ChangePositionNumber value)? changePositionNumber,
    TResult? Function(DiningCartButtonPressed value)? diningCartButtonPressed,
  }) {
    return changePositionType?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserClickedCheckbox value)? userClickedCheckbox,
    TResult Function(EditTotalSection value)? editTotalSection,
    TResult Function(ChangePositionType value)? changePositionType,
    TResult Function(ChangePositionNumber value)? changePositionNumber,
    TResult Function(DiningCartButtonPressed value)? diningCartButtonPressed,
    required TResult orElse(),
  }) {
    if (changePositionType != null) {
      return changePositionType(this);
    }
    return orElse();
  }
}

abstract class ChangePositionType implements DiningcartPageEvent {
  const factory ChangePositionType(
          {required final PositionType? changedPositionTypeValue}) =
      _$ChangePositionType;

  PositionType? get changedPositionTypeValue;
  @JsonKey(ignore: true)
  _$$ChangePositionTypeCopyWith<_$ChangePositionType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangePositionNumberCopyWith<$Res> {
  factory _$$ChangePositionNumberCopyWith(_$ChangePositionNumber value,
          $Res Function(_$ChangePositionNumber) then) =
      __$$ChangePositionNumberCopyWithImpl<$Res>;
  @useResult
  $Res call({String? changedPositionNumberValue});
}

/// @nodoc
class __$$ChangePositionNumberCopyWithImpl<$Res>
    extends _$DiningcartPageEventCopyWithImpl<$Res, _$ChangePositionNumber>
    implements _$$ChangePositionNumberCopyWith<$Res> {
  __$$ChangePositionNumberCopyWithImpl(_$ChangePositionNumber _value,
      $Res Function(_$ChangePositionNumber) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? changedPositionNumberValue = freezed,
  }) {
    return _then(_$ChangePositionNumber(
      changedPositionNumberValue: freezed == changedPositionNumberValue
          ? _value.changedPositionNumberValue
          : changedPositionNumberValue // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ChangePositionNumber implements ChangePositionNumber {
  const _$ChangePositionNumber({required this.changedPositionNumberValue});

  @override
  final String? changedPositionNumberValue;

  @override
  String toString() {
    return 'DiningcartPageEvent.changePositionNumber(changedPositionNumberValue: $changedPositionNumberValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangePositionNumber &&
            (identical(other.changedPositionNumberValue,
                    changedPositionNumberValue) ||
                other.changedPositionNumberValue ==
                    changedPositionNumberValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, changedPositionNumberValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangePositionNumberCopyWith<_$ChangePositionNumber> get copyWith =>
      __$$ChangePositionNumberCopyWithImpl<_$ChangePositionNumber>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AvailableItemModel diningCartItem, int itemIndex)
        userClickedCheckbox,
    required TResult Function() editTotalSection,
    required TResult Function(PositionType? changedPositionTypeValue)
        changePositionType,
    required TResult Function(String? changedPositionNumberValue)
        changePositionNumber,
    required TResult Function(
            DiningCartButtonFunctionality? diningCartButtonType,
            bool? isReTakeDiningCart,
            String? positionCode,
            AvailableItemModel? diningCartItemForDelete)
        diningCartButtonPressed,
  }) {
    return changePositionNumber(changedPositionNumberValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AvailableItemModel diningCartItem, int itemIndex)?
        userClickedCheckbox,
    TResult? Function()? editTotalSection,
    TResult? Function(PositionType? changedPositionTypeValue)?
        changePositionType,
    TResult? Function(String? changedPositionNumberValue)? changePositionNumber,
    TResult? Function(
            DiningCartButtonFunctionality? diningCartButtonType,
            bool? isReTakeDiningCart,
            String? positionCode,
            AvailableItemModel? diningCartItemForDelete)?
        diningCartButtonPressed,
  }) {
    return changePositionNumber?.call(changedPositionNumberValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AvailableItemModel diningCartItem, int itemIndex)?
        userClickedCheckbox,
    TResult Function()? editTotalSection,
    TResult Function(PositionType? changedPositionTypeValue)?
        changePositionType,
    TResult Function(String? changedPositionNumberValue)? changePositionNumber,
    TResult Function(
            DiningCartButtonFunctionality? diningCartButtonType,
            bool? isReTakeDiningCart,
            String? positionCode,
            AvailableItemModel? diningCartItemForDelete)?
        diningCartButtonPressed,
    required TResult orElse(),
  }) {
    if (changePositionNumber != null) {
      return changePositionNumber(changedPositionNumberValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserClickedCheckbox value) userClickedCheckbox,
    required TResult Function(EditTotalSection value) editTotalSection,
    required TResult Function(ChangePositionType value) changePositionType,
    required TResult Function(ChangePositionNumber value) changePositionNumber,
    required TResult Function(DiningCartButtonPressed value)
        diningCartButtonPressed,
  }) {
    return changePositionNumber(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserClickedCheckbox value)? userClickedCheckbox,
    TResult? Function(EditTotalSection value)? editTotalSection,
    TResult? Function(ChangePositionType value)? changePositionType,
    TResult? Function(ChangePositionNumber value)? changePositionNumber,
    TResult? Function(DiningCartButtonPressed value)? diningCartButtonPressed,
  }) {
    return changePositionNumber?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserClickedCheckbox value)? userClickedCheckbox,
    TResult Function(EditTotalSection value)? editTotalSection,
    TResult Function(ChangePositionType value)? changePositionType,
    TResult Function(ChangePositionNumber value)? changePositionNumber,
    TResult Function(DiningCartButtonPressed value)? diningCartButtonPressed,
    required TResult orElse(),
  }) {
    if (changePositionNumber != null) {
      return changePositionNumber(this);
    }
    return orElse();
  }
}

abstract class ChangePositionNumber implements DiningcartPageEvent {
  const factory ChangePositionNumber(
          {required final String? changedPositionNumberValue}) =
      _$ChangePositionNumber;

  String? get changedPositionNumberValue;
  @JsonKey(ignore: true)
  _$$ChangePositionNumberCopyWith<_$ChangePositionNumber> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DiningCartButtonPressedCopyWith<$Res> {
  factory _$$DiningCartButtonPressedCopyWith(_$DiningCartButtonPressed value,
          $Res Function(_$DiningCartButtonPressed) then) =
      __$$DiningCartButtonPressedCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {DiningCartButtonFunctionality? diningCartButtonType,
      bool? isReTakeDiningCart,
      String? positionCode,
      AvailableItemModel? diningCartItemForDelete});

  $AvailableItemModelCopyWith<$Res>? get diningCartItemForDelete;
}

/// @nodoc
class __$$DiningCartButtonPressedCopyWithImpl<$Res>
    extends _$DiningcartPageEventCopyWithImpl<$Res, _$DiningCartButtonPressed>
    implements _$$DiningCartButtonPressedCopyWith<$Res> {
  __$$DiningCartButtonPressedCopyWithImpl(_$DiningCartButtonPressed _value,
      $Res Function(_$DiningCartButtonPressed) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? diningCartButtonType = freezed,
    Object? isReTakeDiningCart = freezed,
    Object? positionCode = freezed,
    Object? diningCartItemForDelete = freezed,
  }) {
    return _then(_$DiningCartButtonPressed(
      diningCartButtonType: freezed == diningCartButtonType
          ? _value.diningCartButtonType
          : diningCartButtonType // ignore: cast_nullable_to_non_nullable
              as DiningCartButtonFunctionality?,
      isReTakeDiningCart: freezed == isReTakeDiningCart
          ? _value.isReTakeDiningCart
          : isReTakeDiningCart // ignore: cast_nullable_to_non_nullable
              as bool?,
      positionCode: freezed == positionCode
          ? _value.positionCode
          : positionCode // ignore: cast_nullable_to_non_nullable
              as String?,
      diningCartItemForDelete: freezed == diningCartItemForDelete
          ? _value.diningCartItemForDelete
          : diningCartItemForDelete // ignore: cast_nullable_to_non_nullable
              as AvailableItemModel?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $AvailableItemModelCopyWith<$Res>? get diningCartItemForDelete {
    if (_value.diningCartItemForDelete == null) {
      return null;
    }

    return $AvailableItemModelCopyWith<$Res>(_value.diningCartItemForDelete!,
        (value) {
      return _then(_value.copyWith(diningCartItemForDelete: value));
    });
  }
}

/// @nodoc

class _$DiningCartButtonPressed implements DiningCartButtonPressed {
  const _$DiningCartButtonPressed(
      {required this.diningCartButtonType,
      this.isReTakeDiningCart,
      this.positionCode,
      this.diningCartItemForDelete});

  @override
  final DiningCartButtonFunctionality? diningCartButtonType;
  @override
  final bool? isReTakeDiningCart;
  @override
  final String? positionCode;
  @override
  final AvailableItemModel? diningCartItemForDelete;

  @override
  String toString() {
    return 'DiningcartPageEvent.diningCartButtonPressed(diningCartButtonType: $diningCartButtonType, isReTakeDiningCart: $isReTakeDiningCart, positionCode: $positionCode, diningCartItemForDelete: $diningCartItemForDelete)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiningCartButtonPressed &&
            (identical(other.diningCartButtonType, diningCartButtonType) ||
                other.diningCartButtonType == diningCartButtonType) &&
            (identical(other.isReTakeDiningCart, isReTakeDiningCart) ||
                other.isReTakeDiningCart == isReTakeDiningCart) &&
            (identical(other.positionCode, positionCode) ||
                other.positionCode == positionCode) &&
            (identical(
                    other.diningCartItemForDelete, diningCartItemForDelete) ||
                other.diningCartItemForDelete == diningCartItemForDelete));
  }

  @override
  int get hashCode => Object.hash(runtimeType, diningCartButtonType,
      isReTakeDiningCart, positionCode, diningCartItemForDelete);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DiningCartButtonPressedCopyWith<_$DiningCartButtonPressed> get copyWith =>
      __$$DiningCartButtonPressedCopyWithImpl<_$DiningCartButtonPressed>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AvailableItemModel diningCartItem, int itemIndex)
        userClickedCheckbox,
    required TResult Function() editTotalSection,
    required TResult Function(PositionType? changedPositionTypeValue)
        changePositionType,
    required TResult Function(String? changedPositionNumberValue)
        changePositionNumber,
    required TResult Function(
            DiningCartButtonFunctionality? diningCartButtonType,
            bool? isReTakeDiningCart,
            String? positionCode,
            AvailableItemModel? diningCartItemForDelete)
        diningCartButtonPressed,
  }) {
    return diningCartButtonPressed(diningCartButtonType, isReTakeDiningCart,
        positionCode, diningCartItemForDelete);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AvailableItemModel diningCartItem, int itemIndex)?
        userClickedCheckbox,
    TResult? Function()? editTotalSection,
    TResult? Function(PositionType? changedPositionTypeValue)?
        changePositionType,
    TResult? Function(String? changedPositionNumberValue)? changePositionNumber,
    TResult? Function(
            DiningCartButtonFunctionality? diningCartButtonType,
            bool? isReTakeDiningCart,
            String? positionCode,
            AvailableItemModel? diningCartItemForDelete)?
        diningCartButtonPressed,
  }) {
    return diningCartButtonPressed?.call(diningCartButtonType,
        isReTakeDiningCart, positionCode, diningCartItemForDelete);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AvailableItemModel diningCartItem, int itemIndex)?
        userClickedCheckbox,
    TResult Function()? editTotalSection,
    TResult Function(PositionType? changedPositionTypeValue)?
        changePositionType,
    TResult Function(String? changedPositionNumberValue)? changePositionNumber,
    TResult Function(
            DiningCartButtonFunctionality? diningCartButtonType,
            bool? isReTakeDiningCart,
            String? positionCode,
            AvailableItemModel? diningCartItemForDelete)?
        diningCartButtonPressed,
    required TResult orElse(),
  }) {
    if (diningCartButtonPressed != null) {
      return diningCartButtonPressed(diningCartButtonType, isReTakeDiningCart,
          positionCode, diningCartItemForDelete);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserClickedCheckbox value) userClickedCheckbox,
    required TResult Function(EditTotalSection value) editTotalSection,
    required TResult Function(ChangePositionType value) changePositionType,
    required TResult Function(ChangePositionNumber value) changePositionNumber,
    required TResult Function(DiningCartButtonPressed value)
        diningCartButtonPressed,
  }) {
    return diningCartButtonPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserClickedCheckbox value)? userClickedCheckbox,
    TResult? Function(EditTotalSection value)? editTotalSection,
    TResult? Function(ChangePositionType value)? changePositionType,
    TResult? Function(ChangePositionNumber value)? changePositionNumber,
    TResult? Function(DiningCartButtonPressed value)? diningCartButtonPressed,
  }) {
    return diningCartButtonPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserClickedCheckbox value)? userClickedCheckbox,
    TResult Function(EditTotalSection value)? editTotalSection,
    TResult Function(ChangePositionType value)? changePositionType,
    TResult Function(ChangePositionNumber value)? changePositionNumber,
    TResult Function(DiningCartButtonPressed value)? diningCartButtonPressed,
    required TResult orElse(),
  }) {
    if (diningCartButtonPressed != null) {
      return diningCartButtonPressed(this);
    }
    return orElse();
  }
}

abstract class DiningCartButtonPressed implements DiningcartPageEvent {
  const factory DiningCartButtonPressed(
          {required final DiningCartButtonFunctionality? diningCartButtonType,
          final bool? isReTakeDiningCart,
          final String? positionCode,
          final AvailableItemModel? diningCartItemForDelete}) =
      _$DiningCartButtonPressed;

  DiningCartButtonFunctionality? get diningCartButtonType;
  bool? get isReTakeDiningCart;
  String? get positionCode;
  AvailableItemModel? get diningCartItemForDelete;
  @JsonKey(ignore: true)
  _$$DiningCartButtonPressedCopyWith<_$DiningCartButtonPressed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DiningcartPageState {
  List<AvailableItemModel> get diningCartList =>
      throw _privateConstructorUsedError;
  bool get isSelected => throw _privateConstructorUsedError;
  int? get itemIndex => throw _privateConstructorUsedError;
  Map<String, dynamic> get valuesOfTotalSectionAsMap =>
      throw _privateConstructorUsedError;
  PositionType? get positionTypeValue => throw _privateConstructorUsedError;
  String? get positionNumberValue => throw _privateConstructorUsedError;
  DiningCartButtonFunctionality? get diningCartButtonType =>
      throw _privateConstructorUsedError;
  String get diningCartButtonText => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DiningcartPageStateCopyWith<DiningcartPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiningcartPageStateCopyWith<$Res> {
  factory $DiningcartPageStateCopyWith(
          DiningcartPageState value, $Res Function(DiningcartPageState) then) =
      _$DiningcartPageStateCopyWithImpl<$Res, DiningcartPageState>;
  @useResult
  $Res call(
      {List<AvailableItemModel> diningCartList,
      bool isSelected,
      int? itemIndex,
      Map<String, dynamic> valuesOfTotalSectionAsMap,
      PositionType? positionTypeValue,
      String? positionNumberValue,
      DiningCartButtonFunctionality? diningCartButtonType,
      String diningCartButtonText});
}

/// @nodoc
class _$DiningcartPageStateCopyWithImpl<$Res, $Val extends DiningcartPageState>
    implements $DiningcartPageStateCopyWith<$Res> {
  _$DiningcartPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? diningCartList = null,
    Object? isSelected = null,
    Object? itemIndex = freezed,
    Object? valuesOfTotalSectionAsMap = null,
    Object? positionTypeValue = freezed,
    Object? positionNumberValue = freezed,
    Object? diningCartButtonType = freezed,
    Object? diningCartButtonText = null,
  }) {
    return _then(_value.copyWith(
      diningCartList: null == diningCartList
          ? _value.diningCartList
          : diningCartList // ignore: cast_nullable_to_non_nullable
              as List<AvailableItemModel>,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      itemIndex: freezed == itemIndex
          ? _value.itemIndex
          : itemIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      valuesOfTotalSectionAsMap: null == valuesOfTotalSectionAsMap
          ? _value.valuesOfTotalSectionAsMap
          : valuesOfTotalSectionAsMap // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      positionTypeValue: freezed == positionTypeValue
          ? _value.positionTypeValue
          : positionTypeValue // ignore: cast_nullable_to_non_nullable
              as PositionType?,
      positionNumberValue: freezed == positionNumberValue
          ? _value.positionNumberValue
          : positionNumberValue // ignore: cast_nullable_to_non_nullable
              as String?,
      diningCartButtonType: freezed == diningCartButtonType
          ? _value.diningCartButtonType
          : diningCartButtonType // ignore: cast_nullable_to_non_nullable
              as DiningCartButtonFunctionality?,
      diningCartButtonText: null == diningCartButtonText
          ? _value.diningCartButtonText
          : diningCartButtonText // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DiningcartPageStateCopyWith<$Res>
    implements $DiningcartPageStateCopyWith<$Res> {
  factory _$$_DiningcartPageStateCopyWith(_$_DiningcartPageState value,
          $Res Function(_$_DiningcartPageState) then) =
      __$$_DiningcartPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<AvailableItemModel> diningCartList,
      bool isSelected,
      int? itemIndex,
      Map<String, dynamic> valuesOfTotalSectionAsMap,
      PositionType? positionTypeValue,
      String? positionNumberValue,
      DiningCartButtonFunctionality? diningCartButtonType,
      String diningCartButtonText});
}

/// @nodoc
class __$$_DiningcartPageStateCopyWithImpl<$Res>
    extends _$DiningcartPageStateCopyWithImpl<$Res, _$_DiningcartPageState>
    implements _$$_DiningcartPageStateCopyWith<$Res> {
  __$$_DiningcartPageStateCopyWithImpl(_$_DiningcartPageState _value,
      $Res Function(_$_DiningcartPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? diningCartList = null,
    Object? isSelected = null,
    Object? itemIndex = freezed,
    Object? valuesOfTotalSectionAsMap = null,
    Object? positionTypeValue = freezed,
    Object? positionNumberValue = freezed,
    Object? diningCartButtonType = freezed,
    Object? diningCartButtonText = null,
  }) {
    return _then(_$_DiningcartPageState(
      diningCartList: null == diningCartList
          ? _value._diningCartList
          : diningCartList // ignore: cast_nullable_to_non_nullable
              as List<AvailableItemModel>,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      itemIndex: freezed == itemIndex
          ? _value.itemIndex
          : itemIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      valuesOfTotalSectionAsMap: null == valuesOfTotalSectionAsMap
          ? _value._valuesOfTotalSectionAsMap
          : valuesOfTotalSectionAsMap // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      positionTypeValue: freezed == positionTypeValue
          ? _value.positionTypeValue
          : positionTypeValue // ignore: cast_nullable_to_non_nullable
              as PositionType?,
      positionNumberValue: freezed == positionNumberValue
          ? _value.positionNumberValue
          : positionNumberValue // ignore: cast_nullable_to_non_nullable
              as String?,
      diningCartButtonType: freezed == diningCartButtonType
          ? _value.diningCartButtonType
          : diningCartButtonType // ignore: cast_nullable_to_non_nullable
              as DiningCartButtonFunctionality?,
      diningCartButtonText: null == diningCartButtonText
          ? _value.diningCartButtonText
          : diningCartButtonText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_DiningcartPageState implements _DiningcartPageState {
  const _$_DiningcartPageState(
      {required final List<AvailableItemModel> diningCartList,
      required this.isSelected,
      required this.itemIndex,
      required final Map<String, dynamic> valuesOfTotalSectionAsMap,
      required this.positionTypeValue,
      required this.positionNumberValue,
      required this.diningCartButtonType,
      required this.diningCartButtonText})
      : _diningCartList = diningCartList,
        _valuesOfTotalSectionAsMap = valuesOfTotalSectionAsMap;

  final List<AvailableItemModel> _diningCartList;
  @override
  List<AvailableItemModel> get diningCartList {
    if (_diningCartList is EqualUnmodifiableListView) return _diningCartList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_diningCartList);
  }

  @override
  final bool isSelected;
  @override
  final int? itemIndex;
  final Map<String, dynamic> _valuesOfTotalSectionAsMap;
  @override
  Map<String, dynamic> get valuesOfTotalSectionAsMap {
    if (_valuesOfTotalSectionAsMap is EqualUnmodifiableMapView)
      return _valuesOfTotalSectionAsMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_valuesOfTotalSectionAsMap);
  }

  @override
  final PositionType? positionTypeValue;
  @override
  final String? positionNumberValue;
  @override
  final DiningCartButtonFunctionality? diningCartButtonType;
  @override
  final String diningCartButtonText;

  @override
  String toString() {
    return 'DiningcartPageState(diningCartList: $diningCartList, isSelected: $isSelected, itemIndex: $itemIndex, valuesOfTotalSectionAsMap: $valuesOfTotalSectionAsMap, positionTypeValue: $positionTypeValue, positionNumberValue: $positionNumberValue, diningCartButtonType: $diningCartButtonType, diningCartButtonText: $diningCartButtonText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DiningcartPageState &&
            const DeepCollectionEquality()
                .equals(other._diningCartList, _diningCartList) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected) &&
            (identical(other.itemIndex, itemIndex) ||
                other.itemIndex == itemIndex) &&
            const DeepCollectionEquality().equals(
                other._valuesOfTotalSectionAsMap, _valuesOfTotalSectionAsMap) &&
            (identical(other.positionTypeValue, positionTypeValue) ||
                other.positionTypeValue == positionTypeValue) &&
            (identical(other.positionNumberValue, positionNumberValue) ||
                other.positionNumberValue == positionNumberValue) &&
            (identical(other.diningCartButtonType, diningCartButtonType) ||
                other.diningCartButtonType == diningCartButtonType) &&
            (identical(other.diningCartButtonText, diningCartButtonText) ||
                other.diningCartButtonText == diningCartButtonText));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_diningCartList),
      isSelected,
      itemIndex,
      const DeepCollectionEquality().hash(_valuesOfTotalSectionAsMap),
      positionTypeValue,
      positionNumberValue,
      diningCartButtonType,
      diningCartButtonText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DiningcartPageStateCopyWith<_$_DiningcartPageState> get copyWith =>
      __$$_DiningcartPageStateCopyWithImpl<_$_DiningcartPageState>(
          this, _$identity);
}

abstract class _DiningcartPageState implements DiningcartPageState {
  const factory _DiningcartPageState(
      {required final List<AvailableItemModel> diningCartList,
      required final bool isSelected,
      required final int? itemIndex,
      required final Map<String, dynamic> valuesOfTotalSectionAsMap,
      required final PositionType? positionTypeValue,
      required final String? positionNumberValue,
      required final DiningCartButtonFunctionality? diningCartButtonType,
      required final String diningCartButtonText}) = _$_DiningcartPageState;

  @override
  List<AvailableItemModel> get diningCartList;
  @override
  bool get isSelected;
  @override
  int? get itemIndex;
  @override
  Map<String, dynamic> get valuesOfTotalSectionAsMap;
  @override
  PositionType? get positionTypeValue;
  @override
  String? get positionNumberValue;
  @override
  DiningCartButtonFunctionality? get diningCartButtonType;
  @override
  String get diningCartButtonText;
  @override
  @JsonKey(ignore: true)
  _$$_DiningcartPageStateCopyWith<_$_DiningcartPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
