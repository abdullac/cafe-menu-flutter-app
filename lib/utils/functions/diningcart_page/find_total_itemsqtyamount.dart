import 'package:cafemenu_app/utils/constants/lists.dart';

Map<String, dynamic> findTotalitemsQtyAmount() {
  Map<String, dynamic> findTotalItemsQtyAmountTemp = {
    "items": 0,
    "Qty": 0,
    "amount": 0.0,
  };
  findTotalItemsQtyAmountTemp["items"] = diningCartList.length;
  print(
      "findTotalItemsQtyAmountTemp['items'] ${findTotalItemsQtyAmountTemp["items"]}");
  diningCartList.forEach((element) {
    if (element.orderedQty != null) {
      findTotalItemsQtyAmountTemp["Qty"] += element.orderedQty!;
      if (element.itemPrice != null) {
        findTotalItemsQtyAmountTemp["amount"] +=
            (element.orderedQty!).toDouble() * (element.itemPrice!);
      }
    }
  });
  return findTotalItemsQtyAmountTemp;
}
