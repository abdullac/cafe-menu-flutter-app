// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductModel _$$_ProductModelFromJson(Map<String, dynamic> json) =>
    _$_ProductModel(
      itemId: json['itemId'] as int?,
      itemName: json['itemName'] as String?,
      serialNumber: json['serialNumber'] as int?,
      verticalImageUrl: json['verticalImageUrl'] as String?,
      horizontalImageUrl: json['horizontalImageUrl'] as String?,
      defualtImageUrl: json['defualtImageUrl'] as String?,
      categoryName: json['categoryName'] as String?,
      itemPrice: (json['itemPrice'] as num?)?.toDouble(),
      orderedQty: json['orderedQty'] as int?,
      recievedTime: json['recievedTime'] == null
          ? null
          : DateTime.parse(json['recievedTime'] as String),
      isDiningCart: json['isDiningCart'] as bool?,
      itemType: $enumDecodeNullable(_$ItemTypeEnumMap, json['itemType']),
      availableQty: json['availableQty'] as int?,
      leftQty: json['leftQty'] as int?,
      isClosed: json['isClosed'] as bool?,
    );

Map<String, dynamic> _$$_ProductModelToJson(_$_ProductModel instance) =>
    <String, dynamic>{
      'itemId': instance.itemId,
      'itemName': instance.itemName,
      'serialNumber': instance.serialNumber,
      'verticalImageUrl': instance.verticalImageUrl,
      'horizontalImageUrl': instance.horizontalImageUrl,
      'defualtImageUrl': instance.defualtImageUrl,
      'categoryName': instance.categoryName,
      'itemPrice': instance.itemPrice,
      'orderedQty': instance.orderedQty,
      'recievedTime': instance.recievedTime?.toIso8601String(),
      'isDiningCart': instance.isDiningCart,
      'itemType': _$ItemTypeEnumMap[instance.itemType],
      'availableQty': instance.availableQty,
      'leftQty': instance.leftQty,
      'isClosed': instance.isClosed,
    };

const _$ItemTypeEnumMap = {
  ItemType.plate: 'plate',
  ItemType.glass: 'glass',
};
