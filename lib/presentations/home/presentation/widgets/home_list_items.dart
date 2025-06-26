import 'package:admin_dashboard/presentations/home/presentation/logic/bloc/statistics_of_users_bloc.dart';
import 'package:admin_dashboard/presentations/home/presentation/logic/success_statistics/success_statistics_bloc.dart';
import 'package:admin_dashboard/presentations/home/presentation/widgets/liner_chart_widget.dart';
import 'package:admin_dashboard/presentations/home/presentation/widgets/pie_chart_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeListItems extends StatelessWidget {
  const HomeListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final moreInfo = MediaQuery.sizeOf(context);
    return SizedBox(
      width: moreInfo.width * .81,
      height: moreInfo.height * .8,
      child: ListView(
        children: [
          Row(
            children: [
              LinerChartWidget(
                list:
                    context
                        .watch<SuccessStatisticsBloc>()
                        .homeMiddleware
                        .getSuccessStatisticsEntity(),
                maxValue: 100,
                minValue: 0,
                size: moreInfo,
              ),
              SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  PieChartWidget(
                    size: moreInfo,
                    totalStatisticsOfUsesEntity:
                        context
                            .watch<StatisticsOfUsersBloc>()
                            .homeMiddleware
                            .getTotalStatisticsOfUsesEntity(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
