import 'package:admin_dashboard/presentations/users/domain/entities/get_user_request_entity.dart';
import 'package:admin_dashboard/presentations/users/domain/use_cases/get_users_use_case.dart';
import 'package:admin_dashboard/presentations/users/domain/use_cases/re_get_users_use_case.dart';
import 'package:admin_dashboard/presentations/users/presentation/middleware/user_middleware.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:admin_dashboard/util/safe_storage/safe_storage.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UserMiddleware userMiddleware;
  GetUsersUseCase getUsersUseCase;
  ReGetUsersUseCase reGetUsersUseCase;
  UsersBloc({
    required this.reGetUsersUseCase,
    required this.getUsersUseCase,
    required this.userMiddleware,
  }) : super(UsersInitial()) {
    on<GetUserEvent>(getUser);
    on<ReGetUserEvent>(reGetUser);
  }
  void getUser(GetUserEvent event, Emitter<UsersState> emit) async {
    emit(LoadingGetUserState());
    try {
      String? token = await SafeStorage.read('token');
      final response = await getUsersUseCase(
        GetUserRequestEntity(
          active: userMiddleware.getSelectedUsersState(),
          token: token!,
        ),
      );
      response.fold(
        (failed) => emit(FailedGetUserState(message: failed.message)),
        (success) {
          userMiddleware.tempList = success.users;
          emit(SuccessGetUserState());

          userMiddleware.setUsersList(success.users, true);
        },
      );
    } on ServerAdminException catch (error) {
      emit(FailedGetUserState(message: error.message));
    } catch (error) {
      emit(FailedGetUserState(message: 'error'));
    }
  }

  void reGetUser(ReGetUserEvent event, Emitter<UsersState> emit) async {
    emit(LoadingReGetUserState());
    try {
      final response = await reGetUsersUseCase(event.link);
      response.fold(
        (failed) => emit(FailedReGetUserState(message: failed.message)),
        (success) {
          emit(SuccessReGetUserState());
          userMiddleware.setUsersList(success.users, false);
        },
      );
    } on ServerAdminException catch (error) {
      emit(FailedReGetUserState(message: error.message));
    } catch (error) {
      emit(FailedReGetUserState(message: 'error'));
    }
  }
}
