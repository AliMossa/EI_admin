import 'dart:developer';

import 'package:admin_dashboard/presentations/rewards/domain/entities/remove_reward_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/notices/show_notices.dart';
import 'package:dio/dio.dart';

abstract class RemoveRewardDataSource {
  Future<String> removeReward(RemoveRewardEntity removeRewardEntity);
}

class RemoveRewardDataSourceWithDio extends RemoveRewardDataSource {
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
    } on ClientAdminError catch (error) {
      log('ClientAdminError: ${error.message}', name: 'RemoveReward');
      throw ServerAdminError(message: error.message);
    } on DioException catch (dioError) {
      log('DioException: ${dioError.message}', name: 'RemoveReward');
      throw ServerAdminError(message: ShowNotices.internetError);
    } catch (error, stackTrace) {
      log(
        'Unhandled Exception: $error',
        stackTrace: stackTrace,
        name: 'RemoveReward',
      );
      throw ServerAdminError(
        message: message.isEmpty ? ShowNotices.abnormalError : message,
      );
    }
  }
}
