import 'package:admin_dashboard/gen/assets.gen.dart';
import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/item_list_widget.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/status_item_widget.dart';
import 'package:admin_dashboard/presentations/users/presentation/logic/bloc/users_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class UsersListMembersWidget extends StatelessWidget {
  Size size;
  UsersListMembersWidget({required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersBloc, UsersState>(
      builder: (context, state) {
        return SizedBox(
          height: size.height * .76,
          width: size.width * .8,

          child: context
              .read<UsersBloc>()
              .userMiddleware
              .getCorrectWidget(state, size)
              .fold(
                (_) => NotificationListener(
                  onNotification: (ScrollNotification notification) {
                    if (notification.metrics.pixels ==
                        notification.metrics.maxScrollExtent) {}
                    return false;
                  },
                  child: AnimatedList(
                    physics: BouncingScrollPhysics(),
                    key:
                        context
                            .watch<UsersBloc>()
                            .userMiddleware
                            .getAnimatedListGlobalKey(),
                    initialItemCount:
                        context
                            .watch<UsersBloc>()
                            .userMiddleware
                            .getUsersList()
                            .length,
                    shrinkWrap: true,
                    itemBuilder:
                        (context, index, animation) => FadeTransition(
                          opacity: animation.drive(
                            Tween<double>(begin: 0, end: 1),
                          ),
                          child: ItemListWidget(
                            name:
                                context
                                    .watch<UsersBloc>()
                                    .userMiddleware
                                    .getUsersList()[index]
                                    .fullName,
                            size: size,
                            status: [
                              StatusItemWidget(
                                date:
                                    context
                                        .watch<UsersBloc>()
                                        .userMiddleware
                                        .getUsersList()[index]
                                        .loggedIn,
                                size: size,
                                status: 'logged in',
                              ),
                            ],
                            date: '10-12-2025',
                            onPressed:
                                () => context.read<ChangePageBloc>().add(
                                  MoveToViewUserPageEvent(
                                    id:
                                        context
                                            .read<UsersBloc>()
                                            .userMiddleware
                                            .getUsersList()[index]
                                            .id,
                                    title: 'User',
                                  ),
                                ),
                          ),
                        ),
                  ),
                ),
                (widget) => widget,
              ),
        );
      },
    );
  }
}
