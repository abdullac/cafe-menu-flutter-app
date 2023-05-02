import 'package:cafemenu_app/ui/pages/admin/orders_page/widgets/field_item_text.dart';
import 'package:flutter/material.dart';

/// this is hardcoded order item heading
/// for shows top of order items list
class OrderItemHeadings extends StatelessWidget {
  const OrderItemHeadings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        FieldItemText(flex: 10, fieldText: "Item\nId", isBold: true),
        FieldItemText(flex: 25, fieldText: "Item\nName", isBold: true),
        FieldItemText(flex: 20, fieldText: "Category\nName", isBold: true),
        FieldItemText(flex: 15, fieldText: "Ordered\nQuantity", isBold: true),
        FieldItemText(flex: 15, fieldText: "Item\nType", isBold: true),
        FieldItemText(flex: 15, fieldText: "Item\nAction", isBold: true),
      ],
    );
  }
}
