import 'package:admin_dashboard/presentations/employees/domain/entities/update_employee_total_entity.dart';
import 'package:admin_dashboard/presentations/employees/domain/repositories/employee_repository.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class UpdateEmployeeUseCase {
  EmployeeRepository employeeRepository;
  UpdateEmployeeUseCase({required this.employeeRepository});

  Future<Either<AdminExceptions, String>> call(
    UpdateEmployeeTotalEntity updateEmployeeEntity,
  ) async {
    return await employeeRepository.updateEmployee(updateEmployeeEntity);
  }
}
