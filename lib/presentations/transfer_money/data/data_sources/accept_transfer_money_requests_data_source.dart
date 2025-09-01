import 'dart:developer';

import 'package:admin_dashboard/presentations/transfer_money/domain/entities/accept_transfer_money_entity.dart';
import 'package:admin_dashboard/presentations/transfer_money/domain/entities/reject_transfer_money_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/notices/show_notices.dart';
import 'package:dio/dio.dart';

abstract class AcceptTransferMoneyRequestsDataSource {
  Future<String> acceptTransferMoneyRequest(AcceptTransferMoneyEntity accept);
}

class AcceptTransferMoneyRequestsDataSourceWithDio
    extends AcceptTransferMoneyRequestsDataSource {
  @override
  Future<String> acceptTransferMoneyRequest(
    AcceptTransferMoneyEntity accept,
  ) async {
    String message = '';
    try {
      final response = await Apis().post(
        '${NetworkApisRouts().getTransferMoneyRequests()}/${accept.id}/approve_process',
        FormData.fromMap({
          'transaction_reference': accept.transactionReference,
        }),
        accept.token,
      );
      if (response['errors'] == null) {
        message = response['message'];
      } else {
        message = response['message'] ?? response['errors'];
        throw Exception();
      }

      return message;
    } on ClientAdminError catch (error) {
      log('ClientAdminError: ${error.message}', name: 'AcceptTransferMoney');
      throw ServerAdminError(message: error.message);
    } on DioException catch (dioError) {
      log('DioException: ${dioError.message}', name: 'AcceptTransferMoney');
      throw ServerAdminError(message: ShowNotices.internetError);
    } catch (error, stackTrace) {
      log(
        'Unhandled Exception: $error',
        stackTrace: stackTrace,
        name: 'AcceptTransferMoney',
      );
      throw ServerAdminError(
        message: message.isEmpty ? ShowNotices.abnormalError : message,
      );
    }
  }
}
