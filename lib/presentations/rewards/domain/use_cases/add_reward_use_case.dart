import 'package:admin_dashboard/presentations/rewards/domain/entities/add_reward_entity.dart';
import 'package:admin_dashboard/presentations/rewards/domain/repositories/rewards_repository.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class AddRewardUseCase {
  RewardsRepository rewardsRepository;
  AddRewardUseCase({required this.rewardsRepository});

  Future<Either<ServerAdminException, String>> call(
    AddRewardEntity addRewardEntity,
  ) async {
    return await rewardsRepository.addReward(addRewardEntity);
  }
}
