import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_pages_state.dart';

class LoginPagesCubit extends Cubit<LoginPagesState> {
  LoginPagesCubit() : super(LoginPagesInitial());

  void moveToCheckCode() {
    emit(LoadingMoveToCheckCodePageState());
    emit(MoveToCheckCodePageState());
  }

  void moveToResetPassword() {
    emit(LoadingMoveToResetPasswordPageState());

    emit(MoveToResetPasswordPageState());
  }

  void moveToLogin() {
    emit(LoadingMoveToLoginPageState());

    emit(MoveToLoginPageState());
  }
}
