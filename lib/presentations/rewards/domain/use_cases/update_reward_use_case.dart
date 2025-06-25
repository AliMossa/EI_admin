import 'package:admin_dashboard/presentations/rewards/domain/entities/update_reward_entity.dart';
import 'package:admin_dashboard/presentations/rewards/domain/repositories/rewards_repository.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class UpdateRewardUseCase {
  RewardsRepository rewardsRepository;
  UpdateRewardUseCase({required this.rewardsRepository});

  Future<Either<ServerAdminException, String>> call(
    UpdateRewardEntity updateRewardEntity,
  ) async {
    return await rewardsRepository.updateReward(updateRewardEntity);
  }
}
