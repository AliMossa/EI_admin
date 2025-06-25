import 'package:admin_dashboard/presentations/rewards/domain/entities/add_reward_entity.dart';
import 'package:admin_dashboard/presentations/rewards/domain/entities/remove_reward_entity.dart';
import 'package:admin_dashboard/presentations/rewards/domain/entities/total_reward_entity.dart';
import 'package:admin_dashboard/presentations/rewards/domain/entities/update_reward_entity.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

abstract class RewardsRepository {
  Future<Either<ServerAdminException, TotalRewardEntity>> getRewards(
    String token,
  );
  Future<Either<ServerAdminException, TotalRewardEntity>> reGetRewards(
    String link,
  );
  Future<Either<ServerAdminException, String>> addReward(
    AddRewardEntity addRewardEntity,
  );
  Future<Either<ServerAdminException, String>> updateReward(
    UpdateRewardEntity updateRewardEntity,
  );
  Future<Either<ServerAdminException, String>> removeReward(
    RemoveRewardEntity removeRewardEntity,
  );
}
