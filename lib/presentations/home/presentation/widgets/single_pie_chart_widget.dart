import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:admin_dashboard/util/font/font_styles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SinglePieChartWidget extends StatelessWidget {
  double value;
  String title;
  Color color;
  Size size;
  SinglePieChartWidget({
    required this.value,
    required this.title,
    required this.color,
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: mainGradient3,
        borderRadius: BorderRadius.circular(20),
      ),

      width: size.width * .2,
      height: size.height * .4,
      child: SizedBox(
        width: size.width * .2,
        // height: size.width * .1,
        child: Stack(
          alignment: Alignment.center,
          children: [
            PieChart(
              curve: Curves.easeInBack,
              duration: const Duration(milliseconds: 500),
              PieChartData(
                sections: [
                  PieChartSectionData(
                    value: value,
                    color: color,
                    title: '',
                    radius: 30,
                    showTitle: true,
                    titleStyle: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  PieChartSectionData(
                    value: 100 - value,
                    color: Colors.deepPurple.shade100,
                    title: '',
                    radius: 30,
                    showTitle: true,
                    titleStyle: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
                centerSpaceRadius: 80,
                sectionsSpace: 0,
                startDegreeOffset: 270,
              ),
            ),
            Text(
              '$value % \n$title',
              style: getProfileTitleLogginDateStyle(size),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
