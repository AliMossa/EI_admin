import 'package:admin_dashboard/presentations/public/monitoring_history/presentation/middleware/monitoring_history_middleware.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'monitoring_history_event.dart';
part 'monitoring_history_state.dart';

class MonitoringHistoryBloc
    extends Bloc<MonitoringHistoryEvent, MonitoringHistoryState> {
  MonitoringHistoryMiddleware monitoringHistoryMiddleware;
  MonitoringHistoryBloc({required this.monitoringHistoryMiddleware})
    : super(MonitoringHistoryInitial()) {
    on<GetMonitoringHistoryEvent>(getHistory);
  }

  void getHistory(
    GetMonitoringHistoryEvent event,
    Emitter<MonitoringHistoryState> emit,
  ) async {
    emit(LoadingGetMonitoringHistoryState());
  }
}
