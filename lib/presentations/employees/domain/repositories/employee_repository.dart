import 'package:admin_dashboard/presentations/employees/domain/entities/active_user_entity.dart';
import 'package:admin_dashboard/presentations/employees/domain/entities/add_employee_entity.dart';
import 'package:admin_dashboard/presentations/employees/domain/entities/get_employees_request_entity.dart';
import 'package:admin_dashboard/presentations/employees/domain/entities/total_employees_entity.dart';
import 'package:admin_dashboard/presentations/employees/domain/entities/update_employee_total_entity.dart';
import 'package:admin_dashboard/presentations/employees/domain/entities/view_employee_entity.dart';
import 'package:admin_dashboard/presentations/employees/domain/entities/view_entity_request_entity.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

abstract class EmployeeRepository {
  Future<Either<AdminExceptions, TotalEmployeesEntity>> getEmployees(
    GetEmployeesRequestEntity getEmployeesRequestEntity,
  );
  Future<Either<AdminExceptions, TotalEmployeesEntity>> reGetEmployees(
    String link,
  );
  Future<Either<AdminExceptions, ViewEmployeeEntity>> viewEmployee(
    ViewEmployeeRequestEntity viewEntityRequestEntity,
  );
  Future<Either<AdminExceptions, String>> addEmployee(
    AddEmployeeEntity addEmployeeEntity,
  );
  Future<Either<AdminExceptions, String>> activeEmployee(
    ActiveUserEntity activeUserEntity,
  );
  Future<Either<AdminExceptions, String>> unActiveEmployee(
    ActiveUserEntity activeUserEntity,
  );
  Future<Either<AdminExceptions, String>> updateEmployee(
    UpdateEmployeeTotalEntity updateEmployee,
  );
}
