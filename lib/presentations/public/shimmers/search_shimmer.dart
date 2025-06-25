import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

// ignore: must_be_immutable
class SearchShimmer extends StatelessWidget {
  Size size;
  SearchShimmer({required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade200,
        highlightColor: Colors.grey,
        child: Container(
          height: size.height * .1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
