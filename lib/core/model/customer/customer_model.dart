import 'package:freezed_annotation/freezed_annotation.dart';
part 'customer_model.freezed.dart';
part 'customer_model.g.dart';

@freezed
class CustomerModel with _$CustomerModel {
  const factory CustomerModel({
    int? customerId,
    String? customerName,
    int? orderNumber,
    String? positionCode,
    required List orderList,
    List? additionalOrderList,
    List? runningOrderList,
    OrderType? orderType,
    int? totalItems,
    int? totalQty,
    int? totalAmount,
    DateTime? orderedTime,
    bool? isPaid,
    bool? isTakeNow,
  }) = _CustomerModel;

  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);
}

enum OrderType {
  order,
  additionalOrder,
  runningOrder,
}
