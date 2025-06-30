import 'dart:io';

import 'package:admin_dashboard/gen/assets.gen.dart';

import 'package:admin_dashboard/presentations/employees/presentation/widgets/view_employee/view_employee_id_image_widget.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:admin_dashboard/util/font/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class ViewIdsEmployeeWidget extends StatelessWidget {
  Size size;
  String? frontIdImage;
  String? backIdImage;
  File? loadedFrontFile;
  File? loadedBackFile;
  Function()? showAddedFrontId;
  Function()? showAddedBackId;

  Function() showFrontImage;
  Function() showBackImage;
  Widget? frontIcon;
  Widget? backIcon;

  ViewIdsEmployeeWidget({
    required this.loadedFrontFile,
    required this.loadedBackFile,
    required this.frontIdImage,
    required this.backIdImage,
    required this.showAddedFrontId,
    required this.showAddedBackId,
    required this.showFrontImage,
    required this.showBackImage,
    this.frontIcon = const SizedBox(),
    this.backIcon = const SizedBox(),

    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FittedBox(
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: background,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: linkColor),
            ),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('front id image', style: variableTitleStyle),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      width: size.width * .175,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: greyBackground,
                      ),

                      child:
                          frontIdImage == null
                              ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: showFrontImage,
                                    child: SvgPicture.asset(
                                      Assets.images.image,
                                      width: size.width * .05,
                                      height: size.width * .05,
                                    ),
                                  ),
                                ],
                              )
                              : Stack(
                                children: [
                                  SizedBox(
                                    width: size.width * .2,
                                    height: size.width * .1,
                                    child: ViewEmployeeIdImageWidget(
                                      showAddedImage: showAddedFrontId!,
                                      loadedFile: loadedFrontFile,
                                      size: size,

                                      image: frontIdImage!,
                                      showImage: showFrontImage,
                                    ),
                                  ),
                                  frontIcon!,
                                ],
                              ),
                    ),
                  ],
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('back id image', style: variableTitleStyle),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      width: size.width * .175,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: greyBackground,
                      ),

                      child:
                          backIdImage == null
                              ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: showBackImage,
                                    child: SvgPicture.asset(
                                      Assets.images.image,
                                      width: size.width * .05,
                                      height: size.width * .05,
                                    ),
                                  ),
                                ],
                              )
                              : Stack(
                                children: [
                                  SizedBox(
                                    width: size.width * .2,
                                    height: size.width * .1,
                                    child: ViewEmployeeIdImageWidget(
                                      showAddedImage: showAddedBackId!,
                                      loadedFile: loadedBackFile,
                                      size: size,
                                      image: backIdImage!,
                                      showImage: showBackImage,
                                    ),
                                  ),
                                  backIcon!,
                                ],
                              ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
