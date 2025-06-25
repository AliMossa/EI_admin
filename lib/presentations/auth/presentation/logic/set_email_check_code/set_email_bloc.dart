import 'package:admin_dashboard/presentations/auth/domain/use_cases/send_verifiication_code_use_case.dart';
import 'package:admin_dashboard/presentations/auth/presentation/middleware/auth_middleware.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'set_email_event.dart';
part 'set_email_state.dart';

class SetEmailBloc extends Bloc<SetEmailEvent, SetEmailState> {
  SendVerifiicationCodeUseCase sendVerifiicationCodeUseCase;
  AuthMiddleware authMiddleware;
  SetEmailBloc({
    required this.sendVerifiicationCodeUseCase,
    required this.authMiddleware,
  }) : super(SetEmailInitial()) {
    on<SendVerificationCodeEvent>(sendVerificationCode);
  }
  void sendVerificationCode(
    SendVerificationCodeEvent event,
    Emitter<SetEmailState> emit,
  ) async {
    emit(LoadingSendVerificationCodeState());
    try {
      print('starting');
      final response = await sendVerifiicationCodeUseCase(
        authMiddleware.getEmail(),
      );
      response.fold(
        (failed) =>
            emit(FailedSendVerificationCodeState(message: failed.message)),
        (success) => emit(SuccessSendVerificationCodeState()),
      );
    } catch (error) {
      emit(FailedSendVerificationCodeState(message: error.toString()));
    }
  }
}
