import 'dart:io';
import 'package:cafemenu_app/core/model/available_item/available_item_model.dart';
import 'package:cafemenu_app/utils/functions/admin/add_item/pickimage_from_device.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/// this is button widget for pik image from device
class PickImageFromDeviceButton extends StatelessWidget {
  const PickImageFromDeviceButton({
    super.key,
    required this.pickedImageNotifier,
    required this.editItem,
    required this.isUploadingImageNotifier,
  });

  final ValueNotifier<XFile?> pickedImageNotifier;
  final AvailableItemModel? editItem;
  final ValueNotifier<bool> isUploadingImageNotifier;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton.icon(
            onPressed: () {
              // Image from gallery button pressed
              // verticalImage & get Url
              getImageFromDevice();
            },

            /// rebuild after picked image for button text change to ChangeImage.
            label: ValueListenableBuilder(
              valueListenable: pickedImageNotifier,
              builder: (context, newValue, _) {
                /// button text
                return Text(newValue != null || editItem != null
                    ? "Change Image"
                    : "Add Image");
              },
            ),
            icon: const Icon(Icons.add_photo_alternate_outlined),
          ),

          /// rebuild after picked Image for show picked image.
          ValueListenableBuilder(
            valueListenable: pickedImageNotifier,
            builder: (context, pickedImage, _) {
              return pickedImage != null
                  ? ValueListenableBuilder(

                      /// rebuild while picked Image for show progressBar,
                      valueListenable: isUploadingImageNotifier,
                      builder: (context, isUploadingImage, _) {
                        return Stack(
                          children: [
                            Opacity(
                              opacity: isUploadingImage == true ? 0.5 : 1,

                              /// image widget
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

                                    /// progressBar
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                          ],
                        );
                      })
                  : const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}