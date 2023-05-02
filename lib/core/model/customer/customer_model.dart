import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'customer_model.freezed.dart';
part 'customer_model.g.dart';

/// orderModel
@freezed
class CustomerModel with _$CustomerModel {
  const factory CustomerModel({
    int? orderId,
    int? customerId,
    String? customerName,
    String? positionCode,
    required List<Map<String, dynamic>> productModelOrderList,
    /// availableItemModelOrderedItemsList
    List? additionalOrderList,
    List? runningOrderList,
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
    bool? orderDelevered
  }) = _CustomerModel;

  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);
}

enum OrderType {
  order,
  additionalOrder,
  runningOrder,
}
  