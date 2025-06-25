import 'package:admin_dashboard/presentations/requests/domain/user_cases/get_all_requests_use_case.dart';
import 'package:admin_dashboard/presentations/requests/domain/user_cases/re_get_all_requests_use_case.dart';
import 'package:admin_dashboard/presentations/requests/presentaiton/middleware/request_middleware.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:admin_dashboard/util/safe_storage/safe_storage.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'requests_event.dart';
part 'requests_state.dart';

class RequestsBloc extends Bloc<RequestsEvent, RequestsState> {
  GetAllRequestsUseCase getAllRequestsUseCase;
  ReGetAllRequestsUseCase reGetAllRequestsUseCase;
  RequestMiddleware requestMiddleware;

  RequestsBloc({
    required this.requestMiddleware,
    required this.reGetAllRequestsUseCase,
    required this.getAllRequestsUseCase,
  }) : super(RequestsInitial()) {
    on<GetAllRequestsEvent>(getRequests);
    on<ReGetAllRequestsEvent>(reGetRequests);
  }
  void getRequests(
    GetAllRequestsEvent event,
    Emitter<RequestsState> emit,
  ) async {
    emit(LoadingGetAllRequestsState());
    try {
      final String? token = await SafeStorage.read('token');
      final response = await getAllRequestsUseCase(token!);
      response.fold(
        (failed) => emit(FailedGetAllRequestsState(message: failed.message)),
        (success) {
          requestMiddleware.tempList = success.requests;
          requestMiddleware.setTotalRequestEntity(success, true);
          emit(SuccessGetAllRequestsState());
        },
      );
    } on ServerAdminException catch (error) {
      emit(FailedGetAllRequestsState(message: error.message));
    } catch (error) {
      emit(FailedGetAllRequestsState(message: 'error'));
    }
  }

  void reGetRequests(
    ReGetAllRequestsEvent event,
    Emitter<RequestsState> emit,
  ) async {
    emit(LoadingGetAllRequestsState());
    try {
      final String? token = await SafeStorage.read('token');
      final response = await getAllRequestsUseCase(token!);
      response.fold(
        (failed) => emit(FailedReGetAllRequestsState(message: failed.message)),
        (success) {
          requestMiddleware.setTotalRequestEntity(success, false);
          emit(SuccessReGetAllRequestsState());
        },
      );
    } on ServerAdminException catch (error) {
      emit(FailedReGetAllRequestsState(message: error.message));
    } catch (error) {
      emit(FailedReGetAllRequestsState(message: 'error'));
    }
  }
}
