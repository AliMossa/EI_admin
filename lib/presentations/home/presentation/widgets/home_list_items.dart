import 'package:admin_dashboard/presentations/home/presentation/logic/bloc/requests_statistics_bloc.dart';
import 'package:admin_dashboard/presentations/home/presentation/logic/monies_rates/monies_rates_bloc.dart';
import 'package:admin_dashboard/presentations/home/presentation/logic/statistics_of_users/statistics_of_users_bloc.dart';
import 'package:admin_dashboard/presentations/home/presentation/logic/success_statistics/success_statistics_bloc.dart';
import 'package:admin_dashboard/presentations/home/presentation/widgets/collect_singl_pie_cahrts_widget.dart';
import 'package:admin_dashboard/presentations/home/presentation/widgets/liner_chart_widget.dart';
import 'package:admin_dashboard/presentations/home/presentation/widgets/money_rates_widget.dart';
import 'package:admin_dashboard/presentations/home/presentation/widgets/pie_chart_widget.dart';
import 'package:admin_dashboard/presentations/home/presentation/widgets/single_pie_chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeListItems extends StatelessWidget {
  const HomeListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final moreInfo = MediaQuery.sizeOf(context);
    return SizedBox(
      width: moreInfo.width * .81,
      height: moreInfo.height * .85,
      child: ListView(
        shrinkWrap: true,

        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LinerChartWidget(
                list:
                    context
                        .watch<SuccessStatisticsBloc>()
                        .homeMiddleware
                        .getSuccessStatisticsEntity(),
                maxValue:
                    context
                        .read<SuccessStatisticsBloc>()
                        .homeMiddleware
                        .getMaxLineChartValue(),
                minValue: 0,
                size: moreInfo,
              ),
              SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  MoneyRatesWidget(
                    size: moreInfo,
                    moniesRatesEntity:
                        context
                            .watch<MoniesRatesBloc>()
                            .homeMiddleware
                            .getMoniesRatesEntity(),
                  ),
                  SizedBox(height: 10),
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
          SizedBox(height: 10),

          CollectSinglPieCahrtsWidget(
            size: moreInfo,
            firstColor: Colors.green,
            secondColor: Colors.deepPurple,
            thirdColor: Colors.red,
            firstText: 'requests accepted \n by admins',
            secondText: 'requests rejected \n by lawyers',
            thirdText: 'requests rejected \n by users',
            requestsStatisticsEntity:
                context
                    .watch<RequestsStatisticsBloc>()
                    .homeMiddleware
                    .getRequestsStatisticsEntity(),
          ),
        ],
      ),
    );
  }
}
