import 'package:admin_dashboard/presentations/monitoring_history/domain/entities/logs_get_request_entity.dart';
import 'package:admin_dashboard/presentations/monitoring_history/domain/use_cases/get_logs_use_case.dart';
import 'package:admin_dashboard/presentations/monitoring_history/presentation/middleware/monitoring_history_middleware.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/safe_storage/safe_storage.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'monitoring_history_event.dart';
part 'monitoring_history_state.dart';

class MonitoringHistoryBloc
    extends Bloc<MonitoringHistoryEvent, MonitoringHistoryState> {
  MonitoringHistoryMiddleware monitoringHistoryMiddleware;
  GetLogsUseCase getLogsUseCase;
  MonitoringHistoryBloc({
    required this.monitoringHistoryMiddleware,
    required this.getLogsUseCase,
  }) : super(MonitoringHistoryInitial()) {
    on<GetMonitoringHistoryEvent>(getHistory);
  }

  void getHistory(
    GetMonitoringHistoryEvent event,
    Emitter<MonitoringHistoryState> emit,
  ) async {
    emit(LoadingGetMonitoringHistoryState());
    try {
      final token = await SafeStorage.read('token');
      final response = await getLogsUseCase(
        LogsGetRequestEntity(id: event.id, token: token!),
      );
      response.fold(
        (failed) =>
            emit(FailedGetMonitoringHistoryState(message: failed.message)),
        (success) {
          monitoringHistoryMiddleware.temp = success.logs;
          emit(SuccessGetMonitoringHistoryState());
          monitoringHistoryMiddleware.setTotalLogsEntity(success, true);
        },
      );
    } on ServerAdminError catch (error) {
      emit(FailedGetMonitoringHistoryState(message: error.message));
    }
  }
}
