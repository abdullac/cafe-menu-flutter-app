import 'dart:convert';
import 'package:cafemenu_app/core/model/available_item/available_item_model.dart';
import 'package:cafemenu_app/utils/constants/lists.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

 getAvailableItemsListByStreamBuilder(
    AsyncSnapshot<DatabaseEvent> snapshot) {
  /// this method for make list of available items from firebase real time database
  /// using stream builder snapshot.
  /// get snapshot values(available items) without snapshot key.
  final availableItemsSnapshotValues = snapshot.data!.snapshot.value;

  /// a variable declare named by allAvailableItems as Iterable,
  /// because, the variable allAvailableItems may be List if availableItemsSnapshotValues lenghth  gratyerthan or equal 2.
  /// the variable allAvailableItems may be Map if availableItemsSnapshotValues lenghth  lesthan 2.
  final Iterable allAvailableItems;
  List<AvailableItemModel> listOfAvailableItem = [];

  /// check availableItemsSnapshotValues is null
  /// listOfAvailableItem will be empty if availableItemsSnapshotValues is null,
  /// listOfAvailableItem will be add available items if availableItemsSnapshotValues is not null,
  if (availableItemsSnapshotValues != null) {
    /// check availableItemsSnapshotValues as List or Map.
    if (availableItemsSnapshotValues.runtimeType == List<Object?>) {
      /// availableItemsSnapshotValues assign to Iterable allAvailableItems as List
      allAvailableItems = availableItemsSnapshotValues as List;
    } else {
      /// availableItemsSnapshotValues assign to Iterable allAvailableItems as Map
      availableItemsSnapshotValues as Map<dynamic, dynamic>;
      allAvailableItems = availableItemsSnapshotValues.values;
    }

    /// lopping allAvailableItems for get each available items,
    /// and check if not null.
    for (var availableItem in allAvailableItems) {
      if (availableItem != null) {
        /// each available items convert to jsonString, jsonMap, and AvailableItem,
        /// and add to listOfAvailableItem
        listOfAvailableItem
            .add(AvailableItemModel.fromJson(jsonDecode(jsonEncode(availableItem))));
      }
    }
  }

  /// this listOfAvailableItem to availableItemsList.
  availableItemsList = listOfAvailableItem;
}
