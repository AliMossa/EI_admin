import 'package:admin_dashboard/presentations/rewards/domain/entities/total_reward_entity.dart';
import 'package:admin_dashboard/presentations/rewards/domain/repositories/rewards_repository.dart';

import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class GetRewardsUseCase {
  RewardsRepository rewardsRepository;
  GetRewardsUseCase({required this.rewardsRepository});

  Future<Either<ServerAdminException, TotalRewardEntity>> call(
    String token,
  ) async {
    return await rewardsRepository.getRewards(token);
  }
}
