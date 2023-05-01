import 'package:cafemenu_app/ui/pages/user/diningcart_page/page_diningcart.dart';
import 'package:cafemenu_app/utils/constants/enums.dart';
import 'package:flutter/material.dart';

List<DropdownMenuItem> dropDownMenuItems(TableOrChair? tableOrChair) {
  List<DropdownMenuItem> dropDownItemList = [];
  if (tableOrChair == null) {
    dropDownItemList
        .add(const DropdownMenuItem(value: null, child: Text("--")));
  } else {
    int count = tableOrChair == TableOrChair.table ? 8 : 40;
    for (int index = 0; index < count; index++) {
      if (index == 0) {
        dropDownItemList.add(const DropdownMenuItem(
          value: "-1",
          child: Text("-Select-"),
        ));
      } else {
        dropDownItemList.add(DropdownMenuItem(
          value: tableOrChair == TableOrChair.table ? "T$index" : "C$index",
          child: Text("$index"),
        ));
      }
    }
  }
  return dropDownItemList;
}

