import 'package:cafemenu_app/ui/pages/user/diningcart_page/widgets/diningcart_button.dart';
import 'package:cafemenu_app/ui/pages/user/diningcart_page/widgets/show_confirmed_position.dart';
import 'package:cafemenu_app/utils/constants/enums.dart';
import 'package:cafemenu_app/utils/functions/diningcart_page/dropdownmenu_item.dart';
import 'package:flutter/material.dart';

/// this widget shows customer name and Position code
class NameAndPositionCode extends StatelessWidget {
  NameAndPositionCode({
    super.key,
  });

  /// tableOrChairNotifier for rebuild dropdown button when change value.
  ValueNotifier<TableOrChair?> tableOrChairNotifier = ValueNotifier(null);

  /// tableOrChairNotifier for rebuild dropdown button when change value.
  static ValueNotifier<String?> tableOrChairNumberNotifier =
      ValueNotifier(null);

  /// editing controller for customer name textField.
  static TextEditingController customerNameEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    /////////////////////////
    ///  FOR DEVELOPMENT - AVOID rebuild ERROR while save project
    tableOrChairNotifier.value = null;
    tableOrChairNumberNotifier.value = null;
    ////////////////////////
    return ValueListenableBuilder(
        valueListenable: DiningCartButton.diningCartButtonNotifier,
        builder: (context, diningCartButtonType, _) {
          /// hide NameAndPositionCode widget if not pressed diningCartButton
          return diningCartButtonType == null
              ? const SizedBox()

              /// show ShowConfirmedPosition widget if pressed Order confirmed button.
              : diningCartButtonType ==
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            /// PositionCode drop down Buttons
                            const Text("Position Code: "),

                            /// positinCode Chair Or Table drop down button.
                            ValueListenableBuilder(
                              valueListenable: tableOrChairNotifier,
                              builder: (context, tableOrChair, _) {
                                /// select table or chair dropDown
                                return DropdownButton(
                                  value: tableOrChair,
                                  items: const <DropdownMenuItem<dynamic>>[
                                    DropdownMenuItem(
                                      value: null,
                                      child: Text("-Select-"),
                                    ),
                                    DropdownMenuItem(
                                      value: TableOrChair.table,
                                      child: Text("Table"),
                                    ),
                                    DropdownMenuItem(
                                      value: TableOrChair.chair,
                                      child: Text("Chair"),
                                    ),
                                  ],
                                  onChanged: (value) {
                                    // dropdown item changed
                                    /// table or chair changed value assign to notifier.
                                    tableOrChairNotifier.value = value;
                                    tableOrChairNotifier.notifyListeners();
                                    tableOrChairNumberNotifier.value =
                                        value == null ? null : "-1";
                                    tableOrChairNumberNotifier
                                        .notifyListeners();
                                  },
                                );
                              },
                            ),

                            /// Position Code position number dropdown button.
                            
                            ValueListenableBuilder(
                                valueListenable: tableOrChairNumberNotifier,
                                builder: (context, newValue, _) {
                                  /// position number by table/chair
                                  return DropdownButton(
                                    value: newValue,
                                    items: dropDownMenuItems(
                                        tableOrChairNotifier.value),
                                    onChanged: (value) {
                                      // dropdown item changed
                                      /// position number changed dropdown value assign to notifier
                                      tableOrChairNumberNotifier.value = value;
                                      tableOrChairNumberNotifier
                                          .notifyListeners();
                                    },
                                  );
                                }),
                          ],
                        ),
                      ],
                    );
        });
  }
}
