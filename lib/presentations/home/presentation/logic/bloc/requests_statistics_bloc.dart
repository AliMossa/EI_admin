import 'package:admin_dashboard/presentations/home/domain/entities/request_requests_statistics_entity.dart';
import 'package:admin_dashboard/presentations/home/domain/use_cases/get_requests_statistics_use_case.dart';
import 'package:admin_dashboard/presentations/home/presentation/middleware/home_middleware.dart';
import 'package:admin_dashboard/presentations/rewards/presentation/widgets/add_reward/add_reward_item.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:admin_dashboard/util/safe_storage/safe_storage.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'requests_statistics_event.dart';
part 'requests_statistics_state.dart';

class RequestsStatisticsBloc
    extends Bloc<RequestsStatisticsEvent, RequestsStatisticsState> {
  HomeMiddleware homeMiddleware;
  GetRequestsStatisticsUseCase getRequestsStatisticsUseCase;
  RequestsStatisticsBloc({
    required this.getRequestsStatisticsUseCase,
    required this.homeMiddleware,
  }) : super(RequestsStatisticsInitial()) {
    on<GetAllRequestsStatisticsEvent>(getRequestsStatistics);
  }
  void getRequestsStatistics(
    GetAllRequestsStatisticsEvent event,
    Emitter<RequestsStatisticsState> emit,
  ) async {
    emit(LoadingGetAllRequestsStatisticsState());
    try {
      final token = await SafeStorage.read('token');
      final response = await getRequestsStatisticsUseCase(
        RequestRequestsStatisticsEntity(year: event.year, token: token!),
      );
      response.fold(
        (failed) =>
            emit(FailedGetAllRequestsStatisticsState(message: failed.message)),
        (success) {
          homeMiddleware.setRequestsStatisticsEntity(success);
          emit(SuccessGetAllRequestsStatisticsState());
        },
      );
    } on ServerAdminException catch (error) {
      emit(FailedGetAllRequestsStatisticsState(message: error.message));
    } catch (error) {
      emit(FailedGetAllRequestsStatisticsState(message: 'error'));
    }
  }
}
