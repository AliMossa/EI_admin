import 'package:admin_dashboard/presentations/rewards/domain/entities/reward_entity.dart';
import 'package:admin_dashboard/presentations/rewards/domain/entities/total_reward_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';

abstract class ReGetRewardDataSource {
  Future<TotalRewardEntity> reGetRewards(String link);
}

class ReGetRewardDataSourceWithDio extends ReGetRewardDataSource {
  ReGetRewardDataSourceWithDio? _reGetRewardDataSourceWithDio;
  ReGetRewardDataSourceWithDio get() =>
      _reGetRewardDataSourceWithDio ??
      (_reGetRewardDataSourceWithDio = ReGetRewardDataSourceWithDio());
  @override
  Future<TotalRewardEntity> reGetRewards(String link) async {
    String message = '';
    List<RewardEntity> list = [];

    try {
      final response = await Apis().get(link, {}, '');
      if (response['errors'] == null) {
        message = response['message'];
      } else {
        message = response['message'] ?? response['errors'];
        throw Exception();
      }
      for (Map<String, dynamic> item in response['data']) {
        list.add(
          RewardEntity(
            id: item['id'],
            percentage: item['percentage'],
            times: item['number_of_times'],
            amountThreshold: item['amount_threshold'] * 1.0,
            level: item['level'],
            createdAt: item['created_at'],
            updatedAt: item['updated_at'],
          ),
        );
      }
      return TotalRewardEntity(nextPage: '', rewards: list);
    } on ClientAdminError catch (error) {
      throw ServerAdminError(message: error.message);
    } catch (error) {
      throw ServerAdminError(message: message);
    }
  }
}
