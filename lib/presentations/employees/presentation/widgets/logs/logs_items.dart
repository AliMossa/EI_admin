import 'package:admin_dashboard/presentations/profile/presentation/widgets/logs/logs_list_widget.dart';
import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class LogsItems extends StatelessWidget {
  const LogsItems({super.key});

  @override
  Widget build(BuildContext context) {
    final moreInfo = MediaQuery.sizeOf(context);
    return BlocBuilder<ChangePageBloc, ChangePageState>(
      builder:
          (context, state) => AnimatedOpacity(
            opacity: state is MoveToLoggingProfilePageState ? 1 : 0,
            duration: const Duration(milliseconds: 500),
            child:
                state is MoveToLoggingProfilePageState
                    ? LogsListWidget(size: moreInfo)
                    : SizedBox(),
          ),
    );
  }
}

/*

*/
