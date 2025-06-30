import 'package:admin_dashboard/presentations/home/domain/entities/requests_statistics_entity.dart';
import 'package:admin_dashboard/presentations/home/presentation/logic/bloc/requests_statistics_bloc.dart';
import 'package:admin_dashboard/presentations/home/presentation/widgets/single_pie_chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class CollectSinglPieCahrtsWidget extends StatelessWidget {
  String firstText;
  String secondText;
  String thirdText;
  Size size;
  Color firstColor;
  Color secondColor;
  Color thirdColor;
  RequestsStatisticsEntity requestsStatisticsEntity;

  CollectSinglPieCahrtsWidget({
    required this.firstText,
    required this.secondText,
    required this.thirdColor,
    required this.firstColor,
    required this.secondColor,
    required this.thirdText,
    required this.size,
    required this.requestsStatisticsEntity,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RequestsStatisticsBloc, RequestsStatisticsState>(
      builder: (context, state) {
        return context
            .read<RequestsStatisticsBloc>()
            .homeMiddleware
            .getCorrectWidgetForRequestsStatistics(context, state, size)
            .fold(
              (_) => LayoutBuilder(
                builder: (context, constraints) {
                  final crossAxisCount = (constraints.maxWidth / 200)
                      .floor()
                      .clamp(1, 4);
                  final rowCount = (3 / crossAxisCount).ceil();
                  return SizedBox(
                    height: rowCount * 350 + (rowCount - 1) * 10,
                    child: GridView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 400,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: 1,
                      ),

                      children: [
                        SinglePieChartWidget(
                          value: requestsStatisticsEntity.acceptedByAdmin,
                          size: size,
                          color: firstColor,
                          title: firstText,
                        ),
                        SinglePieChartWidget(
                          value: requestsStatisticsEntity.rejectedByLawyer,
                          size: size,
                          color: secondColor,
                          title: secondText,
                        ),
                        SinglePieChartWidget(
                          value: requestsStatisticsEntity.rejectedByUser,
                          size: size,
                          color: thirdColor,
                          title: thirdText,
                        ),
                      ],
                    ),
                  );
                },
              ),
              (widget) => widget,
            );
      },
      listener:
          (BuildContext context, RequestsStatisticsState state) => context
              .read<RequestsStatisticsBloc>()
              .homeMiddleware
              .showCorrectState(context, state),
    );
  }
}
