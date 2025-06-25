import 'package:admin_dashboard/presentations/public/shimmers/list_search_shimmer.dart';
import 'package:admin_dashboard/presentations/users/presentation/logic/bloc/view_user/view_user_bloc.dart';
import 'package:admin_dashboard/presentations/users/presentation/widgets/view_users/active_switch_button_widget.dart';
import 'package:admin_dashboard/presentations/users/presentation/widgets/view_users/view_user_logging_page.dart';
import 'package:admin_dashboard/presentations/users/presentation/widgets/view_users/view_user_variable_widget.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ViewUserInfoWidget extends StatelessWidget {
  Size size;
  int id;
  ViewUserInfoWidget({required this.id, required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ViewUserBloc, ViewUserState>(
      listener: (context, state) {
        if (state is SuccessActivateUserState ||
            state is SuccessUnActivateUserState) {
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            Container(
              height: size.height * .35,
              width: size.width * .41,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: background,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: linkColor),
              ),
              child:
                  state is LoadingGetUserInformationState
                      ? ListSearchShimmer(size: size)
                      : Column(
                        children: [
                          ViewUserVariableWidget(
                            value:
                                context
                                    .read<ViewUserBloc>()
                                    .userMiddleware
                                    .getUserInfo()
                                    .fullName,
                            size: size,
                            title: 'name',
                            widthSizeFactor: .33,
                          ),
                          ViewUserVariableWidget(
                            value:
                                context
                                    .read<ViewUserBloc>()
                                    .userMiddleware
                                    .getUserInfo()
                                    .email,
                            size: size,
                            title: 'email',
                            widthSizeFactor: .33,
                          ),
                          ViewUserVariableWidget(
                            value:
                                context
                                    .read<ViewUserBloc>()
                                    .userMiddleware
                                    .getUserInfo()
                                    .phone,
                            size: size,
                            title: 'phone',
                            widthSizeFactor: .33,
                          ),

                          SizedBox(
                            width: size.width * .35,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ActiveSwitchButtonWidget(
                                  id:
                                      context
                                          .read<ViewUserBloc>()
                                          .userMiddleware
                                          .getUserInfo()
                                          .id,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
            ),
            const SizedBox(height: 10),
            ViewUserLoggingPage(
              id: id,
              size: size,
              employeeName:
                  context
                      .read<ViewUserBloc>()
                      .userMiddleware
                      .getUserInfo()
                      .fullName,
            ),
          ],
        );
      },
    );
  }
}
