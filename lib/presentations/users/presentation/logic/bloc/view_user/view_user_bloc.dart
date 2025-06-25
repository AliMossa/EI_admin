import 'package:admin_dashboard/presentations/users/domain/entities/activate_user_entity.dart';
import 'package:admin_dashboard/presentations/users/domain/entities/get_user_info_request_entity.dart';
import 'package:admin_dashboard/presentations/users/domain/use_cases/activate_user_use_case.dart';
import 'package:admin_dashboard/presentations/users/domain/use_cases/get_user_info_use_case.dart';
import 'package:admin_dashboard/presentations/users/domain/use_cases/un_active_user_use_case.dart';
import 'package:admin_dashboard/presentations/users/presentation/logic/bloc/users_bloc.dart';
import 'package:admin_dashboard/presentations/users/presentation/middleware/user_middleware.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:admin_dashboard/util/safe_storage/safe_storage.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'view_user_event.dart';
part 'view_user_state.dart';

class ViewUserBloc extends Bloc<ViewUserEvent, ViewUserState> {
  UserMiddleware userMiddleware;
  GetUserInfoUseCase getUserInfoUseCase;
  ActivateUserUseCase activateUserUseCase;
  UnActiveUserUseCase unActiveUserUseCase;
  ViewUserBloc({
    required this.activateUserUseCase,
    required this.unActiveUserUseCase,
    required this.getUserInfoUseCase,
    required this.userMiddleware,
  }) : super(ViewUserInitial()) {
    on<GetUserInformationEvent>(getUserInfo);
    on<ActivateUserEvent>(activateUser);
    on<UnActivateUserEvent>(unActivateUser);
  }

  void getUserInfo(
    GetUserInformationEvent event,
    Emitter<ViewUserState> emit,
  ) async {
    emit(LoadingGetUserInformationState());

    try {
      String? token = await SafeStorage.read('token');
      final response = await getUserInfoUseCase(
        GetUserInfoRequestEntity(id: event.id, token: token!),
      );
      print(response);
      response.fold(
        (failed) =>
            emit(FailedGetUserInformationState(message: failed.message)),
        (success) {
          userMiddleware.setUserInfo(success);
          emit(SuccessGetUserInformationState());
        },
      );
    } on ServerAdminException catch (error) {
      emit(FailedGetUserInformationState(message: error.message));
    }
  }

  void activateUser(
    ActivateUserEvent event,
    Emitter<ViewUserState> emit,
  ) async {
    emit(LoadingActivateUserState());
    try {
      print('user id active function is ${event.id}');

      final String? token = await SafeStorage.read('token');
      final response = await activateUserUseCase(
        ActivateUserEntity(id: event.id, token: token!),
      );
      response.fold(
        (failed) => emit(FailedActivateUserState(message: failed.message)),
        (success) {
          emit(SuccessActivateUserState());
        },
      );
    } on ServerAdminException catch (error) {
      emit(FailedActivateUserState(message: error.message));
    }
  }

  void unActivateUser(
    UnActivateUserEvent event,
    Emitter<ViewUserState> emit,
  ) async {
    emit(LoadingUnActivateUserState());
    try {
      final String? token = await SafeStorage.read('token');
      print('user id unActive function is ${event.id}');
      final response = await unActiveUserUseCase(
        ActivateUserEntity(id: event.id, token: token!),
      );
      response.fold(
        (failed) => emit(FailedUnActivateUserState(message: failed.message)),
        (success) {
          emit(SuccessUnActivateUserState());
        },
      );
    } on ServerAdminException catch (error) {
      emit(FailedUnActivateUserState(message: error.message));
    }
  }
}
