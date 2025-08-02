import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:admin_dashboard/presentations/monitoring_history/presentation/logic/bloc/monitoring_history_bloc.dart';
import 'package:admin_dashboard/presentations/monitoring_history/presentation/widgets/monitoring_history_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class MonitoringHistoryListItems extends StatelessWidget {
  GlobalKey globalKey;
  ChangePageEvent backWordk;
  Size size;
  MonitoringHistoryListItems({
    required this.globalKey,
    required this.backWordk,
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MonitoringHistoryBloc, MonitoringHistoryState>(
      builder: (context, state) {
        return SizedBox(
          width: size.width * .8,
          height: size.height * .8,
          child: ListView(
            children: [
              context
                  .watch<MonitoringHistoryBloc>()
                  .monitoringHistoryMiddleware
                  .getCorrectWidget(state, size)
                  .fold(
                    (_) => Column(
                      children: [
                        IconButton(
                          onPressed:
                              () =>
                                  context.read<ChangePageBloc>().add(backWordk),
                          icon: Icon(Icons.keyboard_arrow_left_rounded),
                        ),
                        SizedBox(
                          height: size.height * .77,
                          width: size.width * .8,
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
                            child: AnimatedList(
                              key: globalKey,
                              initialItemCount:
                                  context
                                      .watch<MonitoringHistoryBloc>()
                                      .monitoringHistoryMiddleware
                                      .getTotalLogsEntity()
                                      .logs
                                      .length,
                              itemBuilder:
                                  (context, index, animation) => FadeTransition(
                                    opacity: animation.drive(
                                      Tween(begin: 0, end: 1),
                                    ),
                                    child: MonitoringHistoryItemWidget(
                                      size: size,
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
                        ),
                      ],
                    ),
                    (widget) => widget,
                  ),
            ],
          ),
        );
      },
    );
  }
}
