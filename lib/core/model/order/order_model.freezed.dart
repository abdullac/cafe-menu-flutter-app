// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) {
  return _OrderModel.fromJson(json);
}

/// @nodoc
mixin _$OrderModel {
  int? get orderId => throw _privateConstructorUsedError;
  int? get customerId => throw _privateConstructorUsedError;
  String? get customerName => throw _privateConstructorUsedError;
  String? get positionCode => throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get orderedAvailableItemModelList =>
      throw _privateConstructorUsedError;
  List<dynamic>? get additionalOrderList => throw _privateConstructorUsedError;
  List<dynamic>? get runningOrderList => throw _privateConstructorUsedError;
  OrderType? get orderType => throw _privateConstructorUsedError;
  int? get totalItems => throw _privateConstructorUsedError;
  int? get totalQty => throw _privateConstructorUsedError;
  double? get totalAmount => throw _privateConstructorUsedError;
  DateTime? get orderedTime => throw _privateConstructorUsedError;
  bool? get isPaid => throw _privateConstructorUsedError;
  bool? get isTakeNow => throw _privateConstructorUsedError;
  bool? get isOrderConfirmed => throw _privateConstructorUsedError;
  String? get customerFeadback => throw _privateConstructorUsedError;
  String? get customerSuggession => throw _privateConstructorUsedError;
  bool? get recievedAllItems => throw _privateConstructorUsedError;
  bool? get itemsReady => throw _privateConstructorUsedError;
  bool? get orderDelevered => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderModelCopyWith<OrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderModelCopyWith<$Res> {
  factory $OrderModelCopyWith(
          OrderModel value, $Res Function(OrderModel) then) =
      _$OrderModelCopyWithImpl<$Res, OrderModel>;
  @useResult
  $Res call(
      {int? orderId,
      int? customerId,
      String? customerName,
      String? positionCode,
      List<Map<String, dynamic>> orderedAvailableItemModelList,
      List<dynamic>? additionalOrderList,
      List<dynamic>? runningOrderList,
      OrderType? orderType,
      int? totalItems,
      int? totalQty,
      double? totalAmount,
      DateTime? orderedTime,
      bool? isPaid,
      bool? isTakeNow,
      bool? isOrderConfirmed,
      String? customerFeadback,
      String? customerSuggession,
      bool? recievedAllItems,
      bool? itemsReady,
      bool? orderDelevered});
}

/// @nodoc
class _$OrderModelCopyWithImpl<$Res, $Val extends OrderModel>
    implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = freezed,
    Object? customerId = freezed,
    Object? customerName = freezed,
    Object? positionCode = freezed,
    Object? orderedAvailableItemModelList = null,
    Object? additionalOrderList = freezed,
    Object? runningOrderList = freezed,
    Object? orderType = freezed,
    Object? totalItems = freezed,
    Object? totalQty = freezed,
    Object? totalAmount = freezed,
    Object? orderedTime = freezed,
    Object? isPaid = freezed,
    Object? isTakeNow = freezed,
    Object? isOrderConfirmed = freezed,
    Object? customerFeadback = freezed,
    Object? customerSuggession = freezed,
    Object? recievedAllItems = freezed,
    Object? itemsReady = freezed,
    Object? orderDelevered = freezed,
  }) {
    return _then(_value.copyWith(
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int?,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int?,
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      positionCode: freezed == positionCode
          ? _value.positionCode
          : positionCode // ignore: cast_nullable_to_non_nullable
              as String?,
      orderedAvailableItemModelList: null == orderedAvailableItemModelList
          ? _value.orderedAvailableItemModelList
          : orderedAvailableItemModelList // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      additionalOrderList: freezed == additionalOrderList
          ? _value.additionalOrderList
          : additionalOrderList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      runningOrderList: freezed == runningOrderList
          ? _value.runningOrderList
          : runningOrderList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      orderType: freezed == orderType
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as OrderType?,
      totalItems: freezed == totalItems
          ? _value.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int?,
      totalQty: freezed == totalQty
          ? _value.totalQty
          : totalQty // ignore: cast_nullable_to_non_nullable
              as int?,
      totalAmount: freezed == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      orderedTime: freezed == orderedTime
          ? _value.orderedTime
          : orderedTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isPaid: freezed == isPaid
          ? _value.isPaid
          : isPaid // ignore: cast_nullable_to_non_nullable
              as bool?,
      isTakeNow: freezed == isTakeNow
          ? _value.isTakeNow
          : isTakeNow // ignore: cast_nullable_to_non_nullable
              as bool?,
      isOrderConfirmed: freezed == isOrderConfirmed
          ? _value.isOrderConfirmed
          : isOrderConfirmed // ignore: cast_nullable_to_non_nullable
              as bool?,
      customerFeadback: freezed == customerFeadback
          ? _value.customerFeadback
          : customerFeadback // ignore: cast_nullable_to_non_nullable
              as String?,
      customerSuggession: freezed == customerSuggession
          ? _value.customerSuggession
          : customerSuggession // ignore: cast_nullable_to_non_nullable
              as String?,
      recievedAllItems: freezed == recievedAllItems
          ? _value.recievedAllItems
          : recievedAllItems // ignore: cast_nullable_to_non_nullable
              as bool?,
      itemsReady: freezed == itemsReady
          ? _value.itemsReady
          : itemsReady // ignore: cast_nullable_to_non_nullable
              as bool?,
      orderDelevered: freezed == orderDelevered
          ? _value.orderDelevered
          : orderDelevered // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrderModelCopyWith<$Res>
    implements $OrderModelCopyWith<$Res> {
  factory _$$_OrderModelCopyWith(
          _$_OrderModel value, $Res Function(_$_OrderModel) then) =
      __$$_OrderModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? orderId,
      int? customerId,
      String? customerName,
      String? positionCode,
      List<Map<String, dynamic>> orderedAvailableItemModelList,
      List<dynamic>? additionalOrderList,
      List<dynamic>? runningOrderList,
      OrderType? orderType,
      int? totalItems,
      int? totalQty,
      double? totalAmount,
      DateTime? orderedTime,
      bool? isPaid,
      bool? isTakeNow,
      bool? isOrderConfirmed,
      String? customerFeadback,
      String? customerSuggession,
      bool? recievedAllItems,
      bool? itemsReady,
      bool? orderDelevered});
}

/// @nodoc
class __$$_OrderModelCopyWithImpl<$Res>
    extends _$OrderModelCopyWithImpl<$Res, _$_OrderModel>
    implements _$$_OrderModelCopyWith<$Res> {
  __$$_OrderModelCopyWithImpl(
      _$_OrderModel _value, $Res Function(_$_OrderModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = freezed,
    Object? customerId = freezed,
    Object? customerName = freezed,
    Object? positionCode = freezed,
    Object? orderedAvailableItemModelList = null,
    Object? additionalOrderList = freezed,
    Object? runningOrderList = freezed,
    Object? orderType = freezed,
    Object? totalItems = freezed,
    Object? totalQty = freezed,
    Object? totalAmount = freezed,
    Object? orderedTime = freezed,
    Object? isPaid = freezed,
    Object? isTakeNow = freezed,
    Object? isOrderConfirmed = freezed,
    Object? customerFeadback = freezed,
    Object? customerSuggession = freezed,
    Object? recievedAllItems = freezed,
    Object? itemsReady = freezed,
    Object? orderDelevered = freezed,
  }) {
    return _then(_$_OrderModel(
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int?,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int?,
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      positionCode: freezed == positionCode
          ? _value.positionCode
          : positionCode // ignore: cast_nullable_to_non_nullable
              as String?,
      orderedAvailableItemModelList: null == orderedAvailableItemModelList
          ? _value._orderedAvailableItemModelList
          : orderedAvailableItemModelList // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      additionalOrderList: freezed == additionalOrderList
          ? _value._additionalOrderList
          : additionalOrderList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      runningOrderList: freezed == runningOrderList
          ? _value._runningOrderList
          : runningOrderList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      orderType: freezed == orderType
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as OrderType?,
      totalItems: freezed == totalItems
          ? _value.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int?,
      totalQty: freezed == totalQty
          ? _value.totalQty
          : totalQty // ignore: cast_nullable_to_non_nullable
              as int?,
      totalAmount: freezed == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      orderedTime: freezed == orderedTime
          ? _value.orderedTime
          : orderedTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isPaid: freezed == isPaid
          ? _value.isPaid
          : isPaid // ignore: cast_nullable_to_non_nullable
              as bool?,
      isTakeNow: freezed == isTakeNow
          ? _value.isTakeNow
          : isTakeNow // ignore: cast_nullable_to_non_nullable
              as bool?,
      isOrderConfirmed: freezed == isOrderConfirmed
          ? _value.isOrderConfirmed
          : isOrderConfirmed // ignore: cast_nullable_to_non_nullable
              as bool?,
      customerFeadback: freezed == customerFeadback
          ? _value.customerFeadback
          : customerFeadback // ignore: cast_nullable_to_non_nullable
              as String?,
      customerSuggession: freezed == customerSuggession
          ? _value.customerSuggession
          : customerSuggession // ignore: cast_nullable_to_non_nullable
              as String?,
      recievedAllItems: freezed == recievedAllItems
          ? _value.recievedAllItems
          : recievedAllItems // ignore: cast_nullable_to_non_nullable
              as bool?,
      itemsReady: freezed == itemsReady
          ? _value.itemsReady
          : itemsReady // ignore: cast_nullable_to_non_nullable
              as bool?,
      orderDelevered: freezed == orderDelevered
          ? _value.orderDelevered
          : orderDelevered // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderModel implements _OrderModel {
  const _$_OrderModel(
      {this.orderId,
      this.customerId,
      this.customerName,
      this.positionCode,
      required final List<Map<String, dynamic>> orderedAvailableItemModelList,
      final List<dynamic>? additionalOrderList,
      final List<dynamic>? runningOrderList,
      this.orderType,
      this.totalItems,
      this.totalQty,
      this.totalAmount,
      this.orderedTime,
      this.isPaid,
      this.isTakeNow,
      this.isOrderConfirmed,
      this.customerFeadback,
      this.customerSuggession,
      this.recievedAllItems,
      this.itemsReady,
      this.orderDelevered})
      : _orderedAvailableItemModelList = orderedAvailableItemModelList,
        _additionalOrderList = additionalOrderList,
        _runningOrderList = runningOrderList;

  factory _$_OrderModel.fromJson(Map<String, dynamic> json) =>
      _$$_OrderModelFromJson(json);

  @override
  final int? orderId;
  @override
  final int? customerId;
  @override
  final String? customerName;
  @override
  final String? positionCode;
  final List<Map<String, dynamic>> _orderedAvailableItemModelList;
  @override
  List<Map<String, dynamic>> get orderedAvailableItemModelList {
    if (_orderedAvailableItemModelList is EqualUnmodifiableListView)
      return _orderedAvailableItemModelList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderedAvailableItemModelList);
  }

  final List<dynamic>? _additionalOrderList;
  @override
  List<dynamic>? get additionalOrderList {
    final value = _additionalOrderList;
    if (value == null) return null;
    if (_additionalOrderList is EqualUnmodifiableListView)
      return _additionalOrderList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _runningOrderList;
  @override
  List<dynamic>? get runningOrderList {
    final value = _runningOrderList;
    if (value == null) return null;
    if (_runningOrderList is EqualUnmodifiableListView)
      return _runningOrderList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final OrderType? orderType;
  @override
  final int? totalItems;
  @override
  final int? totalQty;
  @override
  final double? totalAmount;
  @override
  final DateTime? orderedTime;
  @override
  final bool? isPaid;
  @override
  final bool? isTakeNow;
  @override
  final bool? isOrderConfirmed;
  @override
  final String? customerFeadback;
  @override
  final String? customerSuggession;
  @override
  final bool? recievedAllItems;
  @override
  final bool? itemsReady;
  @override
  final bool? orderDelevered;

  @override
  String toString() {
    return 'OrderModel(orderId: $orderId, customerId: $customerId, customerName: $customerName, positionCode: $positionCode, orderedAvailableItemModelList: $orderedAvailableItemModelList, additionalOrderList: $additionalOrderList, runningOrderList: $runningOrderList, orderType: $orderType, totalItems: $totalItems, totalQty: $totalQty, totalAmount: $totalAmount, orderedTime: $orderedTime, isPaid: $isPaid, isTakeNow: $isTakeNow, isOrderConfirmed: $isOrderConfirmed, customerFeadback: $customerFeadback, customerSuggession: $customerSuggession, recievedAllItems: $recievedAllItems, itemsReady: $itemsReady, orderDelevered: $orderDelevered)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderModel &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.positionCode, positionCode) ||
                other.positionCode == positionCode) &&
            const DeepCollectionEquality().equals(
                other._orderedAvailableItemModelList,
                _orderedAvailableItemModelList) &&
            const DeepCollectionEquality()
                .equals(other._additionalOrderList, _additionalOrderList) &&
            const DeepCollectionEquality()
                .equals(other._runningOrderList, _runningOrderList) &&
            (identical(other.orderType, orderType) ||
                other.orderType == orderType) &&
            (identical(other.totalItems, totalItems) ||
                other.totalItems == totalItems) &&
            (identical(other.totalQty, totalQty) ||
                other.totalQty == totalQty) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.orderedTime, orderedTime) ||
                other.orderedTime == orderedTime) &&
            (identical(other.isPaid, isPaid) || other.isPaid == isPaid) &&
            (identical(other.isTakeNow, isTakeNow) ||
                other.isTakeNow == isTakeNow) &&
            (identical(other.isOrderConfirmed, isOrderConfirmed) ||
                other.isOrderConfirmed == isOrderConfirmed) &&
            (identical(other.customerFeadback, customerFeadback) ||
                other.customerFeadback == customerFeadback) &&
            (identical(other.customerSuggession, customerSuggession) ||
                other.customerSuggession == customerSuggession) &&
            (identical(other.recievedAllItems, recievedAllItems) ||
                other.recievedAllItems == recievedAllItems) &&
            (identical(other.itemsReady, itemsReady) ||
                other.itemsReady == itemsReady) &&
            (identical(other.orderDelevered, orderDelevered) ||
                other.orderDelevered == orderDelevered));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        orderId,
        customerId,
        customerName,
        positionCode,
        const DeepCollectionEquality().hash(_orderedAvailableItemModelList),
        const DeepCollectionEquality().hash(_additionalOrderList),
        const DeepCollectionEquality().hash(_runningOrderList),
        orderType,
        totalItems,
        totalQty,
        totalAmount,
        orderedTime,
        isPaid,
        isTakeNow,
        isOrderConfirmed,
        customerFeadback,
        customerSuggession,
        recievedAllItems,
        itemsReady,
        orderDelevered
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderModelCopyWith<_$_OrderModel> get copyWith =>
      __$$_OrderModelCopyWithImpl<_$_OrderModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderModelToJson(
      this,
    );
  }
}

abstract class _OrderModel implements OrderModel {
  const factory _OrderModel(
      {final int? orderId,
      final int? customerId,
      final String? customerName,
      final String? positionCode,
      required final List<Map<String, dynamic>> orderedAvailableItemModelList,
      final List<dynamic>? additionalOrderList,
      final List<dynamic>? runningOrderList,
      final OrderType? orderType,
      final int? totalItems,
      final int? totalQty,
      final double? totalAmount,
      final DateTime? orderedTime,
      final bool? isPaid,
      final bool? isTakeNow,
      final bool? isOrderConfirmed,
      final String? customerFeadback,
      final String? customerSuggession,
      final bool? recievedAllItems,
      final bool? itemsReady,
      final bool? orderDelevered}) = _$_OrderModel;

  factory _OrderModel.fromJson(Map<String, dynamic> json) =
      _$_OrderModel.fromJson;

  @override
  int? get orderId;
  @override
  int? get customerId;
  @override
  String? get customerName;
  @override
  String? get positionCode;
  @override
  List<Map<String, dynamic>> get orderedAvailableItemModelList;
  @override
  List<dynamic>? get additionalOrderList;
  @override
  List<dynamic>? get runningOrderList;
  @override
  OrderType? get orderType;
  @override
  int? get totalItems;
  @override
  int? get totalQty;
  @override
  double? get totalAmount;
  @override
  DateTime? get orderedTime;
  @override
  bool? get isPaid;
  @override
  bool? get isTakeNow;
  @override
  bool? get isOrderConfirmed;
  @override
  String? get customerFeadback;
  @override
  String? get customerSuggession;
  @override
  bool? get recievedAllItems;
  @override
  bool? get itemsReady;
  @override
  bool? get orderDelevered;
  @override
  @JsonKey(ignore: true)
  _$$_OrderModelCopyWith<_$_OrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}
