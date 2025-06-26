import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

// ignore: must_be_immutable
class PieShimmer extends StatelessWidget {
  Size size;
  PieShimmer({required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * .2,
      height: size.width * .2,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: PieChart(
          curve: Curves.easeInBack,
          duration: const Duration(milliseconds: 500),

          PieChartData(
            sections: [
              PieChartSectionData(
                value: 60,
                color: coral,
                title: '60%',
                radius: 60,
                showTitle: true,
                titleStyle: TextStyle(color: Colors.white, fontSize: 16),
              ),
              PieChartSectionData(
                value: 20,
                color: textFieldBorder,
                title: '20%',
                radius: 60,
                titleStyle: TextStyle(color: Colors.white, fontSize: 16),
              ),
              PieChartSectionData(
                value: 10,
                color: graphite,
                title: '10%',
                radius: 60,
                titleStyle: TextStyle(color: Colors.white, fontSize: 16),
              ),
              PieChartSectionData(
                value: 10,
                color: sky,
                title: '10%',
                radius: 60,
                titleStyle: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
            centerSpaceRadius: 40,
            sectionsSpace: 2,
          ),
        ),
      ),
    );
  }
}
