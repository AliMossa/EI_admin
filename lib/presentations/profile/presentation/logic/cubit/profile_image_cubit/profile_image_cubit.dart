import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_image_state.dart';

class ProfileImageCubit extends Cubit<ProfileImageState> {
  ProfileImageCubit() : super(ProfileImageInitial());
  void hover() => emit(HoverProfileImageState());
  void endhover() => emit(EndHoverProfileImageState());
}
