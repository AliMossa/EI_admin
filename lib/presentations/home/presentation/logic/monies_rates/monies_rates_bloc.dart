import 'package:admin_dashboard/presentations/home/domain/use_cases/get_monies_rates_use_case.dart';
import 'package:admin_dashboard/presentations/home/presentation/middleware/home_middleware.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'monies_rates_event.dart';
part 'monies_rates_state.dart';

class MoniesRatesBloc extends Bloc<MoniesRatesEvent, MoniesRatesState> {
  HomeMiddleware homeMiddleware;
  GetMoniesRatesUseCase getMoniesRatesUseCase;
  MoniesRatesBloc({
    required this.homeMiddleware,
    required this.getMoniesRatesUseCase,
  }) : super(MoniesRatesInitial()) {
    on<GetAllMoniesRatesEvent>(getMoniesRates);
  }

  void getMoniesRates(
    GetAllMoniesRatesEvent event,
    Emitter<MoniesRatesState> emit,
  ) async {
    emit(LoadingGetAllMoniesRatesState());
    try {
      final response = await getMoniesRatesUseCase();
      response.fold(
        (failed) => emit(FailedGetAllMoniesRatesState(message: failed.message)),
        (success) {
          homeMiddleware.setMoniesRatesEntity(success);
          emit(SuccessGetAllMoniesRatesState());
        },
      );
    } on ServerAdminException catch (error) {
      emit(FailedGetAllMoniesRatesState(message: error.message));
    } catch (error) {
      emit(FailedGetAllMoniesRatesState(message: 'error'));
    }
  }
}
