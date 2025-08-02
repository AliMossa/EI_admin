import 'dart:developer';

import 'package:admin_dashboard/presentations/employees/domain/entities/employee_enitity.dart';
import 'package:admin_dashboard/presentations/employees/domain/entities/get_employees_request_entity.dart';
import 'package:admin_dashboard/presentations/employees/domain/entities/total_employees_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/notices/show_notices.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

abstract class GetEmployeesDataSource {
  Future<TotalEmployeesEntity> getEmployees(
    GetEmployeesRequestEntity getEmployeesRequestEntity,
  );
}

class GetEmployeesDataSourceWithDio extends GetEmployeesDataSource {
  @override
  Future<TotalEmployeesEntity> getEmployees(
    GetEmployeesRequestEntity getEmployeesRequestEntity,
  ) async {
    String message = '';
    List<EmployeeEnitity> list = [];
    try {
      final response = await Apis().post(
        NetworkApisRouts().getEmployeesApi(),
        FormData.fromMap({
          'role_id': getEmployeesRequestEntity.employeeKind,
          'active': getEmployeesRequestEntity.isAcive,
        }),
        getEmployeesRequestEntity.token,
      );

      if (response['errors'] == null) {
        message = response['message'];
      } else {
        message = response['message'] ?? response['errors'];
        throw Exception();
      }

      for (Map<String, dynamic> item in response['data']) {
        list.add(
          EmployeeEnitity(
            id: item['id'],
            roleId: item['role_id'],
            name: item['name'],
            joinedDate: DateFormat().add_yMEd().add_jms().format(
              DateTime.parse(item['created_at']),
            ),
          ),
        );
      }

      return TotalEmployeesEntity(employees: list, nextPage: '');
    } on ClientAdminError catch (error) {
      log('ClientAdminError: ${error.message}', name: 'GetEmployees');
      throw ServerAdminError(message: error.message);
    } on DioException catch (dioError) {
      log('DioException: ${dioError.message}', name: 'GetEmployees');
      throw ServerAdminError(message: ShowNotices.internetError);
    } catch (error, stackTrace) {
      log(
        'Unhandled Exception: $error',
        stackTrace: stackTrace,
        name: 'GetEmployees',
      );
      throw ServerAdminError(
        message: message.isEmpty ? ShowNotices.abnormalError : message,
      );
    }
  }
}
