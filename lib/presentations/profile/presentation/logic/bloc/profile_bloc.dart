import 'package:admin_dashboard/presentations/profile/domain/entities/logs_request_entity.dart';
import 'package:admin_dashboard/presentations/profile/domain/use_cases/get_logs_use_case.dart';
import 'package:admin_dashboard/presentations/profile/domain/use_cases/get_profile_use_case.dart';
import 'package:admin_dashboard/presentations/profile/domain/use_cases/re_get_logs_use_case.dart';
import 'package:admin_dashboard/presentations/profile/domain/use_cases/update_profile_use_case.dart';
import 'package:admin_dashboard/presentations/profile/presentation/middleware/profile_middleware.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:admin_dashboard/util/safe_storage/safe_storage.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileMiddleware profileMiddleware;
  GetProfileUseCase getProfileUseCase;
  UpdateProfileUseCase updateProfileUseCase;

  ProfileBloc({
    required this.profileMiddleware,
    required this.getProfileUseCase,
    required this.updateProfileUseCase,
  }) : super(ProfileInitial()) {
    on<GetProfileInfoEvent>(getProfileInfo);
    on<UpdateProfileInfoEvent>(updateProfile);
  }

  void getProfileInfo(
    GetProfileInfoEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(LoadingGetProfileInfoState());
    try {
      String? token = await SafeStorage.read('token');
      final response = await getProfileUseCase(token!);
      response.fold(
        (failed) => emit(FailedGetProfileInfoState(message: failed.message)),
        (success) {
          profileMiddleware.setProfileEntity(success);
          emit(SuccessGetProfileInfoState());
        },
      );
    } on AdminExceptions catch (error) {
      emit(FailedGetProfileInfoState(message: error.message));
    }
  }

  void updateProfile(
    UpdateProfileInfoEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(LoadingUpdateProfileInfoState());
    try {
      final String? token = await SafeStorage.read('token');
      final response = await updateProfileUseCase(
        profileMiddleware.updateProfile(),
        token!,
      );
      response.fold(
        (failed) => emit(FailedUpdateProfileInfoState(message: failed.message)),
        (success) => emit(SuccessUpdateProfileInfoState()),
      );
    } on AdminExceptions catch (error) {
      emit(FailedUpdateProfileInfoState(message: error.message));
    } catch (error) {
      print(error);
      emit(FailedUpdateProfileInfoState(message: 'error'));
    }
  }
}
