import 'package:admin_dashboard/presentations/employees/data/data_source/active_employee_data_source.dart';
import 'package:admin_dashboard/presentations/employees/data/data_source/add_employee_data_source.dart';
import 'package:admin_dashboard/presentations/employees/data/data_source/get_employees_data_source.dart';
import 'package:admin_dashboard/presentations/employees/data/data_source/re_get_employees_data_source.dart';
import 'package:admin_dashboard/presentations/employees/data/data_source/un_active_employee_data_source.dart';
import 'package:admin_dashboard/presentations/employees/data/data_source/update_employee_data_source.dart';
import 'package:admin_dashboard/presentations/employees/data/data_source/view_employee_data_source.dart';
import 'package:admin_dashboard/presentations/employees/domain/entities/active_user_entity.dart';
import 'package:admin_dashboard/presentations/employees/domain/entities/add_employee_entity.dart';
import 'package:admin_dashboard/presentations/employees/domain/entities/get_employees_request_entity.dart';
import 'package:admin_dashboard/presentations/employees/domain/entities/total_employees_entity.dart';
import 'package:admin_dashboard/presentations/employees/domain/entities/update_employee_total_entity.dart';
import 'package:admin_dashboard/presentations/employees/domain/entities/view_employee_entity.dart';
import 'package:admin_dashboard/presentations/employees/domain/entities/view_entity_request_entity.dart';
import 'package:admin_dashboard/presentations/employees/domain/repositories/employee_repository.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class EmployeeRempositoryImpSource implements EmployeeRepository {
  @override
  Future<Either<AdminExceptions, TotalEmployeesEntity>> getEmployees(
    GetEmployeesRequestEntity getEmployeesRequestEntity,
  ) async {
    try {
      return right(
        await GetEmployeesDataSourceWithDio().getEmployees(
          getEmployeesRequestEntity,
        ),
      );
    } on ServerAdminError catch (error) {
      return left(ServerAdminException(message: error.message));
    }
  }

  @override
  Future<Either<AdminExceptions, ViewEmployeeEntity>> viewEmployee(
    ViewEmployeeRequestEntity viewEntityRequestEntity,
  ) async {
    try {
      return right(
        await ViewEmployeeDataSourceWithDio().viewEmployee(
          viewEntityRequestEntity,
        ),
      );
    } on ServerAdminError catch (error) {
      return left(ServerAdminException(message: error.message));
    }
  }

  @override
  Future<Either<AdminExceptions, String>> addEmployee(
    AddEmployeeEntity addEmployeeEntity,
  ) async {
    try {
      return right(
        await AddEmployeeDataSourceWithDio().addEmployee(addEmployeeEntity),
      );
    } on ServerAdminError catch (error) {
      return left(ServerAdminException(message: error.message));
    }
  }

  @override
  Future<Either<AdminExceptions, String>> activeEmployee(
    ActiveUserEntity activeUserEntity,
  ) async {
    try {
      return right(
        await ActiveEmployeeDataSourceWithDio().activeEmployee(
          activeUserEntity,
        ),
      );
    } on ServerAdminError catch (error) {
      return left(ServerAdminException(message: error.message));
    }
  }

  @override
  Future<Either<AdminExceptions, String>> unActiveEmployee(
    ActiveUserEntity activeUserEntity,
  ) async {
    try {
      return right(
        await UnActiveEmployeeDataSourceWithDio().unActiveEmployee(
          activeUserEntity,
        ),
      );
    } on ServerAdminError catch (error) {
      return left(ServerAdminException(message: error.message));
    }
  }

  @override
  Future<Either<AdminExceptions, String>> updateEmployee(
    UpdateEmployeeTotalEntity updateEmployee,
  ) async {
    try {
      return right(
        await UpdateEmployeeDataSourceWithDio().updateEmployee(updateEmployee),
      );
    } on ServerAdminError catch (error) {
      return left(ServerAdminException(message: error.message));
    }
  }

  @override
  Future<Either<AdminExceptions, TotalEmployeesEntity>> reGetEmployees(
    String link,
  ) async {
    try {
      return right(
        await ReGetEmployeesDataSourceWithDio().reGetEmployees(link),
      );
    } on ServerAdminError catch (error) {
      return left(ServerAdminException(message: error.message));
    }
  }
}
