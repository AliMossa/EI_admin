import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:admin_dashboard/presentations/users/presentation/logic/bloc/view_user/view_user_bloc.dart';
import 'package:admin_dashboard/presentations/users/presentation/widgets/view_users/view_user_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ViewUserItems extends StatelessWidget {
  const ViewUserItems({super.key});

  @override
  Widget build(BuildContext context) {
    final moreInfo = MediaQuery.sizeOf(context);
    return BlocListener<ViewUserBloc, ViewUserState>(
      listener:
          (context, state) => context
              .read<ViewUserBloc>()
              .userMiddleware
              .showViewUserInfoFailedMessage(context, state),
      child: BlocBuilder<ChangePageBloc, ChangePageState>(
        builder: (pageContext, state) {
          return AnimatedOpacity(
            opacity: state is MoveToViewUserPageState ? 1 : 0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInBack,
            child:
                state is MoveToViewUserPageState
                    ? ViewUserInfoWidget(
                      size: moreInfo,
                      id:
                          context
                              .read<ViewUserBloc>()
                              .userMiddleware
                              .getUserInfo()
                              .id,
                    )
                    : SizedBox(),
          );
        },
      ),
    );
  }
}
