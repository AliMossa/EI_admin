import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

// ignore: must_be_immutable
class AddUserShimmer extends StatelessWidget {
  Size size;

  AddUserShimmer({required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),

          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade200,
            highlightColor: Colors.grey,

            child: Container(
              margin: EdgeInsets.only(right: 10),
              height: size.height * .4,
              width: size.width * .4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
            ),
          ),
        ),
        Column(
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey.shade200,
              highlightColor: Colors.grey,

              child: Container(
                margin: EdgeInsets.symmetric(vertical: 5),

                height: size.height * .3,
                width: size.width * .33,

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
                margin: EdgeInsets.symmetric(vertical: 5),
                height: size.height * .2,
                width: size.width * .33,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
