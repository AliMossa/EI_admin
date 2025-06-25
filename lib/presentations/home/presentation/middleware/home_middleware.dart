import 'package:admin_dashboard/presentations/home/domain/entities/list_success_statistics_entity.dart';
import 'package:admin_dashboard/presentations/home/presentation/logic/bloc/success_statistics_bloc.dart';
import 'package:admin_dashboard/presentations/public/error_widget/snack_bar_widget.dart';
import 'package:admin_dashboard/presentations/public/shimmers/liner_chart_shimmer.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeMiddleware {
  ListSuccessStatisticsEntity _successStatisticsEntity =
      ListSuccessStatisticsEntity.init();

  void setSuccessStatisticsEntity(ListSuccessStatisticsEntity newStatistics) =>
      _successStatisticsEntity.statics = newStatistics.statics;

  ListSuccessStatisticsEntity getSuccessStatisticsEntity() =>
      _successStatisticsEntity;

  Either<Widget, Widget> getCorrectWidgetForLinerChart(
    BuildContext context,
    SuccessStatisticsState state,
  ) {
    if (state is LoadingGetSuccessStatisticsState) {
      return right(LinerChartShimmer());
    } else {
      return left(const SizedBox());
    }
  }
}
