import 'dart:convert';
import 'dart:developer';
import 'package:cafemenu_app/core/model/available_item/available_item_model.dart';
import 'package:cafemenu_app/utils/constants/lists.dart';
import 'package:cafemenu_app/utils/functions/show_snackbar.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

getAvailableItemsListByStreamBuilder(AsyncSnapshot<DatabaseEvent> snapshot) {
  /// this method for make list of available items from firebase real time database
  /// using stream builder snapshot.
  /// get snapshot values(available items) without snapshot key.
  final availableItemsSnapshotValues =  snapshot.data!.snapshot.value;

  /// a variable declare named by allAvailableItems as Iterable,
  /// because, the variable allAvailableItems may be List if availableItemsSnapshotValues lenghth  gratyerthan or equal 2.
  /// the variable allAvailableItems may be Map if availableItemsSnapshotValues lenghth  lesthan 2.
  final Iterable allAvailableItems;
  List<AvailableItemModel> listOfAvailableItem = [];
  ///////////////////////////////////////////
  
  final availableItemsSnapshotChildren =  snapshot.data!.snapshot.children;
    /// lopping allAvailableItems for get each available items,
    /// and check if not null.
  for(var availableItemSnapshotChild in availableItemsSnapshotChildren){
        /// each available items convert to jsonString, jsonMap, and AvailableItem,
        /// and add to listOfAvailableItem
    listOfAvailableItem.add(AvailableItemModel.fromJson(jsonDecode(jsonEncode(availableItemSnapshotChild.value))));
  }

  //////////////////////////////////////////


  // /// check availableItemsSnapshotValues is null
  // /// listOfAvailableItem will be empty if availableItemsSnapshotValues is null,
  // /// listOfAvailableItem will be add available items if availableItemsSnapshotValues is not null,
  // if (availableItemsSnapshotValues != null) {
  //   showSnackBar("## getAvailableItemsListByStreamBuilder : no null");

  //   /// check availableItemsSnapshotValues as List or Map.
  //   if (availableItemsSnapshotValues.runtimeType == List<Object?>) {
  //     showSnackBar("## getAvailableItemsListByStreamBuilder : List<Object?>");

  //     /// availableItemsSnapshotValues assign to Iterable allAvailableItems as List<Objrct?>
  //     allAvailableItems = availableItemsSnapshotValues as List;
  //   } else if (availableItemsSnapshotValues.runtimeType == List<dynamic>) {
  //     showSnackBar("## getAvailableItemsListByStreamBuilder : List<dynamic?>");

  //     /// availableItemsSnapshotValues assign to Iterable allAvailableItems as List<dynamic>
  //     allAvailableItems = availableItemsSnapshotValues as List;
  //   } else {
  //     showSnackBar(
  //         "## getAvailableItemsListByStreamBuilder : ${availableItemsSnapshotValues.runtimeType}");

  //     /// availableItemsSnapshotValues assign to Iterable allAvailableItems as Map
  //     availableItemsSnapshotValues as Map<dynamic, dynamic>;
  //     allAvailableItems = availableItemsSnapshotValues.values;
  //   }

  //   /// lopping allAvailableItems for get each available items,
  //   /// and check if not null.
  //   for (var availableItem in allAvailableItems) {
  //     if (availableItem != null) {
  //       /// each available items convert to jsonString, jsonMap, and AvailableItem,
  //       /// and add to listOfAvailableItem
  //       listOfAvailableItem.add(
  //           AvailableItemModel.fromJson(jsonDecode(jsonEncode(availableItem))));
  //     }
  //   }
  // }

  /// this listOfAvailableItem to availableItemsList.
  availableItemsList = listOfAvailableItem;
}
