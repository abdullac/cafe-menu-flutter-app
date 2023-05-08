
import 'package:cafemenu_app/core/provider/bloc/diningcart_page/diningcart_page_bloc.dart';
import 'package:cafemenu_app/ui/pages/user/diningcart_page/widgets/show_confirmed_position.dart';
import 'package:cafemenu_app/utils/constants/enums.dart';
import 'package:cafemenu_app/utils/constants/values.dart';
import 'package:cafemenu_app/core/provider/logics/user/diningcart_page/dropdownmenu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// this widget shows customer name and Position code
class NameAndPositionCode extends StatelessWidget {
  const NameAndPositionCode({
    super.key,
  });

  /// editing controller for customer name textField.
  static TextEditingController customerNameEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiningcartPageBloc, DiningcartPageState>(
      builder: (context, state) {
        return state.diningCartButtonType == null
            ? const SizedBox()

            /// show ShowConfirmedPosition widget if pressed Order confirmed button.
            : state.diningCartButtonType ==
                        DiningCartButtonFunctionality.orderConfirm 
                ? const ShowConfirmedNameAndPosition()

                /// show NameAndPositionCode(Name textField, positionCode dropdownButtons) widget
                /// if takeNow button pressed.
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),

                        /// customer name textFieald
                        child: TextField(
                          controller: customerNameEditingController,
                          decoration: const InputDecoration(
                            hintText: "Name:",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),

                      /// BlocBuilder for rebuild dropdown button when change value.
                      BlocBuilder<DiningcartPageBloc, DiningcartPageState>(
                        builder: (context, state) {
                          if (!["-1", null]
                              .contains(state.positionNumberValue)) {
                            positionCode = state.positionNumberValue;
                          }
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              /// PositionCode drop down Buttons
                              const Text("Position Code: "),

                              /// positinCode, positionType Chair Or Table drop down button.
                              DropdownButton(
                                value: state.positionTypeValue,
                                items: const <DropdownMenuItem<dynamic>>[
                                  DropdownMenuItem(
                                    value: null,
                                    child: Text("-Select-"),
                                  ),
                                  DropdownMenuItem(
                                    value: PositionType.table,
                                    child: Text("Table"),
                                  ),
                                  DropdownMenuItem(
                                    value: PositionType.chair,
                                    child: Text("Chair"),
                                  ),
                                ],
                                onChanged: (value) {
                                  // dropdown item changed
                                  /// table or chair changed value assign to notifier.
                                  BlocProvider.of<DiningcartPageBloc>(context)
                                      .add(ChangePositionType(
                                          changedPositionTypeValue: value));
                                  BlocProvider.of<DiningcartPageBloc>(context)
                                      .add(ChangePositionNumber(
                                          changedPositionNumberValue:
                                              value == null ? null : "-1"));
                                },
                              ),

                              /// PositionCode positionNumber dropdown button.

                              DropdownButton(
                                value: state.positionNumberValue,
                                items:
                                    dropDownMenuItems(state.positionTypeValue),
                                onChanged: (value) {
                                  // dropdown item changed
                                  /// position number changed dropdown value assign to notifier
                                  BlocProvider.of<DiningcartPageBloc>(context)
                                      .add(ChangePositionNumber(
                                          changedPositionNumberValue: value));
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  );
      },
    );
  }
}
