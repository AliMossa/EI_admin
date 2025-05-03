import 'package:admin_dashboard/presentations/profile/presentation/middleware/profile_middleware.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileMiddleware profileMiddleware;
  ProfileBloc({required this.profileMiddleware}) : super(ProfileInitial()) {}
}
