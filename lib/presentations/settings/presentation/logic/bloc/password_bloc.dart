import 'package:admin_dashboard/presentations/settings/domain/use_cases/change_password_use_case.dart';
import 'package:admin_dashboard/presentations/settings/presentation/middlewares/settings_middleware.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'password_event.dart';
part 'password_state.dart';

class PasswordBloc extends Bloc<PasswordEvent, PasswordState> {
  ChangePasswordUseCase changePasswordUseCase;
  SettingsMiddleware settingsMiddleware;
  PasswordBloc({
    required this.changePasswordUseCase,
    required this.settingsMiddleware,
  }) : super(PasswordInitial()) {
    on<ChangePasswordEvent>(changePassword);
  }

  void changePassword(
    ChangePasswordEvent event,
    Emitter<PasswordState> emit,
  ) async {
    emit(LoadingChangePasswordState());
    try {
      final variable = await settingsMiddleware.getChangePasswordData();

      final response = await changePasswordUseCase(
        await settingsMiddleware.getChangePasswordData(),
      );
      response.fold(
        (failed) => emit(FailedChangePasswordState(message: failed.message)),
        (success) => emit(SuccessChangePasswordState()),
      );
    } on ServerAdminError catch (error) {
      emit(FailedChangePasswordState(message: error.message));
    } catch (error) {
      print(error);
      emit(FailedChangePasswordState(message: 'error'));
    }
  }
}
