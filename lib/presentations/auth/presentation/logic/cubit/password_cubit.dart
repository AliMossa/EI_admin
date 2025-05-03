import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'password_state.dart';

class PasswordCubit extends Cubit<PasswordState> {
  PasswordCubit() : super(PasswordInitial());

  void changeView() {
    if (state is ShowPasswordState) {
      emit(HidePasswordState());
    } else {
      emit(ShowPasswordState());
    }
  }

  void changeConfirmView() {
    if (state is ShowConfirmPasswordState) {
      emit(HideConfirmPasswordState());
    } else {
      emit(ShowConfirmPasswordState());
    }
  }
}
