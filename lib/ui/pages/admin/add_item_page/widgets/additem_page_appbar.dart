import 'package:cafemenu_app/core/model/available_item/available_item_model.dart';
import 'package:cafemenu_app/utils/functions/admin/add_item/add_update_availableitem.dart';
import 'package:cafemenu_app/utils/functions/admin/add_item/create_availableitemmodel_json.dart';
import 'package:cafemenu_app/utils/functions/show_snackbar.dart';
import 'package:flutter/material.dart';

class AddItemPageAppbar extends StatelessWidget {
  final AvailableItemModel? editItem;
  const AddItemPageAppbar({
    super.key,
    this.editItem,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      /// appBar title change as edit item or add item
      title: Text(editItem == null ? "Add Item" : "Edit Item"),
      actions: [
        IconButton(
          onPressed: () async {
            // AddItem page appbar add button
            /// metod for create new/edited availableItem json with PageAddOrEditItem Details.
            Map<String, dynamic>? AvailableItemModelJson =
                await createAvailableItemModelJson();
            if (AvailableItemModelJson != null) {
              /// method for AvailableItemModelJson add/edit to firebase database
              await addOrUpdateAvailableItemToFireBase(AvailableItemModelJson,
                  editItem: editItem);

              /// go back page after add/update to firebase
              Navigator.of(context).pop();
            } else {
              /// show error message
              showSnackBar("Somthing Wrong, may be any form field is empty");
            }
          },
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
