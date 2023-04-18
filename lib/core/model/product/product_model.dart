import 'package:freezed_annotation/freezed_annotation.dart';
part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    required int? itemId,
    required String? itemName,
    int? serialNumber,
    String? verticalImageUrl,
    String? horizontalImageUrl,
    String? defualtImageUrl,
    required String? categoryName,
    required double? itemPrice,
    int? orderedQty,
    DateTime? recievedTime,
    bool? isDiningCart,
    required ItemType? itemType,
    required int? availableQty,
    int? leftQty,
    bool? isClosed,
    bool? isSelectDiningCart,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}

enum ItemType {
  plate,
  glass,
}


/// customerSuggession - customer needs/required with order