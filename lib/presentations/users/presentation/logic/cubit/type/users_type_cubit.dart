import 'package:admin_dashboard/presentations/users/presentation/middleware/user_middleware.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'users_type_state.dart';

class UsersTypeCubit extends Cubit<UsersTypeState> {
  UserMiddleware userMiddleware;
  UsersTypeCubit({required this.userMiddleware}) : super(UsersTypeInitial());
  void changeUserState() {
    emit(LoadingChangeUsersTypeState());
    emit(ChangeUsersTypeState());
  }
}
