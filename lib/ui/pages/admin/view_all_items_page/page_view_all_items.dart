import 'dart:convert';
import 'package:cafemenu_app/firebase_backend.dart';
import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/ui/pages/admin/view_all_items_page/widgets/availableitem_tile.dart';
import 'package:flutter/material.dart';

/// this widget shows all availableItem for view, edit and delete item.
class PageViewAllItems extends StatelessWidget {
  const PageViewAllItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Items"),
      ),
      body: SafeArea(
        /// rebuild widget when any change in firebase availableItem child path.
        child: StreamBuilder(
            stream: FirebaseBackend.availableItemsChildRef().onValue,
            builder: (context, snapshot) {
              List<AvailableItemModel> availableItemsList = [];
              if (snapshot.data != null) {
                /// get available itemSnapshot from listSnapshot
                /// and convert to availableItemModel for add to availableItemsList.
                final availableItemsListSnapshot =
                    snapshot.data!.snapshot.children;
                for (var availableItemSnapshot in availableItemsListSnapshot) {
                  AvailableItemModel availableItemModel = AvailableItemModel.fromJson(
                      jsonDecode(jsonEncode(availableItemSnapshot.value)));
                  availableItemsList.add(availableItemModel);
                }
              }

              /// listview for show all available Items and details.
              return ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  /// item builder for show each availableItem
                  return AvailableItemTile(
                    availableItem: availableItemsList[index],
                  );
                },
                separatorBuilder: (context, index) => Container(
                  color: Colors.red,
                  height: 5,
                ),
                itemCount: availableItemsList.length,
              );
            }),
      ),
    );
  }
}
