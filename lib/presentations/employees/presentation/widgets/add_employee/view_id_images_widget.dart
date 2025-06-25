import 'dart:io';
import 'package:admin_dashboard/util/sizes/fonts_sizes.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ViewIdImagesWidget extends StatelessWidget {
  File file;
  Function() removeImage;
  Function() showImage;

  Size size;
  ViewIdImagesWidget({
    required this.size,
    required this.file,
    required this.removeImage,
    required this.showImage,

    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: size.width * .04,
      decoration: BoxDecoration(color: Colors.transparent),

      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(onTap: showImage, child: Image.file(file)),
          ),
          Positioned(
            right: -5,
            top: -5,
            child: Center(
              child: IconButton(
                iconSize: normalSize,
                onPressed: removeImage,
                icon: Icon(Icons.cancel_rounded, color: Colors.red),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
