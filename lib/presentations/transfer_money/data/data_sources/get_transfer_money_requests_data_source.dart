import 'dart:developer';

import 'package:admin_dashboard/presentations/transfer_money/domain/entities/tansfer_money_entity.dart';
import 'package:admin_dashboard/presentations/transfer_money/domain/entities/transfer_money_list_entity.dart';
import 'package:admin_dashboard/presentations/transfer_money/domain/entities/transfer_money_request_entity.dart';
import 'package:admin_dashboard/presentations/transfer_money/presentation/widget/transfer_momey_list_items_widget.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/notices/show_notices.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

abstract class GetTransferMoneyRequestsDataSource {
  Future<TransferMoneyListEntity> getTransferMoneyRequests(
    TransferMoneyRequestEntity transfertMoneyRequest,
  );
}

class GetTransferMoneyRequestsDataSourceWithDio
    extends GetTransferMoneyRequestsDataSource {
  @override
  Future<TransferMoneyListEntity> getTransferMoneyRequests(
    TransferMoneyRequestEntity transfertMoneyRequest,
  ) async {
    String message = '';
    List<TransferMoneyEntity> list = [];
    try {
      final response = await Apis().get(
        "${NetworkApisRouts().getTransferMoneyRequests()}?status=pending&method=${transfertMoneyRequest.type}",
        {},
        transfertMoneyRequest.token,
      );
      print(response);
      for (Map<String, dynamic> item in response['data']) {
        list.add(
          TransferMoneyEntity(
            id: item['id'],
            userId: item['user_id'],
            amount: NumberFormat.decimalPattern().format(
              double.parse(item['amount']),
            ),
            method: item['method'],
            fullName: item['user']['name'],
            phone: item['user']['phone'],
            createdAt: DateFormat().add_yMEd().add_jms().format(
              DateTime.parse(item['created_at']),
            ),

            accountHolderName: item['method_details']['Account_holder_name'],
            cardNumber: item['method_details']['Card_number'],
            walletAddress: item['method_details']['Wallet_address'],
          ),
        );
      }
      return TransferMoneyListEntity(requests: list, nextPage: '');
    } on ClientAdminError catch (error) {
      log(
        'ClientAdminError: ${error.message}',
        name: 'GetTransferMoneyRequests',
      );
      throw ServerAdminError(message: error.message);
    } on DioException catch (dioError) {
      log(
        'DioException: ${dioError.message}',
        name: 'GetTransferMoneyRequests',
      );
      throw ServerAdminError(message: ShowNotices.internetError);
    } catch (error, stackTrace) {
      log(
        'Unhandled Exception: $error',
        stackTrace: stackTrace,
        name: 'GetTransferMoneyRequests',
      );
      throw ServerAdminError(
        message: message.isEmpty ? ShowNotices.abnormalError : message,
      );
    }
  }
}
