import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class PieChartWidget extends StatelessWidget {
  Size size;
  PieChartWidget({required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30, right: 30, left: 10, bottom: 10),
      decoration: BoxDecoration(
        gradient: mainGradient3,
        borderRadius: BorderRadius.circular(20),
      ),

      width: size.width * .3,
      height: size.height * .3,
      child: PieChart(
        PieChartData(
          sections: [
            PieChartSectionData(
              value: 80,
              color: Colors.blue,
              title: '40%',
              radius: 60,
              showTitle: true,
              titleStyle: TextStyle(color: Colors.white, fontSize: 16),
            ),
            PieChartSectionData(
              value: 30,
              color: Colors.red,
              title: '30%',
              radius: 60,
              titleStyle: TextStyle(color: Colors.white, fontSize: 16),
            ),
            PieChartSectionData(
              value: 30,
              color: Colors.red,
              title: '30%',
              radius: 60,
              titleStyle: TextStyle(color: Colors.white, fontSize: 16),
            ),
            PieChartSectionData(
              value: 30,
              color: Colors.red,
              title: '30%',
              radius: 60,
              titleStyle: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
          centerSpaceRadius: 40,
          sectionsSpace: 2,
        ),
      ),
    );
  }
}
