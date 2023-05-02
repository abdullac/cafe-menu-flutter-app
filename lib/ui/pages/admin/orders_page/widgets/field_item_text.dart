import 'package:flutter/material.dart';

/// this is refactered widget for orderedListvie item builder child texts(ordered item details)
class FieldItemText extends StatelessWidget {
  final int flex;
  final String fieldText;
  final bool? isBold;
  const FieldItemText({
    super.key,
    required this.flex,
    required this.fieldText,
    this.isBold,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: flex,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            fieldText,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: isBold == true ? FontWeight.bold : FontWeight.w400),
          ),
        ));
  }
}
