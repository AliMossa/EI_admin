import 'package:admin_dashboard/gen/assets.gen.dart';
import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/add_member_button_widget.dart';
import 'package:admin_dashboard/presentations/public/shimmers/list_search_shimmer.dart';
import 'package:admin_dashboard/presentations/users/presentation/logic/bloc/users_bloc.dart';
import 'package:admin_dashboard/presentations/users/presentation/logic/cubit/type/users_type_cubit.dart';
import 'package:admin_dashboard/presentations/users/presentation/models/drop_down_user_state_model.dart';
import 'package:admin_dashboard/presentations/users/presentation/widgets/drop_down_menu_widget.dart';
import 'package:admin_dashboard/presentations/users/presentation/widgets/users_list_members_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersMembersWidget extends StatelessWidget {
  const UsersMembersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final moreInfo = MediaQuery.sizeOf(context);

    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            DropDownMenuWidget(
              size: moreInfo,
              currntValue:
                  context
                      .watch<UsersTypeCubit>()
                      .userMiddleware
                      .getSelectedUsersState(),
              kinds: DropDownUserStateModel().listStates,
              onPressed:
                  (value) => context
                      .read<UsersTypeCubit>()
                      .userMiddleware
                      .changeSelectedUserState(
                        value,
                        context.read<UsersTypeCubit>(),
                        context.read<UsersBloc>(),
                      ),
            ),
            UsersListMembersWidget(size: moreInfo),
          ],
        ),
        AddMemberButtonWidget(
          onPress:
              () => context.read<ChangePageBloc>().add(
                MoveToAddUserPageEvent(title: 'Users'),
              ),
        ),
      ],
    );
  }
}
