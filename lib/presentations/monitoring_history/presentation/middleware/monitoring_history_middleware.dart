import 'package:admin_dashboard/gen/assets.gen.dart';
import 'package:admin_dashboard/presentations/monitoring_history/domain/entities/logs_entity.dart';
import 'package:admin_dashboard/presentations/monitoring_history/domain/entities/total_logs_entity.dart';
import 'package:admin_dashboard/presentations/monitoring_history/presentation/logic/bloc/monitoring_history_bloc.dart';
import 'package:admin_dashboard/presentations/public/shimmers/search_shimmer.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MonitoringHistoryMiddleware {
  TotalLogsEntity _logsEntity = TotalLogsEntity.init();
  GlobalKey<AnimatedListState> _globalKey = GlobalKey<AnimatedListState>();
  List<LogsEntity> temp = [];
  GlobalKey<AnimatedListState> getGlobalKey() => _globalKey;
  void setTotalLogsEntity(
    TotalLogsEntity newTotalLogsEntity,
    bool doClean,
  ) async {
    if (doClean) {
      _logsEntity.logs.clear();
    }
    for (LogsEntity item in newTotalLogsEntity.logs.reversed) {
      await Future.delayed(const Duration(milliseconds: 150));
      _logsEntity.logs.add(item);
      _globalKey.currentState!.insertItem(_logsEntity.logs.length - 1);
    }
    _logsEntity.nextPage = _logsEntity.nextPage;
  }

  TotalLogsEntity getTotalLogsEntity() => _logsEntity;

  Either<Widget, Widget> getCorrectWidget(
    MonitoringHistoryState state,
    Size size,
  ) {
    if (state is LoadingGetMonitoringHistoryState) {
      return right(SearchShimmer(size: size));
    } else if (state is SuccessGetMonitoringHistoryState && temp.isEmpty) {
      return right(SvgPicture.asset(Assets.images.empty));
    } else if (state is FailedGetMonitoringHistoryState) {
      return right(
        SizedBox(
          width: size.width,
          child: SvgPicture.asset(Assets.images.error, fit: BoxFit.contain),
        ),
      );
    } else {
      return left(const SizedBox());
    }
  }
}
