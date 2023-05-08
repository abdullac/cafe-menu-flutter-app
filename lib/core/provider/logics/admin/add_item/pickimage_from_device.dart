import 'package:cafemenu_app/ui/pages/admin/add_item_page/page_add_item.dart';
import 'package:cafemenu_app/utils/functions/show_snackbar.dart';
import 'package:image_picker/image_picker.dart';

/// method for pick image from device when press pick image button
Future<void> getImageFromDevice() async {
  /// declare empty image picker variable
  final imagePicker = ImagePicker();

  /// pick image from device and assign image data to pickedImageNotifier value.
  PageAddOrEditItem.pickedImageNotifier.value =
      await imagePicker.pickImage(source: ImageSource.gallery);
  if (PageAddOrEditItem.pickedImageNotifier.value != null) {
    /// show message picked image Name
    showSnackBar(
        "picked image ${PageAddOrEditItem.pickedImageNotifier.value!.name}");
  } else {
    PageAddOrEditItem.pickedImageNotifier.value = null;

    /// show warning if not get image from device.
    showSnackBar("Cannot pick image from device");
  }
}
