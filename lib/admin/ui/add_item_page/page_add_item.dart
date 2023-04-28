import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:math' as math;

import 'package:cafemenu_app/core/model/product/product_model.dart';
import 'package:cafemenu_app/ui/pages/home_page/page_home.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PageAddItem extends StatelessWidget {
  PageAddItem({Key? key}) : super(key: key);

  static TextEditingController itemNameEditingController =
      TextEditingController();
  static TextEditingController categoryNameEditingController =
      TextEditingController();
  static TextEditingController priceEditingController = TextEditingController();
  static TextEditingController availableQtyEditingController =
      TextEditingController();
  static ValueNotifier<XFile?> pickedImageNotifier = ValueNotifier(null);
  static ValueNotifier<bool> isUploadingImageNotifier = ValueNotifier(false);
  static UploadTask? uploadTask;
  static String? firebaseImageUrl;

  static ValueNotifier<int?> newItemIdNotifier = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      newItemIdNotifier.value = await getNewItemId();
      log("newItemId ${newItemIdNotifier.value}");
      newItemIdNotifier.notifyListeners();
    });
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Item"),
          actions: [
            IconButton(
              onPressed: () async {
                // AddItem page appbar add button
                Map<String, dynamic>? productModelJson =
                    createProdectModelItemJson(
                  itemId: newItemIdNotifier.value.toString(),
                  itemName: itemNameEditingController.text,
                  categoryName: categoryNameEditingController.text,
                  price: priceEditingController.text,
                  availableQuantity: availableQtyEditingController.text,
                  verticalImageUrl: await uploadImagetoFirebaseGetUrl(),
                );
                if (productModelJson != null) {
                  await addOrUpdateProductModelItemToFireBase(productModelJson);
                  Navigator.of(context).pop();
                } else {
                  print("Somthing Wrong, may be any form field is empty");
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
                        return Text("ItemId : ${newItemId ?? ''}");
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
                                return Text(newValue == null
                                    ? "Add Image"
                                    : "Change Image");
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
                                              opacity: isUploadingImage == true
                                                  ? 0.5
                                                  : 1,
                                              child: Image.file(
                                                File(pickedImage.path),
                                              ),
                                            ),
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
                                  : const SizedBox();
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
  PageAddItem.pickedImageNotifier.value =
      await imagePicker.pickImage(source: ImageSource.gallery);
  if (PageAddItem.pickedImageNotifier.value != null) {
    print("picked image ${PageAddItem.pickedImageNotifier.value!.name}");
  } else {
    PageAddItem.pickedImageNotifier.value = null;
    print("picked image null");
  }
}

Future<String?> uploadImagetoFirebaseGetUrl() async {
  if (PageAddItem.pickedImageNotifier.value != null) {
    final imagePath =
        "files/images/cafeMenu/${PageAddItem.pickedImageNotifier.value!.name}";
    final imagefile = File(PageAddItem.pickedImageNotifier.value!.path);

    Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child(imagePath);
    PageAddItem.uploadTask = firebaseStorageRef.putFile(imagefile);
  }
  if (PageAddItem.uploadTask != null) {
    PageAddItem.isUploadingImageNotifier.value = true;
    PageAddItem.isUploadingImageNotifier.notifyListeners();
    final taskSnapshot = await PageAddItem.uploadTask!.whenComplete(() {});
    PageAddItem.firebaseImageUrl = await taskSnapshot.ref.getDownloadURL();
    PageAddItem.isUploadingImageNotifier.value = false;
    PageAddItem.isUploadingImageNotifier.notifyListeners();
    print("fireBaseImageUrl : ${PageAddItem.firebaseImageUrl}");
  }
  return PageAddItem.firebaseImageUrl;
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

Map<String, dynamic>? createProdectModelItemJson({
  required String itemId,
  required String itemName,
  required String categoryName,
  required String price,
  required String availableQuantity,
  required String? verticalImageUrl,
}) {
  log("categoryName $categoryName");
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

addOrUpdateProductModelItemToFireBase(
    Map<String, dynamic> productModelJson) async {
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
}

pageAddItemClearAllTextFields() {
  PageAddItem.itemNameEditingController.text = "";
  PageAddItem.categoryNameEditingController.text = "";
  PageAddItem.priceEditingController.text = "";
  PageAddItem.availableQtyEditingController.text = "";
}
