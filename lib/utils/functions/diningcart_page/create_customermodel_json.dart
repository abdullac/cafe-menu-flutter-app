import 'package:cafemenu_app/core/model/customer/customer_model.dart';
import 'package:cafemenu_app/ui/pages/user/diningcart_page/sections/customername_and_chairnumber.dart';
import 'package:cafemenu_app/ui/pages/user/diningcart_page/sections/total_items_qty_amount.dart';
import 'package:cafemenu_app/utils/constants/lists.dart';
import 'package:cafemenu_app/utils/constants/values.dart';
import 'package:cafemenu_app/utils/functions/diningcart_page/set_customer_id.dart';

/// method for make json of orderModel
Map<String, dynamic> createOrderModelJson() {
  /// iter diningCartList and convert to json each diningCartItem
  /// for assign OrderList before save to firebase database.
  final diningCartitemJsonList = diningCartList.map((diningCartItem) {
    return diningCartItem.toJson();
  }).toList();

  /// gettotal items,Quantity, amount for assin to
  /// orderModel before save to firebase database.
  final totalItemsQtyAmount = TotalItemQtyAmount.diningCartTotalNotifier.value;

  /// convet orderModel to json for save to firebase database.
  CustomerModel orderModel = CustomerModel(
      productModelOrderList: diningCartitemJsonList,
      customerId: setCustometId(),
      customerName: NameAndPositionCode.customerNameEditingController.text,
      isTakeNow: true,
      isOrderConfirmed: true,
      orderId: orderId,
      orderedTime: orderedTime,
      totalItems: totalItemsQtyAmount["items"],
      totalQty: totalItemsQtyAmount["Qty"],
      totalAmount: totalItemsQtyAmount["amount"],
      positionCode: NameAndPositionCode.tableOrChairNumberNotifier.value,
      orderType: OrderType.order);
      /// return orderModel json.
  return orderModel.toJson();
}
