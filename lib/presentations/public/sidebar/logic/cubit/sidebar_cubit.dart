import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sidebar_state.dart';

class SidebarCubit extends Cubit<SidebarState> {
  SidebarCubit() : super(SidebarInitial());

  changeSideBarWidth() {
    if (state is ShrinkSidebarState)
      emit(ExpandSidebarState());
    else
      emit(ShrinkSidebarState());
  }
}
