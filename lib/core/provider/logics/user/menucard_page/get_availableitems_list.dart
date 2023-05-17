import 'dart:convert';
import 'package:cafemenu_app/core/model/available_item/available_item_model.dart';
import 'package:cafemenu_app/utils/constants/lists.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

/// this method for make list of available items from firebase real time database
/// using stream builder snapshot.
getAvailableItemsListByStreamBuilder(AsyncSnapshot<DatabaseEvent> snapshot) {
  List<AvailableItemModel> listOfAvailableItem = [];

  final availableItemsSnapshotChildren = snapshot.data!.snapshot.children;

  /// lopping allAvailableItems for get each available items,
  /// and check if not null.
  for (var availableItemSnapshotChild in availableItemsSnapshotChildren) {
    /// each available items convert to jsonString, jsonMap, and AvailableItem,
    /// and add to listOfAvailableItem
    listOfAvailableItem.add(AvailableItemModel.fromJson(
        jsonDecode(jsonEncode(availableItemSnapshotChild.value))));
  }

  /// this listOfAvailableItem to availableItemsList.
  availableItemsList = listOfAvailableItem;
}
