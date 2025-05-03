import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'logout_event.dart';
part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  LogoutBloc(super.initialState);
  // LogoutUsecase logoutUsecase;
  // LogoutBloc({required this.logoutUsecase}) : super(LogoutInitial()) {
  //   on<SendLogoutEvent>(logout);
  // }
  // void logout(SendLogoutEvent event, Emitter<LogoutState> emit) async {
  //   emit(LaodingSendLogoutState());
  //   try {
  //     final response = await logoutUsecase();
  //     response.fold((failed) => emit(FailedSendLogoutState()),
  //         (success) => emit(SuccessSendLogoutState()));
  //   } on ServerException {
  //     emit(FailedSendLogoutState());
  //   }
  // }
}
