import 'package:cafemenu_app/utils/constants/enums.dart';
import 'package:flutter/material.dart';

/// this dropdown button for Show and set position number of positionCode
List<DropdownMenuItem> dropDownMenuItems(TableOrChair? tableOrChair) {
  List<DropdownMenuItem> dropDownItemList = [];
  if (tableOrChair == null) {
    /// defualt dropdown value set to null and text set to --
    dropDownItemList
        .add(const DropdownMenuItem(value: null, child: Text("--")));
  } else {
    /// available count of position number 8 if you selected positionType(previuso dropDownButton) Table,
    /// 40 if you selected position type chair.
    /// set count with for loop as positionType
    int count = tableOrChair == TableOrChair.table ? 8 : 40;
    for (int index = 0; index < count; index++) {
      if (index == 0) {
        /// change 0 th dropdown value to null and text set to -Select-
        dropDownItemList.add(
          const DropdownMenuItem(
            value: "-1",
            child: Text("-Select-"),
          ),
        );
      } else {
        /// set valiue and text to dropdownbutton iterablely.
        dropDownItemList.add(
          DropdownMenuItem(
            value: tableOrChair == TableOrChair.table ? "T$index" : "C$index",
            child: Text("$index"),
          ),
        );
      }
    }
  }
  /// return drop down menu item
  return dropDownItemList;
}
