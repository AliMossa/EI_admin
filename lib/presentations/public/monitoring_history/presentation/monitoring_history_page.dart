import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:admin_dashboard/presentations/public/monitoring_history/data/repository_source/logs_repository_imp_source.dart';
import 'package:admin_dashboard/presentations/public/monitoring_history/domain/use_cases/get_logs_use_case.dart';
import 'package:admin_dashboard/presentations/public/monitoring_history/presentation/logic/bloc/monitoring_history_bloc.dart';
import 'package:admin_dashboard/presentations/public/monitoring_history/presentation/middleware/monitoring_history_middleware.dart';
import 'package:admin_dashboard/presentations/public/monitoring_history/presentation/widgets/monitoring_history_item_widget.dart';
import 'package:admin_dashboard/presentations/public/monitoring_history/presentation/widgets/monitorying_history_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class MonitoringHistoryPage extends StatelessWidget {
  int id;
  ChangePageEvent backWordk;

  MonitoringHistoryPage({required this.backWordk, required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MonitoringHistoryBloc>(
      create:
          (context) => MonitoringHistoryBloc(
            monitoringHistoryMiddleware: MonitoringHistoryMiddleware(),
            getLogsUseCase: GetLogsUseCase(
              monitoringHistoryRepository: LogsRepositoryImpSource(),
            ),
          )..add(GetMonitoringHistoryEvent(id: id)),
      child: MonitoryingHistoryItems(backWordk: backWordk),
    );
  }
}
