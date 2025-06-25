import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'show_password_state.dart';

class ShowPasswordCubit extends Cubit<ShowPasswordState> {
  ShowPasswordCubit() : super(ShowPasswordInitial());
  void show() {
    if (state is UnDoShowPasswordState) {
      emit(DoShowPasswordState());
    } else {
      emit(UnDoShowPasswordState());
    }
  }
}
