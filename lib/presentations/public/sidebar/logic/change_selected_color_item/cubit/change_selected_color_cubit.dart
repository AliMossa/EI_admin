import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'change_selected_color_state.dart';

class ChangeSelectedColorCubit extends Cubit<ChangeSelectedColorState> {
  ChangeSelectedColorCubit() : super(ChangeSelectedColorInitial());
  ChangeColorSelectedItem(int index) {
    emit(ChangeColorSelectedItemState(index: index));
  }
}
