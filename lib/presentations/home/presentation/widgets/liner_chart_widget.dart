import 'package:admin_dashboard/presentations/home/domain/entities/list_success_statistics_entity.dart';
import 'package:admin_dashboard/presentations/home/presentation/logic/success_statistics/success_statistics_bloc.dart';
import 'package:admin_dashboard/presentations/home/presentation/models/list_months_model.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math';

// ignore: must_be_immutable
class LinerChartWidget extends StatelessWidget {
  double maxValue;
  double minValue;
  ListSuccessStatisticsEntity list;
  Size size;
  LinerChartWidget({
    required this.list,
    required this.maxValue,
    required this.minValue,
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SuccessStatisticsBloc, SuccessStatisticsState>(
      builder: (context, state) {
        return context
            .read<SuccessStatisticsBloc>()
            .homeMiddleware
            .getCorrectWidgetForLinerChart(context, state, size)
            .fold(
              (_) => Container(
                padding: EdgeInsets.only(
                  top: 30,
                  right: 30,
                  left: 10,
                  bottom: 10,
                ),
                decoration: BoxDecoration(
                  gradient: mainGradient3,
                  borderRadius: BorderRadius.circular(20),
                ),

                width: size.width * .5,
                height: size.height * .6,
                child: LineChart(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.bounceIn,
                  LineChartData(
                    maxY: maxValue,
                    lineBarsData: [
                      LineChartBarData(
                        spots:
                            list.statics
                                .map(
                                  (item) =>
                                      FlSpot(item.id.toDouble(), item.value),
                                )
                                .toList(),
                        isCurved: true,
                        color: Colors.white30,
                        barWidth: 3,
                        isStrokeJoinRound: true,
                        dotData: FlDotData(show: true),
                        belowBarData: BarAreaData(
                          show: true,
                          color: Colors.black12,
                        ),
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
                                ListMonthsModel()
                                    .getCorrectMonth(value.toInt())
                                    .name,
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
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 5,
                                  ),
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
              ),
              (widget) => widget,
            );
      },
    );
  }
}
