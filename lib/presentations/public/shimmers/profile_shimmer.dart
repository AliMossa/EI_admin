import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProfileShimmer extends StatelessWidget {
  Size size;
  ProfileShimmer({required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Container(
        height: size.height * .5,
        width: size.width * .3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey.shade200,
              highlightColor: Colors.grey,
              child: Container(
                margin: EdgeInsets.all(5),
                width: size.width * .08,
                height: size.width * .08,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            SizedBox(height: size.height * .08),
            Shimmer.fromColors(
              baseColor: Colors.grey.shade200,
              highlightColor: Colors.grey,
              child: Container(
                margin: EdgeInsets.only(left: 50, top: 10),
                height: 40,
                width: size.width * .2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
              ),
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey.shade200,
              highlightColor: Colors.grey,
              child: Container(
                margin: EdgeInsets.only(left: 50, top: 10),
                height: 40,
                width: size.width * .2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
