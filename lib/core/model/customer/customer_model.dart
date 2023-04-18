import 'package:cafemenu_app/core/model/product/product_model.dart';
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
    required List<Map<String, dynamic>> productModelOrderList,
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
  }) = _CustomerModel;

  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);
}

enum OrderType {
  order,
  additionalOrder,
  runningOrder,
}
  