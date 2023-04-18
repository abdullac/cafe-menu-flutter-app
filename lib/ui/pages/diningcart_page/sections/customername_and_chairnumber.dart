import 'package:cafemenu_app/ui/pages/diningcart_page/widgets/diningcart_button.dart';
import 'package:cafemenu_app/utils/constants/enums.dart';
import 'package:cafemenu_app/utils/functions/diningcart_page/dropdownmenu_item.dart';
import 'package:flutter/material.dart';

class NameChairNumber extends StatelessWidget {
  NameChairNumber({
    super.key,
  });

  ValueNotifier<TableOrChair?> tableOrChairNotifier = ValueNotifier(null);
  static ValueNotifier<String?> tableOrChairNumberNotifier =
      ValueNotifier(null);
  static TextEditingController customerNameEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    /////////////////////////
    ///  FOR DEVEELOPMENT - AVOID rebuild ERROR while save project
    tableOrChairNotifier.value = null;
    tableOrChairNumberNotifier.value = null;
    ////////////////////////
    return ValueListenableBuilder(
        valueListenable: DiningCartButton.diningCartButtonNotifier,
        builder: (context, diningCartButtonType, _) {
          return diningCartButtonType == null
              ? Container(
                  height: 5,
                  width: 200,
                  color: Colors.pink.withOpacity(0.4),
                )
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
                        const Text("Table/Chair No: "),
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
                                  tableOrChairNotifier.value = value;
                                  tableOrChairNotifier.notifyListeners();
                                  tableOrChairNumberNotifier.value =
                                      value == null ? null : "-1";
                                  tableOrChairNumberNotifier.notifyListeners();
                                },
                              );
                            }),
                        ValueListenableBuilder(
                            valueListenable: tableOrChairNumberNotifier,
                            builder: (context, newValue, _) {
                              /// seat number by table/chair
                              return DropdownButton(
                                value: newValue,
                                items: dropDownMenuItems(
                                    tableOrChairNotifier.value),
                                onChanged: (value) {
                                  // dropdown item changed
                                  tableOrChairNumberNotifier.value = value;
                                  tableOrChairNumberNotifier.notifyListeners();
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
