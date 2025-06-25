import 'package:admin_dashboard/presentations/rewards/data/data_srouces/add_reward_data_source.dart';
import 'package:admin_dashboard/presentations/rewards/data/data_srouces/get_rewards_data_source.dart';
import 'package:admin_dashboard/presentations/rewards/data/data_srouces/re_get_reward_data_source.dart';
import 'package:admin_dashboard/presentations/rewards/data/data_srouces/remove_reward_data_source.dart';
import 'package:admin_dashboard/presentations/rewards/data/data_srouces/update_reward_data_source.dart';
import 'package:admin_dashboard/presentations/rewards/domain/entities/add_reward_entity.dart';
import 'package:admin_dashboard/presentations/rewards/domain/entities/remove_reward_entity.dart';
import 'package:admin_dashboard/presentations/rewards/domain/entities/total_reward_entity.dart';
import 'package:admin_dashboard/presentations/rewards/domain/entities/update_reward_entity.dart';
import 'package:admin_dashboard/presentations/rewards/domain/repositories/rewards_repository.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class RewardRepositoryImpSource implements RewardsRepository {
  @override
  Future<Either<ServerAdminException, TotalRewardEntity>> getRewards(
    String token,
  ) async {
    try {
      return right(await GetRewardsDataSourceWithDio().get().getRewards(token));
    } on ServerAdminError catch (error) {
      return left(ServerAdminException(message: error.message));
    }
  }

  @override
  Future<Either<ServerAdminException, String>> addReward(
    AddRewardEntity addRewardEntity,
  ) async {
    try {
      return right(
        await AddRewardDataSourceWithDio().get().addReward(addRewardEntity),
      );
    } on ServerAdminError catch (error) {
      return left(ServerAdminException(message: error.message));
    }
  }

  @override
  Future<Either<ServerAdminException, String>> updateReward(
    UpdateRewardEntity updateRewardEntity,
  ) async {
    try {
      return right(
        await UpdateRewardDataSourceWithDio().get().updateReward(
          updateRewardEntity,
        ),
      );
    } on ServerAdminError catch (error) {
      return left(ServerAdminException(message: error.message));
    }
  }

  @override
  Future<Either<ServerAdminException, String>> removeReward(
    RemoveRewardEntity removeRewardEntity,
  ) async {
    try {
      return right(
        await RemoveRewardDataSourceWithDio().get().removeReward(
          removeRewardEntity,
        ),
      );
    } on ServerAdminError catch (error) {
      return left(ServerAdminException(message: error.message));
    }
  }

  @override
  Future<Either<ServerAdminException, TotalRewardEntity>> reGetRewards(
    String link,
  ) async {
    try {
      return right(
        await ReGetRewardDataSourceWithDio().get().reGetRewards(link),
      );
    } on ServerAdminError catch (error) {
      return left(ServerAdminException(message: error.message));
    }
  }
}
