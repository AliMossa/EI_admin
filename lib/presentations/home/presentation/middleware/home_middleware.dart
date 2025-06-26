import 'package:admin_dashboard/presentations/home/domain/entities/list_success_statistics_entity.dart';
import 'package:admin_dashboard/presentations/home/domain/entities/statistics_of_users_entity.dart';
import 'package:admin_dashboard/presentations/home/domain/entities/total_statistics_of_uses_entity.dart';
import 'package:admin_dashboard/presentations/home/presentation/logic/bloc/statistics_of_users_bloc.dart';
import 'package:admin_dashboard/presentations/home/presentation/logic/success_statistics/success_statistics_bloc.dart';
import 'package:admin_dashboard/presentations/public/shimmers/liner_chart_shimmer.dart';
import 'package:admin_dashboard/presentations/public/shimmers/pie_shimmer.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeMiddleware {
  ListSuccessStatisticsEntity _successStatisticsEntity =
      ListSuccessStatisticsEntity.init();
  TotalStatisticsOfUsesEntity _totalStatisticsOfUsesEntity =
      TotalStatisticsOfUsesEntity.init();

  void setSuccessStatisticsEntity(ListSuccessStatisticsEntity newStatistics) =>
      _successStatisticsEntity.statics = newStatistics.statics;

  ListSuccessStatisticsEntity getSuccessStatisticsEntity() =>
      _successStatisticsEntity;

  TotalStatisticsOfUsesEntity getTotalStatisticsOfUsesEntity() =>
      _totalStatisticsOfUsesEntity;
  void setStatisticsOfUsersEntity(
    StatisticsOfUsersEntity statisticsOfUsersEntity,
  ) {
    _totalStatisticsOfUsesEntity.adminsPercent = getPercentage(
      statisticsOfUsersEntity,
      statisticsOfUsersEntity.admins,
    );
    _totalStatisticsOfUsesEntity.economicTeamPercent = getPercentage(
      statisticsOfUsersEntity,
      statisticsOfUsersEntity.economicTeams,
    );
    _totalStatisticsOfUsesEntity.legalTeamPercent = getPercentage(
      statisticsOfUsersEntity,
      statisticsOfUsersEntity.legalTeams,
    );
    _totalStatisticsOfUsesEntity.invesetorsPercent = getPercentage(
      statisticsOfUsersEntity,
      statisticsOfUsersEntity.investors,
    );

    _totalStatisticsOfUsesEntity
        .statisticsOfUsersEntity = StatisticsOfUsersEntity(
      admins: statisticsOfUsersEntity.admins,
      investors: statisticsOfUsersEntity.investors,
      economicTeams: statisticsOfUsersEntity.economicTeams,
      legalTeams: statisticsOfUsersEntity.legalTeams,
    );
  }

  double getPercentage(StatisticsOfUsersEntity statics, int amount) {
    int max =
        statics.admins +
        statics.economicTeams +
        statics.investors +
        statics.legalTeams;
    return amount > 0
        ? double.parse(((amount * 100) / max).toStringAsFixed(1))
        : 0;
  }

  Either<Widget, Widget> getCorrectWidgetForLinerChart(
    BuildContext context,
    SuccessStatisticsState state,
    Size size,
  ) {
    if (state is LoadingGetSuccessStatisticsState) {
      return right(LinerChartShimmer(size: size));
    } else {
      return left(const SizedBox());
    }
  }

  Either<Widget, Widget> getCorrectWidgetForPieChart(
    BuildContext context,
    StatisticsOfUsersState state,
    Size size,
  ) {
    if (state is LoadingGetStatisticsOfusersState) {
      return right(PieShimmer(size: size));
    } else {
      return left(const SizedBox());
    }
  }
}
