import 'package:admin_dashboard/presentations/employees/domain/entities/employee_enitity.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class TotalEmployeesEntity extends Equatable {
  List<EmployeeEnitity> employees;
  String nextPage;
  TotalEmployeesEntity({required this.employees, required this.nextPage});
  factory TotalEmployeesEntity.init() =>
      TotalEmployeesEntity(employees: [], nextPage: '');
  @override
  List<Object?> get props => [employees, nextPage];
}
