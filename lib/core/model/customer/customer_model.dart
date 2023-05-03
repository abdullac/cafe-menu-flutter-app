import 'package:freezed_annotation/freezed_annotation.dart';
part 'customer_model.freezed.dart';
part 'customer_model.g.dart';

/// orderModel
@freezed
class OrderModel with _$OrderModel {
  const factory OrderModel(
      {int? orderId,
      int? customerId,
      String? customerName,
      String? positionCode,
      required List<Map<String, dynamic>> orderedAvailableItemModelList,
      /// orderedAvailableItemModelList
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
      bool? orderDelevered}) = _CustomerModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}

enum OrderType {
  order,
  additionalOrder,
  runningOrder,
}
