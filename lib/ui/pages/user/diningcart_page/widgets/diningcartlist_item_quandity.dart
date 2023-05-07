
import 'package:cafemenu_app/core/model/available_item/available_item_model.dart';
import 'package:cafemenu_app/core/provider/bloc/diningcart_page/diningcart_page_bloc.dart';
import 'package:cafemenu_app/ui/shared/widgets/set_qty_section.dart';
import 'package:cafemenu_app/utils/functions/user/diningcart_page/item_from_diningcartlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// this widget is show and set item quantity
class DiningcartListItemQty extends StatelessWidget {
  DiningcartListItemQty({
    super.key,
    required this.diningCartItem,
    required this.setQtyNotifier,
    required this.itemIndex,
    // required this.isSelectNotifier,
  });

  /// for update diningCartItem when press increase or decrease button
  final AvailableItemModel diningCartItem;

  /// for change Qty value/text
  final ValueNotifier<int?> setQtyNotifier;

  /// for unSelect or selsect automatically when decrease to 0 or increase from 0.
  final int itemIndex;
  bool isSelectedCheckBox = true;
  @override
  Widget build(BuildContext context) {
    AvailableItemModel newDiningCartItem =
        pickAvailableItemFromDiningCartList(diningCartItem.itemId) ??
            diningCartItem;
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// show and set item quantity widget
          BlocBuilder<DiningcartPageBloc, DiningcartPageState>(
            builder: (context, state) {
              if (state.itemIndex == itemIndex) {
                isSelectedCheckBox = state.isSelected;
              }
              return isSelectedCheckBox == true
                  ? SetQtySetion(
                      valueNotifier: setQtyNotifier,
                      availableItem: newDiningCartItem,
                      removeitemAtQty0: false,
                      onIncreasePressed: () {
                        /// additional method for onIncreaseButton pressed.
                        if (newDiningCartItem.isSelectDiningCart == false) {
                          selectCheckboxBlocProvider(
                            context: context,
                            diningCartItem: newDiningCartItem,
                            isSelect: true,
                            itemIndex: itemIndex,
                          );
                        }

                        diningCartQtyButtonAdditional(context);
                      },
                      onDecreasePressed: () {
                        /// additional method for onDecreaseButton pressed.
                        if (diningCartItem.isSelectDiningCart == false) {
                          selectCheckboxBlocProvider(
                            context: context,
                            diningCartItem: newDiningCartItem,
                            isSelect: true,
                            itemIndex: itemIndex,
                          );
                        }
                        diningCartQtyButtonAdditional(context);
                      },
                    )
                  : const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}

selectCheckboxBlocProvider(
    {required BuildContext context,
    required AvailableItemModel diningCartItem,
    required bool? isSelect,
    required int itemIndex}) {
  /// BlocProvider for change isSelect CheckBox UI and functionality
  BlocProvider.of<DiningcartPageBloc>(context).add(
    UserClickedCheckbox(
      diningCartItem: diningCartItem,
      itemIndex: itemIndex,
    ),
  );
}

diningCartQtyButtonAdditional(BuildContext context) {
  /// BlocProvider for EditTotalSection
  BlocProvider.of<DiningcartPageBloc>(context).add(const EditTotalSection());

  /// blocProvider for rebuild DiningCart Listview and name positionCode
  BlocProvider.of<DiningcartPageBloc>(context)
      .add(const DiningCartButtonPressed(
    diningCartButtonType: null,
    isReTakeDiningCart: true,
  ));
}
