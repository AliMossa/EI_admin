import 'dart:developer';

import 'package:admin_dashboard/presentations/home/domain/entities/monies_rates_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/notices/show_notices.dart';
import 'package:dio/dio.dart';

abstract class GetMoniesRatesDataSource {
  Future<MoniesRatesEntity> getMoniesRates();
}

class GetMoniesRatesDataSourceWithDio extends GetMoniesRatesDataSource {
  @override
  Future<MoniesRatesEntity> getMoniesRates() async {
    String message = '';
    try {
      final response = await Apis().get(
        NetworkApisRouts().getMoniesRatesApi(),
        {},
        '',
      );

      final item = response['rates'];

      return MoniesRatesEntity(
        USD: double.parse((item['USD'] * 1.0).toStringAsFixed(2)),
        EUR: double.parse((item['EUR'] * 1.0).toStringAsFixed(2)),
        JPY: double.parse((item['JPY'] * 1.0).toStringAsFixed(2)),
        SYR: double.parse((item['SYP'] * 1.0).toStringAsFixed(2)),
        TRY: double.parse((item['TRY'] * 1.0).toStringAsFixed(2)),
      );
    } on ClientAdminError catch (error) {
      log('ClientAdminError: ${error.message}', name: 'GetMoniesRates');
      throw ServerAdminError(message: error.message);
    } on DioException catch (dioError) {
      log('DioException: ${dioError.message}', name: 'GetMoniesRates');
      throw ServerAdminError(message: ShowNotices.internetError);
    } catch (error, stackTrace) {
      log(
        'Unhandled Exception: $error',
        stackTrace: stackTrace,
        name: 'GetMoniesRates',
      );
      throw ServerAdminError(message: ShowNotices.abnormalError);
    }
  }
}
