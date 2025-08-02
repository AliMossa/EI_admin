import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

// ignore: must_be_immutable
class WalletShimmer extends StatelessWidget {
  Size size;
  double width;
  double height;
  WalletShimmer({
    required this.size,
    required this.height,
    required this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade200,
      highlightColor: Colors.grey,
      child: Container(
        color: Colors.white,
        height: size.height * height,
        width: size.width * width,
      ),
    );
  }
}
