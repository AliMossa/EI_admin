import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_password_state.dart';

class UserPasswordCubit extends Cubit<UserPasswordState> {
  UserPasswordCubit() : super(UserPasswordInitial());

  void userPassword() {
    state is ShowPasswordState
        ? emit(HidePasswordState())
        : emit(ShowPasswordState());
  }
}
