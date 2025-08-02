import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:admin_dashboard/presentations/monitoring_history/presentation/logic/bloc/monitoring_history_bloc.dart';
import 'package:admin_dashboard/presentations/monitoring_history/presentation/widgets/monitoring_history_list_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class MonitoryingHistoryItems extends StatelessWidget {
  ChangePageEvent backWordk;
  MonitoryingHistoryItems({required this.backWordk, super.key});

  @override
  Widget build(BuildContext context) {
    final moreInfo = MediaQuery.sizeOf(context);

    return BlocBuilder<ChangePageBloc, ChangePageState>(
      builder: (context, state) {
        return AnimatedOpacity(
          opacity: state is MoveToHistoryPageState ? 1 : 0,
          duration: const Duration(milliseconds: 500),
          child:
              state is MoveToHistoryPageState
                  ? MonitoringHistoryListItems(
                    globalKey:
                        context
                            .watch<MonitoringHistoryBloc>()
                            .monitoringHistoryMiddleware
                            .getGlobalKey(),
                    backWordk: backWordk,
                    size: moreInfo,
                  )
                  : const SizedBox(),
        );
      },
    );
  }
}
