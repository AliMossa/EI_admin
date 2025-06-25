import 'package:admin_dashboard/presentations/auth/domain/entities/verify_code_entity.dart';
import 'package:admin_dashboard/presentations/auth/domain/use_cases/verify_code_use_case.dart';
import 'package:admin_dashboard/presentations/auth/presentation/middleware/auth_middleware.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'check_code_event.dart';
part 'check_code_state.dart';

class CheckCodeBloc extends Bloc<CheckCodeEvent, CheckCodeState> {
  VerifyCodeUseCase verifyCodeUseCase;
  AuthMiddleware authMiddleware;
  CheckCodeBloc({required this.verifyCodeUseCase, required this.authMiddleware})
    : super(CheckCodeInitial()) {
    on<VerifyCodeEvent>(checkVerificationCode);
  }

  void checkVerificationCode(
    VerifyCodeEvent event,
    Emitter<CheckCodeState> emit,
  ) async {
    emit(LoadingVerifyCodeState());
    try {
      final response = await verifyCodeUseCase(
        VerifyCodeEntity(
          code: authMiddleware.getCheckCode(),
          email: authMiddleware.getEmail(),
        ),
      );
      response.fold(
        (failed) => emit(FailedVerifyCodeState(message: failed.message)),
        (success) => emit(SuccessVerifyCodeState()),
      );
    } catch (error) {
      emit(FailedVerifyCodeState(message: error.toString()));
    }
  }
}
