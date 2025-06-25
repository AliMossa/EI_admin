import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class EmployeeEnitity extends Equatable {
  int id;
  int roleId;
  String name;
  String joinedDate;
  EmployeeEnitity({
    required this.id,
    required this.roleId,
    required this.name,
    required this.joinedDate,
  });

  @override
  List<Object?> get props => [id, roleId, name, joinedDate];
}
