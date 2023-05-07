// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderModel _$$_OrderModelFromJson(Map<String, dynamic> json) =>
    _$_OrderModel(
      orderId: json['orderId'] as int?,
      customerId: json['customerId'] as int?,
      customerName: json['customerName'] as String?,
      positionCode: json['positionCode'] as String?,
      orderedAvailableItemModelList:
          (json['orderedAvailableItemModelList'] as List<dynamic>)
              .map((e) => e as Map<String, dynamic>)
              .toList(),
      additionalOrderList: json['additionalOrderList'] as List<dynamic>?,
      runningOrderList: json['runningOrderList'] as List<dynamic>?,
      orderType: $enumDecodeNullable(_$OrderTypeEnumMap, json['orderType']),
      totalItems: json['totalItems'] as int?,
      totalQty: json['totalQty'] as int?,
      totalAmount: (json['totalAmount'] as num?)?.toDouble(),
      orderedTime: json['orderedTime'] == null
          ? null
          : DateTime.parse(json['orderedTime'] as String),
      isPaid: json['isPaid'] as bool?,
      isTakeNow: json['isTakeNow'] as bool?,
      isOrderConfirmed: json['isOrderConfirmed'] as bool?,
      customerFeadback: json['customerFeadback'] as String?,
      customerSuggession: json['customerSuggession'] as String?,
      recievedAllItems: json['recievedAllItems'] as bool?,
      itemsReady: json['itemsReady'] as bool?,
      orderDelevered: json['orderDelevered'] as bool?,
    );

Map<String, dynamic> _$$_OrderModelToJson(_$_OrderModel instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'customerId': instance.customerId,
      'customerName': instance.customerName,
      'positionCode': instance.positionCode,
      'orderedAvailableItemModelList': instance.orderedAvailableItemModelList,
      'additionalOrderList': instance.additionalOrderList,
      'runningOrderList': instance.runningOrderList,
      'orderType': _$OrderTypeEnumMap[instance.orderType],
      'totalItems': instance.totalItems,
      'totalQty': instance.totalQty,
      'totalAmount': instance.totalAmount,
      'orderedTime': instance.orderedTime?.toIso8601String(),
      'isPaid': instance.isPaid,
      'isTakeNow': instance.isTakeNow,
      'isOrderConfirmed': instance.isOrderConfirmed,
      'customerFeadback': instance.customerFeadback,
      'customerSuggession': instance.customerSuggession,
      'recievedAllItems': instance.recievedAllItems,
      'itemsReady': instance.itemsReady,
      'orderDelevered': instance.orderDelevered,
    };

const _$OrderTypeEnumMap = {
  OrderType.order: 'order',
  OrderType.additionalOrder: 'additionalOrder',
  OrderType.runningOrder: 'runningOrder',
};
