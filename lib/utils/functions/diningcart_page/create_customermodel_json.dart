import 'package:cafemenu_app/core/model/customer/customer_model.dart';
import 'package:cafemenu_app/ui/pages/user/diningcart_page/page_diningcart.dart';
import 'package:cafemenu_app/ui/pages/user/diningcart_page/sections/customername_and_chairnumber.dart';
import 'package:cafemenu_app/ui/pages/user/diningcart_page/sections/total_items_qty_amount.dart';
import 'package:cafemenu_app/utils/constants/lists.dart';
import 'package:cafemenu_app/utils/constants/values.dart';
import 'package:cafemenu_app/utils/functions/diningcart_page/set_customer_id.dart';

Map<String, dynamic> createCustemerModelJson() {
  final diningCartitemJsonList = diningCartList.map((e) {
    return e.toJson();
  }).toList();
  final totalItemsQtyAmount = TotalItemQtyAmount.diningCartTotalNotifier.value;
  CustomerModel customerModel = CustomerModel(
      productModelOrderList: diningCartitemJsonList,
      customerId: setCustometId(),
      customerName: NameChairNumber.customerNameEditingController.text,
      isTakeNow: true,
      isOrderConfirmed: true,
      orderId: orderId,
      orderedTime: orderedTime,
      totalItems: totalItemsQtyAmount["items"],
      totalQty: totalItemsQtyAmount["Qty"],
      totalAmount: totalItemsQtyAmount["amount"],
      positionCode: NameChairNumber.tableOrChairNumberNotifier.value,
      orderType: OrderType.order);
  return customerModel.toJson();
}
