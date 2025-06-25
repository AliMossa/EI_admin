import 'package:admin_dashboard/presentations/employees/domain/entities/view_employee_entity.dart';
import 'package:admin_dashboard/presentations/employees/domain/entities/view_entity_request_entity.dart';
import 'package:admin_dashboard/presentations/employees/domain/repositories/employee_repository.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class ViewEmployeeUseCase {
  EmployeeRepository employeeRepository;
  ViewEmployeeUseCase({required this.employeeRepository});
  Future<Either<AdminExceptions, ViewEmployeeEntity>> call(
    ViewEmployeeRequestEntity viewEntityRequestEntity,
  ) async {
    return await employeeRepository.viewEmployee(viewEntityRequestEntity);
  }
}
