import 'package:admin_dashboard/presentations/users/data/repositories_implement_source/user_repository_imp.dart';
import 'package:admin_dashboard/presentations/users/domain/use_cases/add_user_use_case.dart';
import 'package:admin_dashboard/presentations/users/presentation/logic/bloc/add_user/add_user_bloc.dart';
import 'package:admin_dashboard/presentations/users/presentation/middleware/user_middleware.dart';
import 'package:admin_dashboard/presentations/users/presentation/widgets/add_user/add_user_items.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddUserPage extends StatelessWidget {
  final UserMiddleware _userMiddleware = UserMiddleware().get();
  AddUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AddUserBloc>(
          create:
              (context) => AddUserBloc(
                addUserUseCase: AddUserUseCase(
                  userRepository: UserRepositoryImp(),
                ),
                userMiddleware: _userMiddleware,
              ),
        ),
      ],
      child: AddUserItems(),
    );
  }
}
