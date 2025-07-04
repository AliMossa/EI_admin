import 'package:admin_dashboard/presentations/home/domain/entities/total_statistics_of_uses_entity.dart';
import 'package:admin_dashboard/presentations/home/presentation/logic/statistics_of_users/statistics_of_users_bloc.dart';
import 'package:admin_dashboard/presentations/home/presentation/widgets/pie_texts_widget.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class PieChartWidget extends StatelessWidget {
  Size size;
  TotalStatisticsOfUsesEntity totalStatisticsOfUsesEntity;
  PieChartWidget({
    required this.totalStatisticsOfUsesEntity,
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StatisticsOfUsersBloc, StatisticsOfUsersState>(
      builder: (context, state) {
        return context
            .read<StatisticsOfUsersBloc>()
            .homeMiddleware
            .getCorrectWidgetForPieChart(context, state, size)
            .fold(
              (_) => Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  gradient: mainGradient3,
                  borderRadius: BorderRadius.circular(20),
                ),

                height: size.height * .3,
                child: ListView(
                  // itemExtent: size.width * .15,
                  physics: const BouncingScrollPhysics(
                    decelerationRate: ScrollDecelerationRate.normal,
                  ),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PieTextsWidget(
                          size: size,
                          title: 'admin',
                          value:
                              totalStatisticsOfUsesEntity
                                  .statisticsOfUsersEntity
                                  .admins,
                          color: coral,
                        ),
                        PieTextsWidget(
                          size: size,
                          title: 'invesetors',
                          value:
                              totalStatisticsOfUsesEntity
                                  .statisticsOfUsersEntity
                                  .investors,
                          color: textFieldBorder,
                        ),

                        PieTextsWidget(
                          size: size,
                          title: 'legal teams',
                          value:
                              totalStatisticsOfUsesEntity
                                  .statisticsOfUsersEntity
                                  .legalTeams,
                          color: sky,
                        ),
                        PieTextsWidget(
                          size: size,
                          title: 'economic teams',
                          value:
                              totalStatisticsOfUsesEntity
                                  .statisticsOfUsersEntity
                                  .economicTeams,
                          color: graphite,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: size.width * .18,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            final chartSize = constraints.biggest.shortestSide;
                            final radius = chartSize * 0.25;
                            return PieChart(
                              curve: Curves.easeInBack,
                              duration: const Duration(milliseconds: 200),
                              PieChartData(
                                sections: [
                                  PieChartSectionData(
                                    value:
                                        totalStatisticsOfUsesEntity
                                            .adminsPercent,
                                    color: coral,
                                    title:
                                        '${totalStatisticsOfUsesEntity.adminsPercent}%',
                                    radius: radius,
                                    showTitle: true,
                                    titleStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                  PieChartSectionData(
                                    value:
                                        totalStatisticsOfUsesEntity
                                            .invesetorsPercent,
                                    color: textFieldBorder,
                                    title:
                                        '${totalStatisticsOfUsesEntity.invesetorsPercent}%',
                                    radius: radius,
                                    titleStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                  PieChartSectionData(
                                    value:
                                        totalStatisticsOfUsesEntity
                                            .economicTeamPercent,
                                    color: graphite,
                                    title:
                                        '${totalStatisticsOfUsesEntity.economicTeamPercent}%',
                                    radius: radius,
                                    titleStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                  PieChartSectionData(
                                    value:
                                        totalStatisticsOfUsesEntity
                                            .legalTeamPercent,
                                    color: sky,
                                    title:
                                        '${totalStatisticsOfUsesEntity.legalTeamPercent}%',
                                    radius: radius,
                                    titleStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                                centerSpaceRadius: 40,
                                sectionsSpace: 2,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              (widget) => widget,
            );
      },
    );
  }
}
