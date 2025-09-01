import 'dart:developer';

import 'package:admin_dashboard/presentations/rewards/domain/entities/update_reward_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/notices/show_notices.dart';
import 'package:dio/dio.dart';

abstract class UpdateRewardDataSource {
  Future<String> updateReward(UpdateRewardEntity updateRewardEntity);
}

class UpdateRewardDataSourceWithDio extends UpdateRewardDataSource {
  @override
  Future<String> updateReward(UpdateRewardEntity updateRewardEntity) async {
    String message = '';

    try {
      final response = await Apis().post(
        '${NetworkApisRouts().updateRewardApi()}${updateRewardEntity.id}',
        FormData.fromMap({
          if (updateRewardEntity.data.level != null)
            'level': updateRewardEntity.data.level,
          if (updateRewardEntity.data.amountThreshold != null)
            'amount_threshold': updateRewardEntity.data.amountThreshold,
          if (updateRewardEntity.data.percentage != null)
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
    } on ClientAdminError catch (error) {
      log('ClientAdminError: ${error.message}', name: 'UpdateReward');
      throw ServerAdminError(message: error.message);
    } on DioException catch (dioError) {
      log('DioException: ${dioError.message}', name: 'UpdateReward');
      throw ServerAdminError(message: ShowNotices.internetError);
    } catch (error, stackTrace) {
      log(
        'Unhandled Exception: $error',
        stackTrace: stackTrace,
        name: 'UpdateReward',
      );
      throw ServerAdminError(
        message: message.isEmpty ? ShowNotices.abnormalError : message,
      );
    }
  }
}
