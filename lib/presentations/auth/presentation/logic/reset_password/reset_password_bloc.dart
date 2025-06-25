import 'package:admin_dashboard/presentations/auth/domain/entities/reset_password_entity.dart';
import 'package:admin_dashboard/presentations/auth/domain/use_cases/reset_password_use_case.dart';
import 'package:admin_dashboard/presentations/auth/presentation/middleware/auth_middleware.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'reset_password_event.dart';
part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  ResetPasswordUseCase resetPasswordUseCase;
  AuthMiddleware authMiddleware;
  ResetPasswordBloc({
    required this.resetPasswordUseCase,
    required this.authMiddleware,
  }) : super(ResetPasswordInitial()) {
    on<ResetForgottenPasswordEvent>(resetPassoword);
  }

  void resetPassoword(
    ResetForgottenPasswordEvent event,
    Emitter<ResetPasswordState> emit,
  ) async {
    emit(LoadingResetForgottenPasswordState());
    try {
      final response = await resetPasswordUseCase(
        ResetPasswordEntity(
          newPassword: authMiddleware.getNewPassword(),
          confirmNewPassword: authMiddleware.getConfrimNewPassword(),
          email: authMiddleware.getEmail(),
        ),
      );

      response.fold(
        (failed) =>
            emit(FailedResetForgottenPasswordState(message: failed.message)),
        (success) => emit(SuccessResetForgottenPasswordState()),
      );
    } catch (error) {
      emit(FailedResetForgottenPasswordState(message: error.toString()));
    }
  }
}
