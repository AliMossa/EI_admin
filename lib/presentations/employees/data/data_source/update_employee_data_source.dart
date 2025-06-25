import 'package:admin_dashboard/presentations/employees/domain/entities/update_employee_total_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:dio/dio.dart';

abstract class UpdateEmployeeDataSource {
  Future<String> updateEmployee(UpdateEmployeeTotalEntity updateEmployeeEntity);
}

class UpdateEmployeeDataSourceWithDio extends UpdateEmployeeDataSource {
  UpdateEmployeeDataSourceWithDio? _updateEmployeeDataSourceWithDio;
  UpdateEmployeeDataSourceWithDio get() =>
      _updateEmployeeDataSourceWithDio ??
      (_updateEmployeeDataSourceWithDio = UpdateEmployeeDataSourceWithDio());
  @override
  Future<String> updateEmployee(
    UpdateEmployeeTotalEntity updateEmployeeEntity,
  ) async {
    String message = '';
    try {
      final response = await Apis().post(
        '${NetworkApisRouts().updateEmployeeApi()}${updateEmployeeEntity.id}',
        FormData.fromMap({
          if (updateEmployeeEntity.updateEmployeeEntity.name!.isNotEmpty)
            'name': updateEmployeeEntity.updateEmployeeEntity.name,
          if (updateEmployeeEntity.updateEmployeeEntity.email!.isNotEmpty)
            'email': updateEmployeeEntity.updateEmployeeEntity.email,
          if (updateEmployeeEntity.updateEmployeeEntity.phone!.isNotEmpty)
            'phone': updateEmployeeEntity.updateEmployeeEntity.phone,
          if (updateEmployeeEntity.updateEmployeeEntity.roleId != -1)
            'role_id': updateEmployeeEntity.updateEmployeeEntity.roleId,
          if (updateEmployeeEntity.updateEmployeeEntity.fatherName!.isNotEmpty)
            'father_name': updateEmployeeEntity.updateEmployeeEntity.fatherName,
          if (updateEmployeeEntity.updateEmployeeEntity.motherName!.isNotEmpty)
            'mother_name': updateEmployeeEntity.updateEmployeeEntity.motherName,
          if (updateEmployeeEntity.updateEmployeeEntity.address!.isNotEmpty)
            'current_address':
                updateEmployeeEntity.updateEmployeeEntity.address,
          if (updateEmployeeEntity.updateEmployeeEntity.dateOfBirth!.isNotEmpty)
            'date_of_birth':
                updateEmployeeEntity.updateEmployeeEntity.dateOfBirth,

          if (updateEmployeeEntity
                  .updateEmployeeEntity
                  .frontIdImage!
                  .filename !=
              MultipartFile.fromString('value').filename)
            'front_id_image':
                updateEmployeeEntity.updateEmployeeEntity.frontIdImage,
          if (updateEmployeeEntity.updateEmployeeEntity.backIdImage!.filename !=
              MultipartFile.fromString('value').filename)
            'back_id_image':
                updateEmployeeEntity.updateEmployeeEntity.backIdImage,
          if (updateEmployeeEntity
                  .updateEmployeeEntity
                  .personalPhoto!
                  .filename !=
              MultipartFile.fromString('value').filename)
            'personal_photo':
                updateEmployeeEntity.updateEmployeeEntity.personalPhoto,
        }),
        updateEmployeeEntity.token,
      );
      if (response['errors'] == null) {
        message = response['message'];
      } else {
        message = response['message'] ?? response['errors'];
        throw ServerAdminError(message: message);
      }
      return message;
    } catch (error) {
      throw ServerAdminError(message: message);
    }
  }
}
