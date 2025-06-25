import 'package:admin_dashboard/presentations/employees/domain/entities/update_employee_entity.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class UpdateEmployeeTotalEntity extends Equatable {
  int id;
  String token;
  UpdateEmployeeEntity updateEmployeeEntity;
  UpdateEmployeeTotalEntity({
    required this.id,
    required this.token,
    required this.updateEmployeeEntity,
  });

  @override
  List<Object?> get props => [id, token, updateEmployeeEntity];
}
