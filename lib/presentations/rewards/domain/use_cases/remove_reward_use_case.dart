import 'package:admin_dashboard/presentations/rewards/domain/entities/remove_reward_entity.dart';
import 'package:admin_dashboard/presentations/rewards/domain/repositories/rewards_repository.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class RemoveRewardUseCase {
  RewardsRepository rewardsRepository;
  RemoveRewardUseCase({required this.rewardsRepository});

  Future<Either<ServerAdminException, String>> call(
    RemoveRewardEntity removeRewardEntity,
  ) async {
    return await rewardsRepository.removeReward(removeRewardEntity);
  }
}
