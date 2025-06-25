import 'package:admin_dashboard/presentations/home/presentation/models/list_months_model.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LinerChartWidget extends StatelessWidget {
  double maxValue;
  double minValue;
  List<double> data;
  Size size;
  LinerChartWidget({
    required this.data,
    required this.maxValue,
    required this.minValue,
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30, right: 30, left: 10, bottom: 10),
      decoration: BoxDecoration(
        gradient: mainGradient3,
        borderRadius: BorderRadius.circular(20),
      ),

      width: size.width * .6,
      height: size.height * .5,
      child: LineChart(
        duration: const Duration(milliseconds: 500),
        curve: Curves.bounceIn,
        LineChartData(
          maxY: maxValue,
          lineBarsData: [
            LineChartBarData(
              spots: [
                const FlSpot(0, 0),
                const FlSpot(1, 37.5),
                const FlSpot(2, 76.9),
                const FlSpot(3, 45.7),
                const FlSpot(4, 94),
                const FlSpot(5, 37),
                const FlSpot(6, 76),
                const FlSpot(7, 45),
                const FlSpot(8, 50),
                const FlSpot(9, 11),
                const FlSpot(10, 37),
                const FlSpot(11, 76),
                const FlSpot(12, 80),
              ],
              isCurved: true,
              color: Colors.white30,
              barWidth: 3,
              isStrokeJoinRound: true,
              dotData: FlDotData(show: true),
              belowBarData: BarAreaData(show: true, color: Colors.black12),
            ),
          ],

          titlesData: FlTitlesData(
            rightTitles: AxisTitles(),
            topTitles: AxisTitles(),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                interval: 1,
                showTitles: true,
                getTitlesWidget:
                    (value, meta) => Text(
                      ListMonthsModel().getCorrectMonth(value.toInt()).name,
                    ),
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget:
                    (value, meta) => FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text(value.toInt().toString()),
                      ),
                    ),
              ),
            ),
          ),
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
        ),
      ),
    );
  }
}
