import 'package:admin_dashboard/presentations/home/domain/entities/list_success_statistics_entity.dart';
import 'package:admin_dashboard/presentations/home/domain/entities/request_success_statistics_entity.dart';
import 'package:admin_dashboard/presentations/home/domain/entities/success_statistics_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:dio/dio.dart';

abstract class GetSuccessStatisticsDataSource {
  Future<ListSuccessStatisticsEntity> getSuccessStatistics(
    RequestSuccessStatisticsEntity requestSuccessStatisticsEntity,
  );
}

class GetSuccessStatisticsDataSourceWithDio
    extends GetSuccessStatisticsDataSource {
  GetSuccessStatisticsDataSourceWithDio? _getSuccessStatisticsDataSourceWithDio;
  GetSuccessStatisticsDataSourceWithDio get() =>
      _getSuccessStatisticsDataSourceWithDio ??
      (_getSuccessStatisticsDataSourceWithDio =
          GetSuccessStatisticsDataSourceWithDio());

  @override
  Future<ListSuccessStatisticsEntity> getSuccessStatistics(
    RequestSuccessStatisticsEntity requestSuccessStatisticsEntity,
  ) async {
    String message = '';
    List<SuccessStatisticsEntity> list = [
      //SuccessStatisticsEntity(id: 0, value: 0),
    ];
    try {
      final response = await Apis().post(
        NetworkApisRouts().getSuccessStatisticsApi(),
        FormData.fromMap({'year': requestSuccessStatisticsEntity.year}),
        requestSuccessStatisticsEntity.token,
      );
      if (response['errors'] == null) {
        message = response['message'];
      } else {
        message = response['message'] ?? response['errors'];
        throw Exception();
      }
      int index = 1;
      Map<String, dynamic> item = response['data'];
      while (index < 13) {
        list.add(
          SuccessStatisticsEntity(
            id: index,
            value: item[index.toString()] * 1.0,
          ),
        );
        index++;
      }
      return ListSuccessStatisticsEntity(statics: list);
    } on ClientAdminError catch (error) {
      throw ServerAdminError(message: error.message);
    } catch (error) {
      print(error);
      throw ServerAdminError(message: message);
    }
  }
}
