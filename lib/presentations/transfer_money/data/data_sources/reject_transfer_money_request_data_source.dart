import 'dart:developer';

import 'package:admin_dashboard/presentations/transfer_money/domain/entities/reject_transfer_money_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/notices/show_notices.dart';
import 'package:dio/dio.dart';

abstract class RejectTransferMoneyRequestDataSource {
  Future<String> rejectTransferMoneyRequest(RejectTransferMoneyEntity reject);
}

class RejectTransferMoneyRequestDataSourceWithDio
    extends RejectTransferMoneyRequestDataSource {
  @override
  Future<String> rejectTransferMoneyRequest(
    RejectTransferMoneyEntity reject,
  ) async {
    String message = '';
    try {
      final response = await Apis().post(
        '${NetworkApisRouts().getTransferMoneyRequests()}/${reject.id}/reject',
        FormData.fromMap({'admin_notes': reject.notes}),
        reject.token,
      );
      if (response['errors'] == null) {
        message = response['message'];
      } else {
        message = response['message'] ?? response['errors'];
        throw Exception();
      }
      return message;
    } on ClientAdminError catch (error) {
      log('ClientAdminError: ${error.message}', name: 'RejectTransferMoney');
      throw ServerAdminError(message: error.message);
    } on DioException catch (dioError) {
      log('DioException: ${dioError.message}', name: 'RejectTransferMoney');
      throw ServerAdminError(message: ShowNotices.internetError);
    } catch (error, stackTrace) {
      log(
        'Unhandled Exception: $error',
        stackTrace: stackTrace,
        name: 'RejectTransferMoney',
      );
      throw ServerAdminError(
        message: message.isEmpty ? ShowNotices.abnormalError : message,
      );
    }
  }
}
