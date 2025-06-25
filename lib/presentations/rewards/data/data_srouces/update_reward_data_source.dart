import 'package:admin_dashboard/presentations/rewards/domain/entities/update_reward_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:dio/dio.dart';

abstract class UpdateRewardDataSource {
  Future<String> updateReward(UpdateRewardEntity updateRewardEntity);
}

class UpdateRewardDataSourceWithDio extends UpdateRewardDataSource {
  UpdateRewardDataSourceWithDio? _updateRewardDataSourceWithDio;
  UpdateRewardDataSourceWithDio get() =>
      _updateRewardDataSourceWithDio ??
      (_updateRewardDataSourceWithDio = UpdateRewardDataSourceWithDio());

  @override
  Future<String> updateReward(UpdateRewardEntity updateRewardEntity) async {
    String message = '';
    try {
      final response = await Apis().post(
        '${NetworkApisRouts().updateRewardApi()}${updateRewardEntity.id}',
        FormData.fromMap({
          if (updateRewardEntity.data.level != null)
            'level': updateRewardEntity.data.level,
          if (updateRewardEntity.data.level != null)
            'amount_threshold': updateRewardEntity.data.amountThreshold,
          if (updateRewardEntity.data.level != null)
            'percentage': updateRewardEntity.data.percentage,
          if (updateRewardEntity.data.times != null)
            'number_of_times': updateRewardEntity.data.times,
        }),
        updateRewardEntity.token,
      );
      if (response['errors'] == null) {
        message = response['message'];
      } else {
        message = response['message'] ?? response['errors'];
        throw Exception();
      }
      print(message);
      return message;
    } catch (error) {
      print(error);
      throw ServerAdminError(message: message);
    }
  }
}
