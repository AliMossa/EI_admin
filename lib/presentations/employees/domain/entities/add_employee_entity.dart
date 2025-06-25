import 'package:admin_dashboard/presentations/employees/domain/entities/add_employee_info_entity.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class AddEmployeeEntity extends Equatable {
  String token;
  AddEmployeeInfoEntity employee;
  AddEmployeeEntity({required this.token, required this.employee});

  @override
  List<Object?> get props => [token, employee];
}
