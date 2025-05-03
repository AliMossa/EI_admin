import 'package:admin_dashboard/presentations/profile/presentation/widgets/infromation_profile_widget.dart';
import 'package:admin_dashboard/presentations/profile/presentation/widgets/view_logging_page_widget.dart';
import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileItems extends StatelessWidget {
  Size size;
  ProfileItems({required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangePageBloc, ChangePageState>(
      builder:
          (context, state) => Stack(
            children: [
              AnimatedOpacity(
                opacity: state is MoveToProfilePageState ? 1 : 0,
                duration: Duration(milliseconds: 400),
                child:
                    state is MoveToProfilePageState
                        ? InfromationProfileWidget(size: size)
                        : SizedBox(),
              ),
              AnimatedOpacity(
                opacity: state is MoveToLoggingProfilePageState ? 1 : 0,
                duration: Duration(milliseconds: 400),
                child:
                    state is MoveToLoggingProfilePageState
                        ? ViewLoggingPageWidget(size: size)
                        : SizedBox(),
              ),
            ],
          ),
    );
  }
}
