import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogPageIconButtonWidget extends StatelessWidget {
  const LogPageIconButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: InkWell(
          onTap:
              () => context.read<ChangePageBloc>().add(
                MoveToLoggingProfilePageEvent(title: 'Profile'),
              ),
          child: Icon(Icons.access_time_rounded, color: black75),
        ),
      ),
    );
  }
}
