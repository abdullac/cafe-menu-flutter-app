import 'package:cafemenu_app/core/model/order/order_model.dart';
import 'package:cafemenu_app/ui/pages/user/diningcart_page/sections/customername_and_chairnumber.dart';
import 'package:cafemenu_app/utils/constants/enums.dart';
import 'package:cafemenu_app/utils/constants/lists.dart';
import 'package:cafemenu_app/utils/constants/values.dart';
import 'package:cafemenu_app/utils/functions/user/diningcart_page/find_total_itemsqtyamount.dart';
import 'package:cafemenu_app/utils/functions/user/diningcart_page/set_customer_id.dart';

/// method for make json of orderModel
Map<String, dynamic> createOrderModelJson() {
  /// iter diningCartList and convert to json each diningCartItem
  /// for assign OrderList before save to firebase database.
  final diningCartitemJsonList = diningCartList.map((diningCartItem) {
    return diningCartItem.toJson();
  }).toList();

  /// gettotal items,Quantity, amount for assin to
  /// orderModel before save to firebase database.
  final totalItemsQtyAmount = findTotalItemsQtyAmount();

  /// convet orderModel to json for save to firebase database.
  OrderModel orderModel = OrderModel(
      orderedAvailableItemModelList: diningCartitemJsonList,
      customerId: setCustometId(),
      customerName: NameAndPositionCode.customerNameEditingController.text,
      isTakeNow: true,
      isOrderConfirmed: true,
      orderId: orderId,
      orderedTime: orderedTime,
      totalItems: totalItemsQtyAmount["items"],
      totalQty: totalItemsQtyAmount["Qty"],
      totalAmount: totalItemsQtyAmount["amount"],
      // positionCode: NameAndPositionCode.tableOrChairNumberNotifier.value,
      positionCode: NameAndPositionCode.positionCode,
      orderType: OrderType.order);

  /// return orderModel json.
  return orderModel.toJson();
}
