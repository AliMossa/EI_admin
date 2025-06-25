import 'package:admin_dashboard/presentations/employees/domain/entities/active_user_entity.dart';
import 'package:admin_dashboard/presentations/employees/domain/repositories/employee_repository.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class UnActiveEmployeeUseCase {
  EmployeeRepository employeeRepository;
  UnActiveEmployeeUseCase({required this.employeeRepository});

  Future<Either<AdminExceptions, String>> call(
    ActiveUserEntity activeEmployeeEntity,
  ) async {
    return await employeeRepository.unActiveEmployee(activeEmployeeEntity);
  }
}
