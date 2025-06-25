import 'package:admin_dashboard/presentations/home/domain/entities/request_success_statistics_entity.dart';
import 'package:admin_dashboard/presentations/home/domain/use_cases/get_success_statistics_use_case.dart';
import 'package:admin_dashboard/presentations/home/presentation/middleware/home_middleware.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:admin_dashboard/util/safe_storage/safe_storage.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'success_statistics_event.dart';
part 'success_statistics_state.dart';

class SuccessStatisticsBloc
    extends Bloc<SuccessStatisticsEvent, SuccessStatisticsState> {
  HomeMiddleware homeMiddleware;
  GetSuccessStatisticsUseCase getSuccessStatisticsUseCase;
  SuccessStatisticsBloc({
    required this.homeMiddleware,
    required this.getSuccessStatisticsUseCase,
  }) : super(SuccessStatisticsInitial()) {
    on<GetSuccessStatisticsEvent>(getSuccessStatistics);
  }
  void getSuccessStatistics(
    GetSuccessStatisticsEvent event,
    Emitter<SuccessStatisticsState> emit,
  ) async {
    emit(LoadingGetSuccessStatisticsState());
    try {
      final token = await SafeStorage.read('token');
      final response = await getSuccessStatisticsUseCase(
        RequestSuccessStatisticsEntity(token: token!, year: event.year),
      );
      response.fold(
        (failed) =>
            emit(FailedGetSuccessStatisticsState(message: failed.message)),
        (success) {
          homeMiddleware.setSuccessStatisticsEntity(success);
          emit(SuccessGetSuccessStatisticsState());
        },
      );
    } on ServerAdminException catch (error) {
      emit(FailedGetSuccessStatisticsState(message: error.message));
    } catch (error) {
      emit(FailedGetSuccessStatisticsState(message: 'error'));
    }
  }
}
