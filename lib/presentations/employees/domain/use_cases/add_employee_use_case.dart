import 'package:admin_dashboard/presentations/employees/domain/entities/add_employee_entity.dart';
import 'package:admin_dashboard/presentations/employees/domain/repositories/employee_repository.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class AddEmployeeUseCase {
  EmployeeRepository employeeRepository;
  AddEmployeeUseCase({required this.employeeRepository});
  Future<Either<AdminExceptions, String>> call(
    AddEmployeeEntity addEmployeeEntity,
  ) async {
    return employeeRepository.addEmployee(addEmployeeEntity);
  }
}
