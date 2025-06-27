import 'package:admin_dashboard/presentations/home/domain/entities/monies_rates_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';

abstract class GetMoniesRatesDataSource {
  Future<MoniesRatesEntity> getMoniesRates();
}

class GetMoniesRatesDataSourceWithDio extends GetMoniesRatesDataSource {
  GetMoniesRatesDataSourceWithDio? _getMoniesRatesDataSourceWithDio;
  GetMoniesRatesDataSourceWithDio get() =>
      _getMoniesRatesDataSourceWithDio ??
      (_getMoniesRatesDataSourceWithDio = GetMoniesRatesDataSourceWithDio());

  @override
  Future<MoniesRatesEntity> getMoniesRates() async {
    String message = '';
    try {
      final response = await Apis().get(
        NetworkApisRouts().getMoniesRatesApi(),
        {},
        '',
      );
      if (response['errors'] == null) {
        message = response['message'];
      } else {
        message = response['message'] ?? response['errors'];
        throw Exception();
      }
      final item = response['rates'];
      return MoniesRatesEntity(
        USD: double.parse((item['USD'] * 1.0).toStringAsFixed(2)),
        EUR: double.parse((item['EUR'] * 1.0).toStringAsFixed(2)),
        JPY: double.parse((item['JPY'] * 1.0).toStringAsFixed(2)),
        SYR: double.parse((item['SYP'] * 1.0).toStringAsFixed(2)),
      );
    } on ClientAdminError catch (error) {
      throw ServerAdminError(message: error.message);
    } catch (error) {
      throw ServerAdminError(message: 'error');
    }
  }
}
