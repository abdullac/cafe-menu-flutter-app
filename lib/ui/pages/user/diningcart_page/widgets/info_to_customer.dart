import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:flutter/material.dart';

/// thi widget for any information to customer/user such as item quanity warnimg
class InfoToCustomer extends StatelessWidget {
  final AvailableItemModel diningCartItem;
  const InfoToCustomer({
    super.key,
    required this.diningCartItem,
  });

  @override
  Widget build(BuildContext context) {
    /// info text
    return Text(
      diningCartItem.infoToCustomer ?? "",
      style: const TextStyle(fontSize: 10, color: Colors.red),
    );
  }
}
