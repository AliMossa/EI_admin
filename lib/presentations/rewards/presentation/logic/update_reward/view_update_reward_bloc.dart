import 'package:admin_dashboard/presentations/rewards/domain/entities/remove_reward_entity.dart';
import 'package:admin_dashboard/presentations/rewards/domain/entities/update_reward_entity.dart';
import 'package:admin_dashboard/presentations/rewards/domain/use_cases/remove_reward_use_case.dart';
import 'package:admin_dashboard/presentations/rewards/domain/use_cases/update_reward_use_case.dart';
import 'package:admin_dashboard/presentations/rewards/presentation/middlewares/rewards_middleware.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:admin_dashboard/util/safe_storage/safe_storage.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'view_update_reward_event.dart';
part 'view_update_reward_state.dart';

class ViewUpdateRewardBloc
    extends Bloc<ViewUpdateRewardEvent, ViewUpdateRewardState> {
  RewardsMiddleware rewardsMiddleware;
  UpdateRewardUseCase updateRewardUseCase;
  RemoveRewardUseCase removeRewardUseCase;
  ViewUpdateRewardBloc({
    required this.removeRewardUseCase,
    required this.updateRewardUseCase,
    required this.rewardsMiddleware,
  }) : super(ViewUpdateRewardInitial()) {
    on<UpdateRewardEvent>(updateReward);
    on<RemoveRewardEvent>(removeReward);
  }

  void updateReward(
    UpdateRewardEvent event,
    Emitter<ViewUpdateRewardState> emit,
  ) async {
    emit(LoadingUpdateRewardState());

    try {
      final token = await SafeStorage.read('token');
      final response = await updateRewardUseCase(
        UpdateRewardEntity(
          id: event.id,
          token: token!,
          data: rewardsMiddleware.getRewardEntity(),
        ),
      );
      response.fold(
        (failed) => emit(FailedUpdateRewardState(message: failed.message)),
        (success) {
          rewardsMiddleware.clearUpdatedDataField();
          emit(SuccessUpdateRewardState());
        },
      );
    } on ServerAdminException catch (error) {
      emit(FailedUpdateRewardState(message: error.message));
    } catch (error) {
      emit(FailedUpdateRewardState(message: 'error'));
    }
  }

  void removeReward(
    RemoveRewardEvent event,
    Emitter<ViewUpdateRewardState> emit,
  ) async {
    emit(LoadingRemoveRewardState());
    try {
      final token = await SafeStorage.read('token');
      final response = await removeRewardUseCase(
        RemoveRewardEntity(id: event.id, token: token!),
      );
      response.fold(
        (failed) => emit(FailedRemoveRewardState(message: failed.message)),
        (success) {
          emit(SuccessRemoveRewardState());
        },
      );
    } on ServerAdminException catch (error) {
      print(error);
      emit(FailedRemoveRewardState(message: error.message));
    } catch (error) {
      print(error);
      emit(FailedRemoveRewardState(message: 'error'));
    }
  }
}
