import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void showPickImageBottomSheetImage(
    BuildContext context, ValueNotifier<File?> imageFileNotifier,
    {bool showCameraOption = true}) {
  final textTheme = Theme.of(context)
      .textTheme
      .apply(displayColor: Theme.of(context).colorScheme.onSurface);

  showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
            title: TextStyleExample(
                name: 'Choose Image',
                style: textTheme.headlineSmall!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    letterSpacing: 0.1)),
            message: TextStyleExample(
                name: "Choose an image from your camera or existing gallery.",
                style: textTheme.bodyMedium!.copyWith(letterSpacing: 0.1)),
            actions: <Widget>[
              // List of actions
              showCameraOption
                  ? CupertinoActionSheetAction(
                      child: TextStyleExample(
                          name: 'Camera',
                          style: textTheme.titleMedium!.copyWith(
                              color: Theme.of(context).colorScheme.secondary)),
                      onPressed: () {
                        selectImageFromCamera(context, imageFileNotifier);
                      },
                    )
                  : const SizedBox.shrink(),
              CupertinoActionSheetAction(
                child: TextStyleExample(
                    name: 'Gallery',
                    style: textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).colorScheme.secondary)),
                onPressed: () {
                  selectImageFromGallery(context, imageFileNotifier);
                },
              ),
            ],
            // A cancel button at the bottom of the modal popup
            cancelButton: CupertinoActionSheetAction(
              child: TextStyleExample(
                  name: 'Close',
                  style: textTheme.titleLarge!
                      .copyWith(color: Colors.grey, letterSpacing: 0.1)),
              onPressed: () {
                Navigator.pop(context); // Close the modal popup
              },
            ),
          ));
}

Future<void> selectImageFromCamera(
    BuildContext context, ValueNotifier<File?> imageFileNotifier) async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: ImageSource.camera);
  if (pickedFile != null) {
    // Convert XFile to File
    imageFileNotifier.value = File(pickedFile.path);
  }
  // Collapse the modal popup menu for hiding bottom sheet
  if (context.mounted) {
    Navigator.pop(context);
  }
}

Future<void> selectImageFromGallery(
    BuildContext context, ValueNotifier<File?> imageFileNotifier) async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  if (pickedFile != null) {
    // Convert XFile to File
    imageFileNotifier.value = File(pickedFile.path);
  }
  // Collapse the modal popup menu for hiding bottom sheet
  if (context.mounted) {
    Navigator.pop(context);
  }
}

class TextStyleExample extends StatelessWidget {
  const TextStyleExample({super.key, required this.name, required this.style});

  final String name;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(1.0),
      child: Text(name, style: style.copyWith(letterSpacing: 1.0)),
    );
  }
}
