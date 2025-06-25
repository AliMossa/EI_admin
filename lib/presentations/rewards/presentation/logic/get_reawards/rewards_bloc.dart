import 'package:admin_dashboard/presentations/employees/domain/use_cases/re_get_employees_use_case.dart';
import 'package:admin_dashboard/presentations/rewards/domain/use_cases/get_rewards_use_case.dart';
import 'package:admin_dashboard/presentations/rewards/domain/use_cases/re_get_rewards_use_case.dart';
import 'package:admin_dashboard/presentations/rewards/presentation/middlewares/rewards_middleware.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:admin_dashboard/util/safe_storage/safe_storage.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'rewards_event.dart';
part 'rewards_state.dart';

class RewardsBloc extends Bloc<RewardsEvent, RewardsState> {
  RewardsMiddleware rewardsMiddleware;
  GetRewardsUseCase getRewardsUseCase;
  ReGetRewardsUseCase reGetRewardsUseCase;
  RewardsBloc({
    required this.rewardsMiddleware,
    required this.reGetRewardsUseCase,
    required this.getRewardsUseCase,
  }) : super(RewardsInitial()) {
    on<GetRewardsEvent>(getRewards);
    on<ReGetRewardsEvent>(reGetRewards);
  }
  void getRewards(GetRewardsEvent event, Emitter<RewardsState> emit) async {
    emit(LoadingGetRewardsState());
    try {
      final String? token = await SafeStorage.read('token');
      final response = await getRewardsUseCase(token!);
      response.fold(
        (failed) => emit(FailedGetRewardsState(message: failed.message)),
        (success) {
          rewardsMiddleware.tempRewards = success.rewards;
          rewardsMiddleware.setTotalRewardEntity(success, true);
          emit(SuccessGetRewardsState());
        },
      );
    } on ServerAdminException catch (error) {
      emit(FailedGetRewardsState(message: error.message));
    } catch (error) {
      emit(FailedGetRewardsState(message: 'error'));
    }
  }

  void reGetRewards(ReGetRewardsEvent event, Emitter<RewardsState> emit) async {
    emit(LoadingReGetRewardsState());
    try {
      final response = await reGetRewardsUseCase(event.link);
      response.fold(
        (failed) => emit(FailedReGetRewardsState(message: failed.message)),
        (success) {
          rewardsMiddleware.setTotalRewardEntity(success, false);
          emit(SuccessReGetRewardsState());
        },
      );
    } on ServerAdminException catch (error) {
      emit(FailedReGetRewardsState(message: error.message));
    } catch (error) {
      emit(FailedReGetRewardsState(message: 'error'));
    }
  }
}
