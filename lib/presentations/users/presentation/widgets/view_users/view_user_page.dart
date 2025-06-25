import 'package:admin_dashboard/presentations/users/data/repositories_implement_source/user_repository_imp.dart';
import 'package:admin_dashboard/presentations/users/domain/use_cases/activate_user_use_case.dart';
import 'package:admin_dashboard/presentations/users/domain/use_cases/get_user_info_use_case.dart';
import 'package:admin_dashboard/presentations/users/domain/use_cases/un_active_user_use_case.dart';
import 'package:admin_dashboard/presentations/users/presentation/logic/bloc/view_user/view_user_bloc.dart';
import 'package:admin_dashboard/presentations/users/presentation/logic/cubit/cubit/active_user_cubit.dart';
import 'package:admin_dashboard/presentations/users/presentation/middleware/user_middleware.dart';
import 'package:admin_dashboard/presentations/users/presentation/widgets/view_users/view_user_items.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ViewUserPage extends StatelessWidget {
  final UserMiddleware _userMiddleware = UserMiddleware().get();
  int id;
  ViewUserPage({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ViewUserBloc>(
          create:
              (context) => ViewUserBloc(
                activateUserUseCase: ActivateUserUseCase(
                  userRepository: UserRepositoryImp(),
                ),
                unActiveUserUseCase: UnActiveUserUseCase(
                  userRepository: UserRepositoryImp(),
                ),
                getUserInfoUseCase: GetUserInfoUseCase(
                  userRepository: UserRepositoryImp(),
                ),
                userMiddleware: _userMiddleware,
              )..add(GetUserInformationEvent(id: id)),
        ),
        BlocProvider(
          create: (context) => ActiveUserCubit(userMiddleware: _userMiddleware),
        ),
      ],
      child: ViewUserItems(),
    );
  }
}
