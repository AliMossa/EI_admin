import 'package:admin_dashboard/presentations/rewards/domain/entities/add_reward_entity.dart';
import 'package:admin_dashboard/presentations/rewards/domain/use_cases/add_reward_use_case.dart';
import 'package:admin_dashboard/presentations/rewards/presentation/middlewares/rewards_middleware.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:admin_dashboard/util/safe_storage/safe_storage.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_reward_event.dart';
part 'add_reward_state.dart';

class AddRewardBloc extends Bloc<AddRewardEvent, AddRewardState> {
  RewardsMiddleware rewardsMiddleware;
  AddRewardUseCase addRewardUseCase;
  AddRewardBloc({
    required this.rewardsMiddleware,
    required this.addRewardUseCase,
  }) : super(AddRewardInitial()) {
    on<AddNewRewardEvent>(addReward);
  }
  void addReward(AddNewRewardEvent event, Emitter<AddRewardState> emit) async {
    emit(LoadingAddNewRewardState());
    try {
      final String? token = await SafeStorage.read('token');
      final response = await addRewardUseCase(
        AddRewardEntity(
          token: token!,
          data: rewardsMiddleware.getRewardEntity(),
        ),
      );
      response.fold(
        (failed) => emit(FailedAddNewRewardState(message: failed.message)),
        (success) {
          emit(SuccessAddNewRewardState());
          rewardsMiddleware.clearUpdatedDataField();
        },
      );
    } on ServerAdminException catch (error) {
      print(error);

      emit(FailedAddNewRewardState(message: error.message));
    } catch (error) {
      emit(FailedAddNewRewardState(message: 'error'));
    }
  }
}
