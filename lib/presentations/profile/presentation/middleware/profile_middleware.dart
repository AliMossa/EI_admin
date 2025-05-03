import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ProfileMiddleware {
  File? image;
  void loadImage() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedImage != null) {
      image = File(pickedImage.path);
    }
  }
}
