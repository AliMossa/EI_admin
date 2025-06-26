import 'package:admin_dashboard/presentations/home/domain/entities/request_statistics_of_users_entity.dart';
import 'package:admin_dashboard/presentations/home/domain/use_cases/get_statistics_of_uses_use_case.dart';
import 'package:admin_dashboard/presentations/home/presentation/middleware/home_middleware.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:admin_dashboard/util/safe_storage/safe_storage.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'statistics_of_users_event.dart';
part 'statistics_of_users_state.dart';

class StatisticsOfUsersBloc
    extends Bloc<StatisticsOfUsersEvent, StatisticsOfUsersState> {
  HomeMiddleware homeMiddleware;
  GetStatisticsOfUsesUseCase getStatisticsOfUsesUseCase;
  StatisticsOfUsersBloc({
    required this.homeMiddleware,
    required this.getStatisticsOfUsesUseCase,
  }) : super(StatisticsOfUsersInitial()) {
    on<GetStatisticsOfusersEvent>(getStatisticsOfUsers);
  }

  void getStatisticsOfUsers(
    GetStatisticsOfusersEvent event,
    Emitter<StatisticsOfUsersState> emit,
  ) async {
    emit(LoadingGetStatisticsOfusersState());
    try {
      final token = await SafeStorage.read('token');
      final response = await getStatisticsOfUsesUseCase(
        RequestStatisticsOfUsersEntity(token: token!),
      );
      response.fold(
        (failed) =>
            emit(FailedGetStatisticsOfusersState(message: failed.message)),
        (success) {
          homeMiddleware.setStatisticsOfUsersEntity(success);
          emit(SuccessGetStatisticsOfusersState());
        },
      );
    } on ServerAdminException catch (error) {
      emit(FailedGetStatisticsOfusersState(message: error.message));
    }
  }
}
