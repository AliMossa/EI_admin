import 'dart:developer';

import 'package:admin_dashboard/presentations/rewards/domain/entities/reward_entity.dart';
import 'package:admin_dashboard/presentations/rewards/domain/entities/total_reward_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/notices/show_notices.dart';
import 'package:dio/dio.dart';

abstract class GetRewardsDataSource {
  Future<TotalRewardEntity> getRewards(String token);
}

class GetRewardsDataSourceWithDio extends GetRewardsDataSource {
  @override
  Future<TotalRewardEntity> getRewards(String token) async {
    String message = '';
    List<RewardEntity> list = [];
    try {
      final response = await Apis().get(
        NetworkApisRouts().getAllRewardsApi(),
        {},
        token,
      );
      for (Map<String, dynamic> item in response['data']) {
        list.add(
          RewardEntity(
            id: item['id'],
            percentage: item['percentage'],
            amountThreshold: item['amount_threshold'],
            level: item['level'],
            times: item['number_of_times'],
            createdAt: item['created_at'],
            updatedAt: item['updated_at'],
          ),
        );
      }
      if (response['errors'] == null) {
        message = response['message'];
      } else {
        message = response['message'] ?? response['errors'];
        throw Exception();
      }

      return TotalRewardEntity(nextPage: '', rewards: list);
    } on ClientAdminError catch (error) {
      log('ClientAdminError: ${error.message}', name: 'GetRewards');
      throw ServerAdminError(message: error.message);
    } on DioException catch (dioError) {
      log('DioException: ${dioError.message}', name: 'GetRewards');
      throw ServerAdminError(message: ShowNotices.internetError);
    } catch (error, stackTrace) {
      log(
        'Unhandled Exception: $error',
        stackTrace: stackTrace,
        name: 'GetRewards',
      );
      throw ServerAdminError(
        message: message.isEmpty ? ShowNotices.abnormalError : message,
      );
    }
  }
}
