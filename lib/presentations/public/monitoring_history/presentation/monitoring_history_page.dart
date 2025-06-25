import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:admin_dashboard/presentations/public/monitoring_history/presentation/logic/bloc/monitoring_history_bloc.dart';
import 'package:admin_dashboard/presentations/public/monitoring_history/presentation/middleware/monitoring_history_middleware.dart';
import 'package:admin_dashboard/presentations/public/monitoring_history/presentation/widgets/monitoring_history_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class MonitoringHistoryPage extends StatelessWidget {
  int id;
  ChangePageEvent backWordk;

  MonitoringHistoryPage({required this.backWordk, required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    final moreInfo = MediaQuery.sizeOf(context);
    return BlocProvider<MonitoringHistoryBloc>(
      create:
          (context) => MonitoringHistoryBloc(
            monitoringHistoryMiddleware: MonitoringHistoryMiddleware(),
          )..add(GetMonitoringHistoryEvent(id: id)),
      child: BlocBuilder<MonitoringHistoryBloc, MonitoringHistoryState>(
        builder: (context, state) {
          return BlocListener<ChangePageBloc, ChangePageState>(
            listener: (context, pageState) {
              if (pageState is MoveToHistoryPageState) {
                backWordk = pageState.backWordFunction;
                context.read<MonitoringHistoryBloc>().add(
                  GetMonitoringHistoryEvent(id: pageState.id),
                );
              }
            },
            child: Column(
              children: [
                IconButton(
                  onPressed:
                      () => context.read<ChangePageBloc>().add(backWordk!),
                  icon: Icon(Icons.keyboard_arrow_left_rounded),
                ),
                SizedBox(
                  height: moreInfo.height * .77,
                  width: moreInfo.width * .8,
                  child: NotificationListener(
                    onNotification: (ScrollNotification notification) {
                      if (notification.metrics.pixels ==
                          notification.metrics.maxScrollExtent) {
                        context.read<MonitoringHistoryBloc>().add(
                          ReGetMonitoringHistoryEvent(),
                        );
                      }
                      return false;
                    },
                    child: ListView.builder(
                      itemCount:
                          context
                              .watch<MonitoringHistoryBloc>()
                              .monitoringHistoryMiddleware
                              .getTotalLogsEntity()
                              .logs
                              .length,
                      itemBuilder:
                          (context, index) => MonitoringHistoryItem(
                            size: moreInfo,
                            title:
                                context
                                    .watch<MonitoringHistoryBloc>()
                                    .monitoringHistoryMiddleware
                                    .getTotalLogsEntity()
                                    .logs[index]
                                    .message,
                            time:
                                context
                                    .watch<MonitoringHistoryBloc>()
                                    .monitoringHistoryMiddleware
                                    .getTotalLogsEntity()
                                    .logs[index]
                                    .time,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
