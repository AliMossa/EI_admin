import 'package:admin_dashboard/presentations/home/domain/entities/list_success_statistics_entity.dart';
import 'package:admin_dashboard/presentations/home/domain/entities/monies_rates_entity.dart';
import 'package:admin_dashboard/presentations/home/domain/entities/requests_statistics_entity.dart';
import 'package:admin_dashboard/presentations/home/domain/entities/statistics_of_users_entity.dart';
import 'package:admin_dashboard/presentations/home/domain/entities/success_statistics_entity.dart';
import 'package:admin_dashboard/presentations/home/domain/entities/total_statistics_of_uses_entity.dart';
import 'package:admin_dashboard/presentations/home/presentation/logic/bloc/requests_statistics_bloc.dart';
import 'package:admin_dashboard/presentations/home/presentation/logic/cubit/statistics_date_cubit.dart';
import 'package:admin_dashboard/presentations/home/presentation/logic/monies_rates/monies_rates_bloc.dart';
import 'package:admin_dashboard/presentations/home/presentation/logic/statistics_of_users/statistics_of_users_bloc.dart';
import 'package:admin_dashboard/presentations/home/presentation/logic/success_statistics/success_statistics_bloc.dart';
import 'package:admin_dashboard/presentations/public/error_widget/snack_bar_widget.dart';
import 'package:admin_dashboard/presentations/public/shimmers/liner_chart_shimmer.dart';
import 'package:admin_dashboard/presentations/public/shimmers/monies_rates_shimmer.dart';
import 'package:admin_dashboard/presentations/public/shimmers/pie_shimmer.dart';
import 'package:admin_dashboard/presentations/public/shimmers/row_pie_chart_shimmer.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

bool showError = false;

class HomeMiddleware {
  String _time = DateTime.now().year.toString();
  ListSuccessStatisticsEntity _successStatisticsEntity =
      ListSuccessStatisticsEntity.init();
  TotalStatisticsOfUsesEntity _totalStatisticsOfUsesEntity =
      TotalStatisticsOfUsesEntity.init();

  MoniesRatesEntity _moniesRatesEntity = MoniesRatesEntity.init();
  RequestsStatisticsEntity _requestsStatisticsEntity =
      RequestsStatisticsEntity.init();
  double _maxLineChartValue = 0;
  void setSuccessStatisticsEntity(ListSuccessStatisticsEntity newStatistics) {
    _successStatisticsEntity.statics = newStatistics.statics;
    getMax(_successStatisticsEntity.statics);
  }

  ListSuccessStatisticsEntity getSuccessStatisticsEntity() =>
      _successStatisticsEntity;

  TotalStatisticsOfUsesEntity getTotalStatisticsOfUsesEntity() =>
      _totalStatisticsOfUsesEntity;

  String getTime() => _time;

  MoniesRatesEntity getMoniesRatesEntity() => _moniesRatesEntity;
  double getMaxLineChartValue() => _maxLineChartValue;
  void setRequestsStatisticsEntity(
    RequestsStatisticsEntity newRequestsStatisticsEntity,
  ) {
    _requestsStatisticsEntity.acceptedByAdmin =
        newRequestsStatisticsEntity.acceptedByAdmin;
    _requestsStatisticsEntity.rejectedByLawyer =
        newRequestsStatisticsEntity.rejectedByLawyer;
    _requestsStatisticsEntity.rejectedByUser =
        newRequestsStatisticsEntity.rejectedByUser;
  }

  RequestsStatisticsEntity getRequestsStatisticsEntity() =>
      _requestsStatisticsEntity;
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

  void setMoniesRatesEntity(MoniesRatesEntity newMoniesRatesEntity) {
    _moniesRatesEntity.USD = newMoniesRatesEntity.USD;
    _moniesRatesEntity.SYR = newMoniesRatesEntity.SYR;
    _moniesRatesEntity.EUR = newMoniesRatesEntity.EUR;
    _moniesRatesEntity.JPY = newMoniesRatesEntity.JPY;
    _moniesRatesEntity.TRY = newMoniesRatesEntity.TRY;
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

  Either<Widget, Widget> getCorrectWidgetForMoniesRates(
    BuildContext context,
    MoniesRatesState state,
    Size size,
  ) {
    if (state is LoadingGetAllMoniesRatesState) {
      return right(MoniesRatesShimmer(size: size));
    } else {
      return left(const SizedBox());
    }
  }

  void showCorrectState(BuildContext context, RequestsStatisticsState state) {
    if (state is FailedGetAllRequestsStatisticsState) {
      showErrorFunction(context, state.message);
    }
  }

  Either<Widget, Widget> getCorrectWidgetForRequestsStatistics(
    BuildContext context,
    RequestsStatisticsState state,
    Size size,
  ) {
    if (state is LoadingGetAllRequestsStatisticsState) {
      return right(RowPieChartShimmer(size: size));
    } else {
      return left(const SizedBox());
    }
  }

  void showViewEmployeesFailedMessage(
    BuildContext context,
    MoniesRatesState state,
  ) {
    if (state is FailedGetAllMoniesRatesState) {
      showErrorFunction(context, state.message);
    }
  }

  void getMax(List<SuccessStatisticsEntity> list) {
    list.sort((a, b) => a.value.compareTo(b.value));
    _maxLineChartValue = list.first.value + 10;
  }

  void showErrorFunction(BuildContext context, String content) async {
    if (!showError) {
      showError = true;

      SnackBarWidget().show(context, content, Colors.red);
      await Future.delayed(
        const Duration(seconds: 2),
      ).whenComplete(() => showError = false);
    }
  }

  void setDate(BuildContext context, StatisticsDateCubit cubit) async {
    showDialog(
      context: context,
      builder: (context) {
        return BlocProvider.value(
          value: cubit,
          child: BlocBuilder<StatisticsDateCubit, StatisticsDateState>(
            builder: (context, state) {
              return AlertDialog(
                title: Text("Select Year"),
                content: SizedBox(
                  width: 300,
                  height: 300,
                  child: YearPicker(
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now(),
                    selectedDate: DateTime(int.parse(_time)),
                    onChanged: (DateTime result) {
                      Navigator.of(context).pop(); // close dialog
                      if (result != null) {
                        _time = result.year.toString();
                        // ignore: use_build_context_synchronously
                        context
                            .read<StatisticsDateCubit>()
                            .setStatististicsDate();
                      }
                    },
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  void sendManyRequests(BuildContext context, StatisticsDateState state) async {
    if (state is SetStatisticsDateState) {
      context.read<MoniesRatesBloc>().add(GetAllMoniesRatesEvent());
      context.read<SuccessStatisticsBloc>().add(
        GetSuccessStatisticsEvent(year: int.parse(_time)),
      );
      context.read<RequestsStatisticsBloc>().add(
        GetAllRequestsStatisticsEvent(year: int.parse(_time)),
      );
      context.read<StatisticsOfUsersBloc>().add(GetStatisticsOfusersEvent());
    }
  }
}
