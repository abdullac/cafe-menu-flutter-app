
import 'package:cafemenu_app/core/model/available_item/available_item_model.dart';
import 'package:cafemenu_app/core/provider/bloc/diningcart_page/diningcart_page_bloc.dart';
import 'package:cafemenu_app/utils/functions/user/diningcart_page/item_from_diningcartlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// this widget shows serial number and isSelect checkBox
class DiningcartListItemSerialNumberAndIsSelectCheckBox
    extends StatelessWidget {
  const DiningcartListItemSerialNumberAndIsSelectCheckBox({
    super.key,
    required this.index,
    required this.diningCartItem,
    required this.diningCartItemsList,
  });

  final int index;
  final AvailableItemModel diningCartItem;
  final List<AvailableItemModel> diningCartItemsList;

  @override
  Widget build(BuildContext context) {
    var isSelectValue = diningCartItemsList[index].isSelectDiningCart ?? true;
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

        /// isSelect chechbox
        BlocBuilder<DiningcartPageBloc, DiningcartPageState>(
            builder: (context, state) {
          if (state.itemIndex == index) {
            isSelectValue = state.isSelected;
          }
          return Checkbox(
            fillColor: MaterialStateProperty.all(Colors.red.withOpacity(0.2)),
            checkColor: Colors.red,
            value: isSelectValue,
            onChanged: (isSelect) {
              // checkbox onChanged (select unselect)
              BlocProvider.of<DiningcartPageBloc>(context).add(
                UserClickedCheckbox(
                  diningCartItem: pickAvailableItemFromDiningCartList(
                          diningCartItem.itemId) ??
                      diningCartItem,
                  itemIndex: index,
                ),
              );
        BlocProvider.of<DiningcartPageBloc>(context).add(const EditTotalSection());
            },
            shape: const CircleBorder(),
          );
        }),
      ],
    );
  }
}
