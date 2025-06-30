import 'dart:io';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ViewEmployeeIdImageWidget extends StatelessWidget {
  String image;
  File? loadedFile;
  Function() showImage;
  Function() showAddedImage;

  Size size;
  ViewEmployeeIdImageWidget({
    required this.size,
    required this.image,
    required this.showImage,
    required this.showAddedImage,
    required this.loadedFile,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: size.width * .04,
      decoration: BoxDecoration(color: Colors.transparent),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
            loadedFile != null
                ? InkWell(
                  onTap: showAddedImage,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.file(loadedFile!, fit: BoxFit.cover),
                  ),
                )
                : ClipRRect(
                  borderRadius: BorderRadius.circular(20),

                  child: InkWell(
                    onTap: showImage,
                    child: Image.network(image, fit: BoxFit.cover),
                  ),
                ),
      ),
    );
  }
}
