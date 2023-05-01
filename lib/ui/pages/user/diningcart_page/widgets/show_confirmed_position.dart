import 'package:cafemenu_app/ui/pages/user/diningcart_page/sections/customername_and_chairnumber.dart';
import 'package:cafemenu_app/utils/constants/values.dart';
import 'package:flutter/material.dart';

/// this widget shows customer name and position Code after press confirmed button
class ShowConfirmedNameAndPosition extends StatelessWidget {
  const ShowConfirmedNameAndPosition({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// customer name
        Text(NameAndPositionCode.customerNameEditingController.text),
        /// position code
        Text("Position : ${positionCode ?? '..'}"),
      ],
    );
  }
}
