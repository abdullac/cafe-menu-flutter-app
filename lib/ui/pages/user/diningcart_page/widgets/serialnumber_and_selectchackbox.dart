import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/utils/functions/user/diningcart_page/select_unselect_item.dart';
import 'package:flutter/material.dart';

/// this widget shows serial number and isSelect checkBox
class DiningcartListItemSerialNumberAndIsSelectCheckBox
    extends StatelessWidget {
  const DiningcartListItemSerialNumberAndIsSelectCheckBox({
    super.key,
    required this.index,
    required this.diningCartItem,
    required this.diningCartItemsList,
    required this.isSelectNotifier,
  });

  final int index;
  final AvailableItemModel diningCartItem;
  final List<AvailableItemModel> diningCartItemsList;
  final ValueNotifier<bool?> isSelectNotifier;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.red.withOpacity(0.5),
            shape: BoxShape.circle,
          ),

          /// serial number
          child: Text("${index + 1}"),
        ),

        /// is diningCarlList item isSelect
        ValueListenableBuilder(
          valueListenable: isSelectNotifier,
          builder: (context, newValue, _) {
            /// isSelect chechbox
            return Checkbox(
              fillColor: MaterialStateProperty.all(Colors.red.withOpacity(0.2)),
              checkColor: Colors.red,
              value: newValue,
              onChanged: (isSelect) {
                // checkbox onChanged (select unselect)
                selectOrUnselectItem(
                  diningCartItem: diningCartItem,
                  isSelect: isSelect,
                  isSelectNotifier: isSelectNotifier,
                );
              },
              shape: const CircleBorder(),
            );
          },
        ),
      ],
    );
  }
}
