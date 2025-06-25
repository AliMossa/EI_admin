import 'package:admin_dashboard/presentations/auth/domain/use_cases/logout_use_case.dart';
import 'package:admin_dashboard/presentations/public/sidebar/middleware/sidebar_middleware.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:admin_dashboard/util/safe_storage/safe_storage.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'logout_event.dart';
part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  LogoutUseCase logoutUsecase;
  SidebarMiddleware sidebarMiddleware;
  LogoutBloc({required this.logoutUsecase, required this.sidebarMiddleware})
    : super(LogoutInitial()) {
    on<SendLogoutEvent>(logout);
  }
  void logout(SendLogoutEvent event, Emitter<LogoutState> emit) async {
    emit(LaodingSendLogoutState());
    try {
      final String? token = await SafeStorage.read('token');
      final response = await logoutUsecase(token!);
      response.fold(
        (failed) async {
          emit(FailedSendLogoutState(message: failed.message));
          await sidebarMiddleware.removeToken();
        },
        (success) async {
          emit(SuccessSendLogoutState());
          await sidebarMiddleware.removeToken();
        },
      );
    } on ServerAdminException catch (error) {
      print(error);
      emit(FailedSendLogoutState(message: error.message));
    } catch (error) {
      print(error);

      emit(FailedSendLogoutState(message: 'error'));
    }
  }
}
