import 'package:admin_dashboard/presentations/employees/domain/entities/total_employees_entity.dart';
import 'package:admin_dashboard/presentations/employees/domain/repositories/employee_repository.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class ReGetEmployeesUseCase {
  EmployeeRepository employeeRepository;
  ReGetEmployeesUseCase({required this.employeeRepository});
  Future<Either<AdminExceptions, TotalEmployeesEntity>> call(
    String link,
  ) async {
    return await employeeRepository.reGetEmployees(link);
  }
}
