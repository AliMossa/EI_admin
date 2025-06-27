import 'package:admin_dashboard/presentations/public/shimmers/pie_shimmer.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class RowPieChartShimmer extends StatelessWidget {
  Size size;
  RowPieChartShimmer({required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PieShimmer(size: size),
        PieShimmer(size: size),
        PieShimmer(size: size),
      ],
    );
  }
}
