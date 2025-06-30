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
    return GridTile(
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: mainGradient3,
          borderRadius: BorderRadius.circular(20),
        ),
        width: size.width * .2,
        height: size.height * .3,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final chartSize = constraints.biggest.shortestSide;
                  final radius = chartSize * 0.15;
                  final centerRadius = chartSize * 0.40;

                  return PieChart(
                    curve: Curves.easeInBack,
                    duration: const Duration(milliseconds: 200),
                    PieChartData(
                      sections: [
                        PieChartSectionData(
                          value: value,
                          color: color,
                          title: '',
                          radius: radius,
                          showTitle: true,
                          titleStyle: TextStyle(
                            color: Colors.white,
                            fontSize: chartSize * 0.07,
                          ),
                        ),
                        PieChartSectionData(
                          value: 100 - value,
                          color: Colors.deepPurple.shade100,
                          title: '',
                          radius: radius,
                          showTitle: true,
                          titleStyle: TextStyle(
                            color: Colors.white,
                            fontSize: chartSize * 0.07,
                          ),
                        ),
                      ],
                      centerSpaceRadius: centerRadius,
                      sectionsSpace: 0,
                      startDegreeOffset: 270,
                    ),
                  );
                },
              ),
            ),
            Text(
              '$value % \n $title',
              textAlign: TextAlign.center,
              style: getProfileTitleLogginDateStyle(size),
            ),
          ],
        ),
      ),
    );
  }
}
