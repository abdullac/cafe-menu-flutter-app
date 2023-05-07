import 'package:cafemenu_app/core/provider/bloc/diningcart_page/diningcart_page_bloc.dart';
import 'package:cafemenu_app/utils/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// this is button widget for  takeNow order or confirmOrder
class DiningCartButton extends StatelessWidget {
  const DiningCartButton({
    super.key,
  });

  static DiningCartButtonFunctionality? diningCartButtonType;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiningcartPageBloc, DiningcartPageState>(
      builder: (context, state) {
        diningCartButtonType =state.diningCartButtonType;
        return ElevatedButton(
          onPressed: () {
            // DiningCartPage button pressed
            BlocProvider.of<DiningcartPageBloc>(context).add(
                DiningCartButtonPressed(
                    diningCartButtonType: state.diningCartButtonType));
          },
              /// button text.
              ///change button text when changed button functionalty.
          child: Text(state.diningCartButtonText),
        );
      },
    );
  }
}
