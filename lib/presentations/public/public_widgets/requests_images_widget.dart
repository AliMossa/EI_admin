import 'package:admin_dashboard/gen/assets.gen.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class RequestsImagesWidget extends StatelessWidget {
  Size size;
  List<String> images;
  RequestsImagesWidget({required this.images, required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * .2,
      width: size.width * .23,
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: greyBackground,
      ),

      child:
          images.isNotEmpty
              ? GridView.builder(
                shrinkWrap: true,
                itemCount: images.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 3,
                ),
                itemBuilder:
                    (context, index) => ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(images[index], fit: BoxFit.cover),
                    ),
              )
              : GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 6,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  maxCrossAxisExtent: 75,
                ),
                itemBuilder:
                    (context, index) => ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SvgPicture.asset(
                        Assets.images.image,
                        width: size.width * .05,
                        height: size.width * .04,
                      ),
                    ),
              ),
    );
  }
}
