import 'package:admin_dashboard/presentations/public/auth/middleware/auth_widget_middleware.dart';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthWidgetMiddleware authWidgetMiddleware;
  AuthBloc({required this.authWidgetMiddleware}) : super(AuthInitial()) {
    on<MoveToLoginPageEvent>(moveToLoginPage);
    on<MoveToResetPasswordPageEvent>(moveToResetPasswordPage);
    on<MoveToCheckCodePageEvent>(moveToCheckCodePage);
    on<MoveToSetEmailCheckCodePageEvent>(moveToSetEmail);
  }

  void moveToLoginPage(MoveToLoginPageEvent event, Emitter<AuthState> emit) =>
      emit(MoveToLoginPageState());
  void moveToResetPasswordPage(
    MoveToResetPasswordPageEvent event,
    Emitter<AuthState> emit,
  ) => emit(MoveToResetPasswordPageState());
  void moveToCheckCodePage(
    MoveToCheckCodePageEvent event,
    Emitter<AuthState> emit,
  ) => emit(MoveToCheckCodePageState());

  void moveToSetEmail(
    MoveToSetEmailCheckCodePageEvent event,
    Emitter<AuthState> emit,
  ) => emit(MoveToSetEmailCheckCodePageState());
}
