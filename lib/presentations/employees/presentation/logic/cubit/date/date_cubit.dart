import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'date_state.dart';

class DateCubit extends Cubit<DateState> {
  DateCubit() : super(DateInitial());

  void setDate() {
    emit(LoadingSetDateState());
    emit(SetDateState());
  }
}
