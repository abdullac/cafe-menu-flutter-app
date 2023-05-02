import 'dart:developer';
import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/ui/pages/admin/add_item_page/widgets/pick_imagefromdevice_button.dart';
import 'package:cafemenu_app/utils/constants/space.dart';
import 'package:cafemenu_app/utils/functions/admin/add_item/add_update_availableitem.dart';
import 'package:cafemenu_app/utils/functions/admin/add_item/create_availableitemmodel_json.dart';
import 'package:cafemenu_app/utils/functions/admin/add_item/get_new_itemid.dart';
import 'package:cafemenu_app/utils/functions/admin/add_item/uploadimage_and_geturl.dart';
import 'package:cafemenu_app/utils/functions/show_snackbar.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/// this widget/Screen for add or update Item to firebase AvailableItemList
class PageAddOrEditItem extends StatelessWidget {
  final ProductModel? editItem;
  const PageAddOrEditItem({
    Key? key,
    this.editItem,
  }) : super(key: key);

  /// text editing controllers for controll text field texts.
  static TextEditingController itemNameEditingController =
      TextEditingController();
  static TextEditingController categoryNameEditingController =
      TextEditingController();
  static TextEditingController priceEditingController = TextEditingController();
  static TextEditingController availableQtyEditingController =
      TextEditingController();

  /// Notifier for desplay image after pik from device.
  static ValueNotifier<XFile?> pickedImageNotifier = ValueNotifier(null);

  /// notifier for show circleProgeress while upload image to firebase.
  static ValueNotifier<bool> isUploadingImageNotifier = ValueNotifier(false);

  /// notifier for hange item id text ui after get new itemId
  static ValueNotifier<int?> newItemIdNotifier = ValueNotifier(null);

  /// uploadTask for image upload to firebase
  static UploadTask? uploadTask;

  /// get image url from firebase after upload image to firebase
  static String? firebaseImageUrl;

  /// ItemId for create new ItemId
  static List<int> itemIdList = [];

  /// categoryList for autocomplet textField
  static List<String> categoryNameList = [];

  @override
  Widget build(BuildContext context) {
    /// change textfields texts using editing controllers if any availableItem edit.
    if (editItem != null) {
      itemNameEditingController.text = editItem!.itemName ?? '';
      categoryNameEditingController.text = editItem!.categoryName ?? '';
      priceEditingController.text =
          editItem!.itemPrice != null ? editItem!.itemPrice.toString() : '';
      availableQtyEditingController.text = editItem!.availableQty != null
          ? editItem!.availableQty.toString()
          : '';
    }
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        /// method for get newitemId, and notfy litener for change ui.
        newItemIdNotifier.value = await getNewItemId();
        newItemIdNotifier.notifyListeners();
      },
    );
    return Scaffold(
      /// appBar,
      appBar: AppBar(
        /// appBar title change as edit item or add item
        title: Text(editItem == null ? "Add Item" : "Edit Item"),
        actions: [
          IconButton(
            onPressed: () async {
              // AddItem page appbar add button
              /// metod for create new/edited availableItem json with PageAddOrEditItem Details.
              Map<String, dynamic>? AvailableItemModelJson =
                  createAvailableItemModelJson(
                itemId: newItemIdNotifier.value.toString(),
                itemName: itemNameEditingController.text,
                categoryName: categoryNameEditingController.text,
                price: priceEditingController.text,
                availableQuantity: availableQtyEditingController.text,
                verticalImageUrl: await uploadImagetoFirebaseGetUrl(),
              );
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
      ),
      body: SafeArea(
        /// scrollview for avoid widget overflow
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// vailueListernBuilder for rebuild when get itemId Text
                ValueListenableBuilder(
                  valueListenable: newItemIdNotifier,
                  builder: (context, newItemId, _) {
                    /// itemId Text
                    return Text(
                      "ItemId : ${editItem == null ? newItemId ?? '' : editItem!.itemId ?? ''}",
                    );
                  },
                ),
                spaceH5,

                /// itemName textFeild
                TextField(
                  controller: itemNameEditingController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Item Name",
                  ),
                ),
                spaceH5,

                /// categoryName textFeild with autoComplete.
                Autocomplete(
                  fieldViewBuilder: (context, textEditingController, focusNode,
                      onFieldSubmitted) {
                    if (editItem != null && editItem!.categoryName != null) {
                      textEditingController.text = editItem!.categoryName!;
                    }
                    categoryNameEditingController = textEditingController;
                    log(categoryNameEditingController.text);

                    /// cateegoryName textFeild
                    return TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Category Name",
                      ),
                      controller: categoryNameEditingController,
                      focusNode: focusNode,
                      onSubmitted: (value) {
                        log("submtted $value");
                      },
                    );
                  },
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    if (textEditingValue.text == "") {
                      return const Iterable<String>.empty();
                    } else {
                      List<String> matches = <String>[];
                      matches.addAll(categoryNameList);
                      matches.retainWhere((element) {
                        return element
                            .toLowerCase()
                            .contains(textEditingValue.text.toLowerCase());
                      });
                      return matches;
                    }
                  },
                  onSelected: (String selection) {
                    log("slected $selection");
                    categoryNameEditingController.text = selection;
                  },
                ),
                spaceH5,

                /// Price textField
                TextField(
                  controller: priceEditingController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Price",
                  ),
                ),
                spaceH5,

                /// available Qty TextField
                TextField(
                  controller: availableQtyEditingController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Available Quantity",
                  ),
                ),
                spaceH5,

                /// pick image from device button
                PickImageFromDeviceButton(
                  pickedImageNotifier: pickedImageNotifier,
                  editItem: editItem,
                  isUploadingImageNotifier: isUploadingImageNotifier,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// CURRENTLY UNUSED
pageAddItemClearAllTextFields() {
  PageAddOrEditItem.itemNameEditingController.text = "";
  PageAddOrEditItem.categoryNameEditingController.text = "";
  PageAddOrEditItem.priceEditingController.text = "";
  PageAddOrEditItem.availableQtyEditingController.text = "";
}
