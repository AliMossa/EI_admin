import 'package:admin_dashboard/presentations/auth/domain/use_cases/login_use_case.dart';
import 'package:admin_dashboard/presentations/auth/presentation/middleware/auth_middleware.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginUseCase loginUseCase;
  final AuthMiddleware authMiddleware;

  LoginBloc({required this.authMiddleware, required this.loginUseCase})
    : super(LoginInitial()) {
    on<SendLoginEvent>(login);
    on<CheckLoggingEvent>(checkToken);
  }
  void login(SendLoginEvent event, Emitter<LoginState> emit) async {
    emit(LoadingSendLoginState());
    try {
      final response = await loginUseCase(authMiddleware.getLoginInfo());
      response.fold(
        (failed) => emit(FailedSendLoginState(message: failed.message)),
        (success) async {
          emit(SuccessSendLoginState(message: success.message));
          await authMiddleware.saveToken(success.token);
        },
      );
    } on ServerAdminException catch (error) {
      emit(FailedSendLoginState(message: error.message));
    } catch (error) {
      emit(FailedSendLoginState(message: error.toString()));
    }
  }

  void checkToken(CheckLoggingEvent event, Emitter<LoginState> emit) async {
    emit(LoadingCheckLoggingState());
    try {
      await authMiddleware.isLogged()
          ? emit(SuccessCheckLoggingState())
          : emit(FailedCheckLoggingState());
    } catch (error) {
      emit(FailedSendLoginState(message: error.toString()));
    }
  }
}
