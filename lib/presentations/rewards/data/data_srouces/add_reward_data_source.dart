import 'dart:developer';

import 'package:admin_dashboard/presentations/rewards/domain/entities/add_reward_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/notices/show_notices.dart';
import 'package:dio/dio.dart';

abstract class AddRewardDataSource {
  Future<String> addReward(AddRewardEntity addRewardEntity);
}

class AddRewardDataSourceWithDio extends AddRewardDataSource {
  @override
  Future<String> addReward(AddRewardEntity addRewardEntity) async {
    String message = '';
    try {
      final response = await Apis().post(
        NetworkApisRouts().addNewRewardApi(),
        FormData.fromMap({
          'level': addRewardEntity.data.level,
          'amount_threshold': addRewardEntity.data.amountThreshold,
          'percentage': addRewardEntity.data.percentage,
          'number_of_times': addRewardEntity.data.times,
        }),
        addRewardEntity.token,
      );
      if (response['errors'] == null) {
        message = response['message'];
      } else {
        message = response['message'] ?? response['errors'];
        throw Exception();
      }
      return message;
    } on ClientAdminError catch (error) {
      log('ClientAdminError: ${error.message}', name: 'AddReward');
      throw ServerAdminError(message: error.message);
    } on DioException catch (dioError) {
      log('DioException: ${dioError.message}', name: 'AddReward');
      throw ServerAdminError(message: ShowNotices.internetError);
    } catch (error, stackTrace) {
      log(
        'Unhandled Exception: $error',
        stackTrace: stackTrace,
        name: 'AddReward',
      );
      throw ServerAdminError(
        message: message.isEmpty ? ShowNotices.abnormalError : message,
      );
    }
  }
}
