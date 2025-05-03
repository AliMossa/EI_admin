import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'change_number_state.dart';

class ChangeNumberCubit extends Cubit<ChangeNumberState> {
  ChangeNumberCubit() : super(ChangeNumberInitial());
  void updateNumber() => emit(UpdateNumberFieldProfileState());
  void saveNumber() => emit(SaveNumberFieldProfileState());
}
