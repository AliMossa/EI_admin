import 'package:admin_dashboard/presentations/profile/domain/entities/logs_request_entity.dart';
import 'package:admin_dashboard/presentations/profile/domain/use_cases/get_logs_use_case.dart';
import 'package:admin_dashboard/presentations/profile/domain/use_cases/re_get_logs_use_case.dart';
import 'package:admin_dashboard/presentations/profile/presentation/middleware/profile_middleware.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:admin_dashboard/util/safe_storage/safe_storage.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_logs_event.dart';
part 'profile_logs_state.dart';

class ProfileLogsBloc extends Bloc<ProfileLogsEvent, ProfileLogsState> {
  GetLogsUseCase getLogsUseCase;
  ReGetLogsUseCase reGetLogsUseCase;
  ProfileMiddleware profileMiddleware;

  ProfileLogsBloc({
    required this.profileMiddleware,
    required this.reGetLogsUseCase,
    required this.getLogsUseCase,
  }) : super(ProfileLogsInitial()) {
    on<GetProfileLogsEvent>(getProfileLogs);
    on<ReGetProfileLogsEvent>(reGetLogs);
  }
  void getProfileLogs(
    GetProfileLogsEvent event,
    Emitter<ProfileLogsState> emit,
  ) async {
    emit(LoadingGetProfileLogsState());
    try {
      String? token = await SafeStorage.read('token');
      final response = await getLogsUseCase(
        LogsRequestEntity(
          id: profileMiddleware.getProfileEntity().id,
          token: token!,
        ),
      );
      response.fold(
        (failed) => emit(FailedGetProfileLogsState(message: failed.message)),
        (success) {
          profileMiddleware.setLogs(success);
          emit(SuccessGetProfileLogsState());
        },
      );
    } on AdminExceptions catch (error) {
      emit(FailedGetProfileLogsState(message: error.message));
    } catch (error) {
      emit(FailedGetProfileLogsState(message: 'error'));
    }
  }

  void reGetLogs(
    ReGetProfileLogsEvent event,
    Emitter<ProfileLogsState> emit,
  ) async {
    emit(LoadingReGetProfileLogsState());
    try {
      final response = await reGetLogsUseCase(
        profileMiddleware.getTotalProfileLogsEntity().nextPage,
      );
      response.fold(
        (failed) => emit(FailedReGetProfileLogsState(message: failed.message)),
        (success) {
          profileMiddleware.updateLogs(success);
          emit(SuccessReGetProfileLogsState());
        },
      );
    } on AdminExceptions catch (error) {
      emit(FailedReGetProfileLogsState(message: error.message));
    } catch (error) {
      emit(FailedReGetProfileLogsState(message: 'error'));
    }
  }
}
