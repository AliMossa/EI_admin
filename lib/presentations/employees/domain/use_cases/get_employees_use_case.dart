import 'package:admin_dashboard/presentations/employees/domain/entities/get_employees_request_entity.dart';
import 'package:admin_dashboard/presentations/employees/domain/entities/total_employees_entity.dart';
import 'package:admin_dashboard/presentations/employees/domain/repositories/employee_repository.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class GetEmployeesUseCase {
  EmployeeRepository employeeRepository;
  GetEmployeesUseCase({required this.employeeRepository});
  Future<Either<AdminExceptions, TotalEmployeesEntity>> call(
    GetEmployeesRequestEntity getEmployeesRequestEntity,
  ) async {
    return employeeRepository.getEmployees(getEmployeesRequestEntity);
  }
}
