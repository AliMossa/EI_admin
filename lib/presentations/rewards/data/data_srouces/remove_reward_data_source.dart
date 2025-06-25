import 'package:admin_dashboard/presentations/rewards/domain/entities/remove_reward_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';

abstract class RemoveRewardDataSource {
  Future<String> removeReward(RemoveRewardEntity removeRewardEntity);
}

class RemoveRewardDataSourceWithDio extends RemoveRewardDataSource {
  RemoveRewardDataSourceWithDio? _removeRewardDataSourceWithDio;
  RemoveRewardDataSourceWithDio get() =>
      _removeRewardDataSourceWithDio ??
      (_removeRewardDataSourceWithDio = RemoveRewardDataSourceWithDio());

  @override
  Future<String> removeReward(RemoveRewardEntity removeRewardEntity) async {
    String message = '';
    try {
      final response = await Apis().delet(
        '${NetworkApisRouts().removeRewardApi()}${removeRewardEntity.id}',
        {},
        removeRewardEntity.token,
      );
      if (response['errors'] == null) {
        message = response['message'];
      } else {
        message = response['message'] ?? response['errors'];
        throw Exception();
      }
      return message;
    } catch (error) {
      throw ServerAdminError(message: message);
    }
  }
}
