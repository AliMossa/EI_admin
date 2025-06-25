import 'package:admin_dashboard/presentations/profile/presentation/logic/bloc/profile_logs_bloc.dart';
import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:admin_dashboard/presentations/public/monitoring_history/presentation/widgets/monitoring_history_item.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class LogsListWidget extends StatelessWidget {
  Size size;
  LogsListWidget({required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed:
              () => context.read<ChangePageBloc>().add(
                MoveToProfilePageEvent(title: 'Profile'),
              ),
          icon: Icon(Icons.keyboard_arrow_left_rounded),
        ),
        BlocBuilder<ProfileLogsBloc, ProfileLogsState>(
          builder: (context, state) {
            return SizedBox(
              height: size.height * .77,
              width: size.width * .8,
              child: NotificationListener(
                onNotification: (ScrollNotification notification) {
                  if (notification.metrics.pixels ==
                      notification.metrics.maxScrollExtent) {
                    context.read<ProfileLogsBloc>().add(
                      ReGetProfileLogsEvent(),
                    );
                  }
                  return false;
                },
                child: ListView.builder(
                  itemCount:
                      context
                          .watch<ProfileLogsBloc>()
                          .profileMiddleware
                          .getTotalProfileLogsEntity()
                          .list
                          .length,
                  itemBuilder:
                      (context, index) =>
                          index ==
                                      context
                                              .watch<ProfileLogsBloc>()
                                              .profileMiddleware
                                              .getTotalProfileLogsEntity()
                                              .list
                                              .length -
                                          1 &&
                                  state is LoadingReGetProfileLogsState
                              ? Center(
                                child: CircularProgressIndicator(
                                  color: textFieldBorder,
                                ),
                              )
                              : MonitoringHistoryItem(
                                size: size,
                                title:
                                    context
                                        .watch<ProfileLogsBloc>()
                                        .profileMiddleware
                                        .getTotalProfileLogsEntity()
                                        .list[index]
                                        .message,
                                time:
                                    context
                                        .watch<ProfileLogsBloc>()
                                        .profileMiddleware
                                        .getTotalProfileLogsEntity()
                                        .list[index]
                                        .time,
                              ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
