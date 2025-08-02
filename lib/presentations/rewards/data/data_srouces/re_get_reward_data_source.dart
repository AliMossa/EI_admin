import 'dart:developer';

import 'package:admin_dashboard/presentations/rewards/domain/entities/reward_entity.dart';
import 'package:admin_dashboard/presentations/rewards/domain/entities/total_reward_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/notices/show_notices.dart';
import 'package:dio/dio.dart';

abstract class ReGetRewardDataSource {
  Future<TotalRewardEntity> reGetRewards(String link);
}

class ReGetRewardDataSourceWithDio extends ReGetRewardDataSource {
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
      log('ClientAdminError: ${error.message}', name: 'ReGetReward');
      throw ServerAdminError(message: error.message);
    } on DioException catch (dioError) {
      log('DioException: ${dioError.message}', name: 'ReGetReward');
      throw ServerAdminError(message: ShowNotices.internetError);
    } catch (error, stackTrace) {
      log(
        'Unhandled Exception: $error',
        stackTrace: stackTrace,
        name: 'ReGetReward',
      );
      throw ServerAdminError(
        message: message.isEmpty ? ShowNotices.abnormalError : message,
      );
    }
  }
}
