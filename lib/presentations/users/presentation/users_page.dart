import 'package:admin_dashboard/presentations/users/data/repositories_implement_source/user_repository_imp.dart';
import 'package:admin_dashboard/presentations/users/domain/use_cases/get_users_use_case.dart';
import 'package:admin_dashboard/presentations/users/domain/use_cases/re_get_users_use_case.dart';
import 'package:admin_dashboard/presentations/users/presentation/logic/bloc/users_bloc.dart';
import 'package:admin_dashboard/presentations/users/presentation/logic/cubit/type/users_type_cubit.dart';
import 'package:admin_dashboard/presentations/users/presentation/middleware/user_middleware.dart';
import 'package:admin_dashboard/presentations/users/presentation/widgets/users_items.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersPage extends StatelessWidget {
  final UserMiddleware _userMiddleware = UserMiddleware().get();

  UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UsersBloc>(
          create:
              (context) => UsersBloc(
                reGetUsersUseCase: ReGetUsersUseCase(
                  userRepository: UserRepositoryImp(),
                ),
                getUsersUseCase: GetUsersUseCase(
                  userRepository: UserRepositoryImp(),
                ),
                userMiddleware: _userMiddleware,
              )..add(GetUserEvent()),
        ),
        BlocProvider<UsersTypeCubit>(
          create: (context) => UsersTypeCubit(userMiddleware: _userMiddleware),
        ),
      ],
      child: const UsersItems(),
    );
  }
}
