// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CustomerModel _$$_CustomerModelFromJson(Map<String, dynamic> json) =>
    _$_CustomerModel(
      customerId: json['customerId'] as int?,
      customerName: json['customerName'] as String?,
      orderNumber: json['orderNumber'] as int?,
      positionCode: json['positionCode'] as String?,
      productModelOrderList: (json['productModelOrderList'] as List<dynamic>)
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
    );

Map<String, dynamic> _$$_CustomerModelToJson(_$_CustomerModel instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'customerName': instance.customerName,
      'orderNumber': instance.orderNumber,
      'positionCode': instance.positionCode,
      'productModelOrderList': instance.productModelOrderList,
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
    };

const _$OrderTypeEnumMap = {
  OrderType.order: 'order',
  OrderType.additionalOrder: 'additionalOrder',
  OrderType.runningOrder: 'runningOrder',
};
