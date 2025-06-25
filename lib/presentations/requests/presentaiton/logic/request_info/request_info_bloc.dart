import 'package:admin_dashboard/presentations/requests/domain/entities/request_managment_entity.dart';
import 'package:admin_dashboard/presentations/requests/domain/entities/send_request_entity.dart';
import 'package:admin_dashboard/presentations/requests/domain/user_cases/accept_request_use_case.dart';
import 'package:admin_dashboard/presentations/requests/domain/user_cases/get_request_info_use_case.dart';
import 'package:admin_dashboard/presentations/requests/domain/user_cases/reject_request_use_case.dart';
import 'package:admin_dashboard/presentations/requests/presentaiton/middleware/request_middleware.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:admin_dashboard/util/safe_storage/safe_storage.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'request_info_event.dart';
part 'request_info_state.dart';

class RequestInfoBloc extends Bloc<RequestInfoEvent, RequestInfoState> {
  GetRequestInfoUseCase getRequestInfoUseCase;
  RequestMiddleware requestMiddleware;
  AcceptRequestUseCase acceptRequestUseCase;
  RejectRequestUseCase rejectRequestUseCase;
  RequestInfoBloc({
    required this.acceptRequestUseCase,
    required this.rejectRequestUseCase,
    required this.getRequestInfoUseCase,
    required this.requestMiddleware,
  }) : super(RequestInfoInitial()) {
    on<ViewRequestInfoEvent>(viewRequestInfo);
    on<AcceptPropertyRequestEvent>(acceptPropertyRequest);
    on<RejectPropertyRequestEvent>(rejectPropertyRequest);
  }
  void viewRequestInfo(
    ViewRequestInfoEvent event,
    Emitter<RequestInfoState> emit,
  ) async {
    emit(LoadingViewRequestInfoState());
    try {
      final String? token = await SafeStorage.read('token');
      final response = await getRequestInfoUseCase(
        SendRequestEntity(id: event.id, token: token!),
      );
      response.fold(
        (failed) => emit(FailedViewRequestInfoState(message: failed.message)),
        (success) {
          requestMiddleware.setRequestInfoEntity(success);
          emit(SuccessViewRequestInfoState());
        },
      );
    } on ServerAdminException catch (error) {
      emit(FailedViewRequestInfoState(message: error.message));
    } catch (error) {
      emit(FailedViewRequestInfoState(message: 'error'));
    }
  }

  void acceptPropertyRequest(
    AcceptPropertyRequestEvent event,
    Emitter<RequestInfoState> emit,
  ) async {
    emit(LoadingAcceptPropertyRequestState());
    try {
      final token = await SafeStorage.read('token');
      final response = await acceptRequestUseCase(
        RequestManagmentEntity(id: event.id, token: token!),
      );
      response.fold(
        (failed) =>
            emit(FailedAcceptPropertyRequestState(message: failed.message)),
        (success) => emit(SuccessAcceptPropertyRequestState()),
      );
    } on ServerAdminException catch (error) {
      emit(FailedAcceptPropertyRequestState(message: error.message));
    } catch (error) {
      emit(FailedAcceptPropertyRequestState(message: 'error'));
    }
  }

  void rejectPropertyRequest(
    RejectPropertyRequestEvent event,
    Emitter<RequestInfoState> emit,
  ) async {
    emit(LoadingRejectPropertyRequestState());
    try {
      final token = await SafeStorage.read('token');
      final response = await rejectRequestUseCase(
        RequestManagmentEntity(
          id: event.id,
          token: token!,
          notice: requestMiddleware.getAdminNotice(),
        ),
      );
      response.fold(
        (failed) =>
            emit(FailedRejectPropertyRequestState(message: failed.message)),
        (success) => emit(SuccessRejectPropertyRequestState()),
      );
    } on ServerAdminException catch (error) {
      emit(FailedRejectPropertyRequestState(message: error.message));
    } catch (error) {
      emit(FailedRejectPropertyRequestState(message: 'error'));
    }
  }
}
