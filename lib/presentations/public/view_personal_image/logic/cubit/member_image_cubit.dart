import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'member_image_state.dart';

class MemberImageCubit extends Cubit<MemberImageState> {
  MemberImageCubit() : super(MemberImageInitial());
  void hover() => emit(HoverMemberImageState());
  void endHover() => emit(EndHoverMemberImageState());

  void addImage() {
    emit(LoadingAddMemberImageState());

    emit(AddMemberImageState());
  }
}
