import 'dart:developer';

import 'package:admin_dashboard/presentations/transfer_money/domain/entities/add_deposit_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/notices/show_notices.dart';
import 'package:dio/dio.dart';

abstract class AddDepositDataSource {
  Future<String> addDeposit(AddDepositEntity addDepositEntity);
}

class AddDepositDataSourceWithDio extends AddDepositDataSource {
  @override
  Future<String> addDeposit(AddDepositEntity addDepositEntity) async {
    String message = '';
    try {
      final response = await Apis().post(
        NetworkApisRouts().addDeposit(),
        FormData.fromMap({
          'user_id': addDepositEntity.userId,
          'amount': addDepositEntity.amount,
        }),
        addDepositEntity.token,
      );
      if (response['errors'] == null) {
        message = response['message'];
      } else {
        message = response['message'] ?? response['errors'];
        throw Exception();
      }
      return message;
    } on ClientAdminError catch (error) {
      log('ClientAdminError: ${error.message}', name: 'addDeposit');
      throw ServerAdminError(message: error.message);
    } on DioException catch (dioError) {
      log('DioException: ${dioError.message}', name: 'addDeposit');
      throw ServerAdminError(message: ShowNotices.internetError);
    } catch (error, stackTrace) {
      log(
        'Unhandled Exception: $error',
        stackTrace: stackTrace,
        name: 'addDeposit',
      );
      throw ServerAdminError(
        message: message.isEmpty ? ShowNotices.abnormalError : message,
      );
    }
  }
}
