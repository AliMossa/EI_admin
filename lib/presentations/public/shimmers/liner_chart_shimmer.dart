import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

// ignore: must_be_immutable
class LinerChartShimmer extends StatelessWidget {
  Size size;
  LinerChartShimmer({required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * .5,
      width: size.width * .5,

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: LineChart(
            LineChartData(
              maxX: 5.5,
              maxY: 3,
              lineTouchData: LineTouchData(enabled: false),

              borderData: FlBorderData(
                show: true,
                border: Border(
                  left: BorderSide(color: textFieldBorder),
                  bottom: BorderSide(color: textFieldBorder),
                  right: BorderSide.none,
                  top: BorderSide.none,
                ),
              ),
              gridData: FlGridData(
                drawHorizontalLine: true,
                drawVerticalLine: false,
              ),
              titlesData: FlTitlesData(
                rightTitles: AxisTitles(),
                topTitles: AxisTitles(),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: false,
                    getTitlesWidget: (value, _) => Text('Day ${value.toInt()}'),
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),

              lineBarsData: [
                LineChartBarData(
                  dotData: FlDotData(show: false),
                  preventCurveOverShooting: true,
                  isCurved: true,
                  color: Colors.blue,
                  barWidth: 4,

                  spots: [
                    FlSpot(1, 2),
                    FlSpot(2, 2.5),
                    FlSpot(3, 1.5),
                    FlSpot(4, 2.5),
                    FlSpot(5, 2),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
