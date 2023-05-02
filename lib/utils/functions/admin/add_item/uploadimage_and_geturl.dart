import 'dart:io';
import 'package:cafemenu_app/firebase_backend.dart';
import 'package:cafemenu_app/ui/pages/admin/add_item_page/page_add_item.dart';
import 'package:cafemenu_app/utils/functions/show_snackbar.dart';

/// method for upload image to firebase storage
/// when add/update availableItem button pressed.
Future<String?> uploadImagetoFirebaseGetUrl() async {
  /// check has picked image from device.
  if (PageAddOrEditItem.pickedImageNotifier.value != null) {
    /// get image name and make firebase storage path for upload Image with image name
    final imagePath =
        "files/images/cafeMenu/${PageAddOrEditItem.pickedImageNotifier.value!.name}";

    /// get imageFile from pickedImageNotifier value.
    final imagefile = File(PageAddOrEditItem.pickedImageNotifier.value!.path);

    /// upload image to firebase storage
    PageAddOrEditItem.uploadTask =
        FirebaseBackend.imageStorageRef(imagePath).putFile(imagefile);
  }
  if (PageAddOrEditItem.uploadTask != null) {
    /// show progress indicator while uploading indicator
    PageAddOrEditItem.isUploadingImageNotifier.value = true;
    PageAddOrEditItem.isUploadingImageNotifier.notifyListeners();

    /// get uploaded image url when completed upload image
    final taskSnapshot =
        await PageAddOrEditItem.uploadTask!.whenComplete(() {});
    PageAddOrEditItem.firebaseImageUrl =
        await taskSnapshot.ref.getDownloadURL();

    /// stop show progress indicator when completed upload image
    PageAddOrEditItem.isUploadingImageNotifier.value = false;
    PageAddOrEditItem.isUploadingImageNotifier.notifyListeners();
    showSnackBar("image uploaded : ${taskSnapshot.ref.name}");
  }

  /// return image url
  return PageAddOrEditItem.firebaseImageUrl;
}
