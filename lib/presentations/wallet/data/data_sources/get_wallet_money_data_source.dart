import 'dart:developer';

import 'package:admin_dashboard/presentations/wallet/domain/entities/wallet_entity.dart';
import 'package:admin_dashboard/presentations/wallet/domain/entities/wallet_entity_request.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/notices/show_notices.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

abstract class GetWalletMoneyDataSource {
  Future<WalletEntity> getWalletMoney(WalletEntityRequest walletEntityRequest);
}

class GetWalletMoneyDataSourceWithDio extends GetWalletMoneyDataSource {
  @override
  Future<WalletEntity> getWalletMoney(
    WalletEntityRequest walletEntityRequest,
  ) async {
    String message = '';
    try {
      final response = await Apis().get(
        NetworkApisRouts().getWalletMoneyApi(),
        {},
        walletEntityRequest.token,
      );
      if (response['errors'] == null) {
        message = response['message'];
      } else {
        message = response['message'] ?? response['errors'];
        throw Exception();
      }
      final item = response['data'][0];
      return WalletEntity(
        id: item['id'],
        useId: item['user_id'],
        balance: NumberFormat.decimalPattern().format(
          double.parse(item['balance']),
        ),
        currency: item['currency'],
        walletType: item['wallet_type'],
        isActive: item['is_active'],
      );
    } on ClientAdminError catch (error) {
      log('ClientAdminError: ${error.message}', name: 'WalletMoney');
      throw ServerAdminError(message: error.message);
    } on DioException catch (dioError) {
      log('DioException: ${dioError.message}', name: 'WalletMoney');
      throw ServerAdminError(message: ShowNotices.internetError);
    } catch (error, stackTrace) {
      log(
        'Unhandled Exception: $error',
        stackTrace: stackTrace,
        name: 'WalletMoney',
      );
      throw ServerAdminError(
        message: message.isEmpty ? ShowNotices.abnormalError : message,
      );
    }
  }
}
