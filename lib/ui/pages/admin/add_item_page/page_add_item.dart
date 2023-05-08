import 'package:cafemenu_app/core/model/available_item/available_item_model.dart';
import 'package:cafemenu_app/ui/pages/admin/add_item_page/widgets/additem_page_appbar.dart';
import 'package:cafemenu_app/ui/pages/admin/add_item_page/widgets/categoryname_auto_textfield.dart';
import 'package:cafemenu_app/ui/pages/admin/add_item_page/widgets/pick_imagefromdevice_button.dart';
import 'package:cafemenu_app/utils/constants/space.dart';
import 'package:cafemenu_app/core/provider/logics/admin/add_item/get_new_itemid.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/// this widget/Screen for add or update Item to firebase AvailableItemList
class PageAddOrEditItem extends StatelessWidget {
  final AvailableItemModel? editItem;
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
      appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 60),
          child: AddItemPageAppbar(editItem: editItem)),
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
                const CategoryNameAutoTextField(),
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
