import 'package:admin_dashboard/presentations/profile/presentation/logic/bloc/profile_bloc.dart';
import 'package:admin_dashboard/presentations/profile/presentation/widgets/infromation_profile_widget.dart';
import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ProfileItems extends StatelessWidget {
  Size size;
  ProfileItems({required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener:
          (context, state) => context
              .read<ProfileBloc>()
              .profileMiddleware
              .showGetProfileFailedMessage(context, state),
      child: BlocBuilder<ChangePageBloc, ChangePageState>(
        builder:
            (context, state) => AnimatedOpacity(
              opacity: state is MoveToProfilePageState ? 1 : 0,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInBack,

              child:
                  state is MoveToProfilePageState
                      ? InfromationProfileWidget(
                        size: size,
                        profileEntity:
                            context
                                .watch<ProfileBloc>()
                                .profileMiddleware
                                .getProfileEntity(),
                      )
                      : SizedBox(),
            ),
      ),
    );
  }
}
