import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

// ignore: must_be_immutable
class MoniesRatesShimmer extends StatelessWidget {
  Size size;
  MoniesRatesShimmer({required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * .24,
      width: size.width * .3,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: ListView.builder(
          itemCount: 4,
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              height: 25,
              width: double.infinity,
            );
          },
        ),
      ),
    );
  }
}
