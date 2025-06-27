import 'package:admin_dashboard/presentations/employees/domain/entities/add_employee_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:dio/dio.dart';

abstract class AddEmployeeDataSource {
  Future<String> addEmployee(AddEmployeeEntity addEmployeeEntity);
}

class AddEmployeeDataSourceWithDio extends AddEmployeeDataSource {
  AddEmployeeDataSourceWithDio? _addEmployeeDataSourceWithDio;
  AddEmployeeDataSourceWithDio get() =>
      _addEmployeeDataSourceWithDio ??
      (_addEmployeeDataSourceWithDio = AddEmployeeDataSourceWithDio());

  @override
  Future<String> addEmployee(AddEmployeeEntity addEmployeeEntity) async {
    String message = '';
    try {
      final basicResponse = await Apis().post(
        NetworkApisRouts().addBasicEmployeeInfoApi(),
        FormData.fromMap({
          'name': addEmployeeEntity.employee.name,
          'email': addEmployeeEntity.employee.email,
          'password': addEmployeeEntity.employee.password,
          'password_confirmation': addEmployeeEntity.employee.confrimPassword,
          'role_id': addEmployeeEntity.employee.roleId,
          'phone': addEmployeeEntity.employee.phone,
        }),
        '',
      );
      // if (basicResponse['errors'] == null) {
      //   message = basicResponse['message'];
      // } else {
      //   message = basicResponse['message'] ?? basicResponse['errors'];
      //   throw Exception();
      // }
      final additionalResponse = await Apis().post(
        '${NetworkApisRouts().addAdditionalEmployeeInfoApi()}${basicResponse['user']['id']}',
        FormData.fromMap({
          'current_address': addEmployeeEntity.employee.address,
          'front_id_image': addEmployeeEntity.employee.frontIdImage,
          'back_id_image': addEmployeeEntity.employee.backIdImage,
          'personal_photo': addEmployeeEntity.employee.personalPhoto,
          'date_of_birth': addEmployeeEntity.employee.dateOfBirth,
          'father_name': addEmployeeEntity.employee.fatherName,
          'mother_name': addEmployeeEntity.employee.motherName,
        }),
        addEmployeeEntity.token,
      );

      return message;
    } on ClientAdminError catch (error) {
      throw ServerAdminError(message: error.message);
    } catch (error) {
      print(error);
      throw ServerAdminError(message: message);
    }
  }
}
