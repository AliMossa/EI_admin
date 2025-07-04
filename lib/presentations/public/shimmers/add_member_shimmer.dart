import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';

class AddMemberShimmer extends StatelessWidget {
  Size size;
  AddMemberShimmer({required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            height: size.height * .3,
            width: size.width * .3,
            color: Colors.white,
          ),
        ),
        ListView(
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                height: size.height * .3,
                width: size.width * .3,
                color: Colors.white,
              ),
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                height: size.height * .3,
                width: size.width * .3,
                color: Colors.white,
              ),
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                height: size.height * .3,
                width: size.width * .3,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
