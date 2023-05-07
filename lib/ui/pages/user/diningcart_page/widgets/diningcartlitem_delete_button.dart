import 'package:cafemenu_app/core/model/available_item/available_item_model.dart';
import 'package:cafemenu_app/core/provider/bloc/diningcart_page/diningcart_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// this widget for delete item from diningCartList
class DiningcartListItemDeleteButton extends StatelessWidget {
  const DiningcartListItemDeleteButton({
    super.key,
    required this.diningCartItem,
  });

  final AvailableItemModel diningCartItem;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // cart item delete button pressed
        /// rebuild diningCartListView
        BlocProvider.of<DiningcartPageBloc>(context)
            .add(DiningCartButtonPressed(
          diningCartButtonType: null,
          isReTakeDiningCart: true,
          diningCartItemForDelete: diningCartItem,
        ));BlocProvider.of<DiningcartPageBloc>(context)
            .add(const EditTotalSection());
      },
      child: Icon(
        Icons.delete,
        color: Colors.red.withOpacity(0.7),
      ),
    );
  }
}
