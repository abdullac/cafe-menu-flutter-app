import 'package:freezed_annotation/freezed_annotation.dart';
part 'available_item_model.freezed.dart';
part 'available_item_model.g.dart';

@freezed
class AvailableItemModel with _$AvailableItemModel {
  const factory AvailableItemModel({
    required int? itemId,
    required String? itemName,
    int? serialNumber,
    String? verticalImageUrl,
    // String? horizontalImageUrl,
    // String? defualtImageUrl,
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
    bool? itemReady,
    bool? itemDelevered,
    String? infoToCustomer,
  }) = _AvailableItemModel;

  factory AvailableItemModel.fromJson(Map<String, dynamic> json) =>
      _$AvailableItemModelFromJson(json);
}

enum ItemType {
  plate,
  glass,
}


/// customerSuggession - customer needs/required with order