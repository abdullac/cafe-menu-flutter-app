import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:math' as math;
import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/utils/functions/show_snackbar.dart';
import 'package:firebase_database/firebase_database.dart';
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
  /// uploadTask for image upload to firebase
  static UploadTask? uploadTask;
  /// get image url from firebase after upload image to firebase
  static String? firebaseImageUrl;
  /// notifier for hange item id text ui after get new itemId
  static ValueNotifier<int?> newItemIdNotifier = ValueNotifier(null);

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
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      /// method for get newitemId, and notfy litener for change ui.
      newItemIdNotifier.value = await getNewItemId();
      newItemIdNotifier.notifyListeners();
    });
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
                    createAvailableItemJson(
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
                  showSnackBar("Somthing Wrong, may be any form field is empty");
                }
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ValueListenableBuilder(
                      valueListenable: newItemIdNotifier,
                      builder: (context, newItemId, _) {
                        return Text(
                            "ItemId : ${editItem == null ? newItemId ?? '' : editItem!.itemId ?? ''}");
                      }),
                  const SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: itemNameEditingController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Item Name",
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  /////////////////////////
                  Autocomplete(
                    fieldViewBuilder: (context, textEditingController,
                        focusNode, onFieldSubmitted) {
                      if (editItem != null && editItem!.categoryName != null) {
                        textEditingController.text = editItem!.categoryName!;
                      }
                      categoryNameEditingController = textEditingController;
                      log(categoryNameEditingController.text);
                      return TextField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Category Name",
                        ),
                        controller: categoryNameEditingController,
                        focusNode: focusNode,
                        onSubmitted: (value) {
                          log("submtted $value");
                          // categoryNameEditingController.text = value;
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
                  const SizedBox(
                    height: 5,
                  ),
                  /////////////////////////
                  // TextField(
                  //   controller: categoryNameEditingController,
                  //   decoration: const InputDecoration(
                  //     border: OutlineInputBorder(),
                  //     hintText: "Category Name",
                  //   ),
                  // ),
                  ////  Category type(platr/glass) - DropdownButton
                  const SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: priceEditingController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Price",
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: availableQtyEditingController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Available Quantity",
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: Column(
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            // Image from gallery button
                            // verticalImage & get Url
                            getImageFromDevice();
                          },
                          label: ValueListenableBuilder(
                              valueListenable: pickedImageNotifier,
                              builder: (context, newValue, _) {
                                return Text(newValue != null || editItem != null
                                    ? "Change Image"
                                    : "Add Image");
                              }),
                          icon: const Icon(Icons.add_photo_alternate_outlined),
                        ),
                        ValueListenableBuilder(
                            valueListenable: pickedImageNotifier,
                            builder: (context, pickedImage, _) {
                              return pickedImage != null
                                  ? ValueListenableBuilder(
                                      valueListenable: isUploadingImageNotifier,
                                      builder: (context, isUploadingImage, _) {
                                        return Stack(
                                          children: [
                                            Opacity(
                                                opacity:
                                                    isUploadingImage == true
                                                        ? 0.5
                                                        : 1,
                                                child: Image.file(
                                                  File(pickedImage.path),
                                                )),
                                            isUploadingImage == true
                                                ? const Positioned(
                                                    top: 0,
                                                    bottom: 0,
                                                    left: 0,
                                                    right: 0,
                                                    child: Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                        strokeWidth: 2,
                                                      ),
                                                    ),
                                                  )
                                                : const SizedBox(),
                                          ],
                                        );
                                      })
                                  :
                                  // editItem != null &&
                                  //         editItem!.verticalImageUrl != null
                                  //     ? Image.network(
                                  //         editItem!.verticalImageUrl!)
                                  //     :
                                  const SizedBox();
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

Future<void> getImageFromDevice() async {
  final imagePicker = ImagePicker();
  PageAddOrEditItem.pickedImageNotifier.value =
      await imagePicker.pickImage(source: ImageSource.gallery);
  if (PageAddOrEditItem.pickedImageNotifier.value != null) {
    print("picked image ${PageAddOrEditItem.pickedImageNotifier.value!.name}");
  } else {
    PageAddOrEditItem.pickedImageNotifier.value = null;
    print("picked image null");
  }
}

Future<String?> uploadImagetoFirebaseGetUrl() async {
  if (PageAddOrEditItem.pickedImageNotifier.value != null) {
    final imagePath =
        "files/images/cafeMenu/${PageAddOrEditItem.pickedImageNotifier.value!.name}";
    final imagefile = File(PageAddOrEditItem.pickedImageNotifier.value!.path);

    Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child(imagePath);
    PageAddOrEditItem.uploadTask = firebaseStorageRef.putFile(imagefile);
  }
  if (PageAddOrEditItem.uploadTask != null) {
    PageAddOrEditItem.isUploadingImageNotifier.value = true;
    PageAddOrEditItem.isUploadingImageNotifier.notifyListeners();
    final taskSnapshot = await PageAddOrEditItem.uploadTask!.whenComplete(() {});
    PageAddOrEditItem.firebaseImageUrl = await taskSnapshot.ref.getDownloadURL();
    PageAddOrEditItem.isUploadingImageNotifier.value = false;
    PageAddOrEditItem.isUploadingImageNotifier.notifyListeners();
    print("fireBaseImageUrl : ${PageAddOrEditItem.firebaseImageUrl}");
  }
  return PageAddOrEditItem.firebaseImageUrl;
}

List<int> itemIdList = [];
List<String> categoryNameList = [];

Future<void> getALlItemIdANdCategorynames() async {
  DatabaseReference firebaseRef = FirebaseDatabase.instance.ref();
  final snapshot =
      await firebaseRef.child("cafeMenu/menuCard/itemsSample").get();
  for (var element in snapshot.children) {
    ProductModel productModel =
        ProductModel.fromJson(jsonDecode(jsonEncode(element.value!)));
    // add to itemIdList
    if (productModel.itemId != null) {
      itemIdList.add(productModel.itemId!);
    }
    // add to categoryNameList
    if (productModel.categoryName != null) {
      categoryNameList.add(productModel.categoryName!);
    }
    log(productModel.toString());
  }
}

Future<int> getNewItemId() async {
  /// get all itemId s Or last itemId from firbase
  await getALlItemIdANdCategorynames();

  /// create new itemId
  int? largestItemId;
  if (itemIdList.isNotEmpty) {
    largestItemId = itemIdList.reduce(math.max);
  }
  log("large id $largestItemId");
  int newItemId = (largestItemId ?? math.Random().nextInt(100) + -150) + 1;
  return newItemId;
}

Map<String, dynamic>? createAvailableItemJson({
  required String itemId,
  required String itemName,
  required String categoryName,
  required String price,
  required String availableQuantity,
  required String? verticalImageUrl,
}) {
  log("itemId : $itemId");
  log("itemName : $itemName");
  log("categoryName : $categoryName");
  log("price : $price");
  log("availableQuantity : $availableQuantity");
  log("verticalImageUrl : $verticalImageUrl");
  if ([
    itemName,
    categoryName,
    price,
    availableQuantity,
  ].contains("")) {
    log("please fill all Fields");
    return null;
  } else {
    return ProductModel(
            itemId: int.parse(itemId),
            itemName: itemName,
            categoryName: categoryName,
            itemPrice: double.parse(price),
            itemType: ItemType.plate,
            availableQty: int.parse(availableQuantity),
            verticalImageUrl: verticalImageUrl)
        .toJson();
  }
}

addOrUpdateAvailableItemToFireBase(Map<String, dynamic> productModelJson,
    {ProductModel? editItem}) async {
  DatabaseReference firebaseRef = FirebaseDatabase.instance.ref();
  // dynamic getProductModelListFromFirebase;
  // await firebaseRef.child("cafeMenu/menuCard/itemsSample").get().then((value) {
  //   getProductModelListFromFirebase = value.value;
  // });
  // getProductModelListFromFirebase.add(productModelJson);
  final getproductModelListObjet =
      await firebaseRef.child("cafeMenu/menuCard/itemsSample").get();
  // List<int> keyList = [];
  // int newKey = 0;
  if (editItem == null) {
    var lastPositionKeySnapshort =
        getproductModelListObjet.children.last.key as String;
    int newPosition = int.parse(lastPositionKeySnapshort) + 1;
    // getproductModelListObjet.children.forEach((element) {
    //   if (element.key != null) {
    //     keyList.add(int.parse(element.key!));
    //   }
    // });
    //     for (int baseIndex = 0; baseIndex < keyList.length; baseIndex++) {
    //       for (int subIndex = baseIndex+1; subIndex < keyList.length; subIndex++) {
    //         if (keyList[baseIndex] < keyList[subIndex]) {
    //           newKey = keyList[subIndex]+1;
    //         }
    //       }
    //     }
    await firebaseRef
        .child("cafeMenu/menuCard/itemsSample/$newPosition")
        .set(productModelJson);
  } else {
    for (var element in getproductModelListObjet.children) {
      ProductModel produtmodel =
          ProductModel.fromJson(jsonDecode(jsonEncode(element.value)));
      if (produtmodel.itemId == editItem.itemId && element.key != null) {
        await firebaseRef
            .child("cafeMenu/menuCard/itemsSample/${element.key}")
            .update(productModelJson);
        log("edit element.key ${element.key}");
      }
    }
  }
}

pageAddItemClearAllTextFields() {
  PageAddOrEditItem.itemNameEditingController.text = "";
  PageAddOrEditItem.categoryNameEditingController.text = "";
  PageAddOrEditItem.priceEditingController.text = "";
  PageAddOrEditItem.availableQtyEditingController.text = "";
}
