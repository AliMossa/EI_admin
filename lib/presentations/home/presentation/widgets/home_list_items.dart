import 'package:admin_dashboard/presentations/home/presentation/logic/bloc/success_statistics_bloc.dart';
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
      width: moreInfo.width * .8,
      height: moreInfo.height * .8,
      child: ListView(
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
          Center(child: PieChartWidget(size: moreInfo)),
        ],
      ),
    );
  }
}
