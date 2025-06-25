import 'package:admin_dashboard/presentations/public/sidebar/middleware/sidebar_middleware.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'change_selected_color_state.dart';

class ChangeSelectedColorCubit extends Cubit<ChangeSelectedColorState> {
  SidebarMiddleware sidebarMiddleware;
  ChangeSelectedColorCubit({required this.sidebarMiddleware})
    : super(ChangeSelectedColorInitial());
  ChangeColorSelectedItem(int index) {
    emit(ChangeColorSelectedItemState(index: index));
  }
}
