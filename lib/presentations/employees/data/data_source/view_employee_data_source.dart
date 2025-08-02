import 'dart:developer';

import 'package:admin_dashboard/presentations/employees/domain/entities/view_employee_entity.dart';
import 'package:admin_dashboard/presentations/employees/domain/entities/view_entity_request_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/notices/show_notices.dart';
import 'package:dio/dio.dart';

abstract class ViewEmployeeDataSource {
  Future<ViewEmployeeEntity> viewEmployee(
    ViewEmployeeRequestEntity viewEntityRequestEntity,
  );
}

class ViewEmployeeDataSourceWithDio extends ViewEmployeeDataSource {
  @override
  Future<ViewEmployeeEntity> viewEmployee(
    ViewEmployeeRequestEntity viewEntityRequestEntity,
  ) async {
    String message = '';
    try {
      final response = await Apis().get(
        '${NetworkApisRouts().viewEmployeeApi()}${viewEntityRequestEntity.id}',
        {},
        viewEntityRequestEntity.token,
      );
      if (response['errors'] == null) {
        message = response['message'];
      } else {
        message = response['message'] ?? response['errors'];
        throw Exception();
      }
      Map<String, dynamic> item = response['data'];
      return ViewEmployeeEntity(
        id: item['id'],
        roleId: item['role_id'],
        isAcitve: item['active'],
        name: item['name'],
        fatherName: item['father_name'],
        motherName: item['mother_name'],
        phone: item['phone'],
        email: item['email'],
        dateOfBirth: item['date_of_birth'],
        address: item['current_address'],
        personalPhoto: item['personal_photo'],
        frontIdImage: item['front_id_image'],
        backIdImage: item['back_id_image'],
      );
    } on ClientAdminError catch (error) {
      log('ClientAdminError: ${error.message}', name: 'ViewEmployee');
      throw ServerAdminError(message: error.message);
    } on DioException catch (dioError) {
      log('DioException: ${dioError.message}', name: 'ViewEmployee');
      throw ServerAdminError(message: ShowNotices.internetError);
    } catch (error, stackTrace) {
      log(
        'Unhandled Exception: $error',
        stackTrace: stackTrace,
        name: 'ViewEmployee',
      );
      throw ServerAdminError(
        message: message.isEmpty ? ShowNotices.abnormalError : message,
      );
    }
  }
}
