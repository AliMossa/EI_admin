import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class GetEmployeesRequestEntity extends Equatable {
  int isAcive;
  int employeeKind;
  String token;

  GetEmployeesRequestEntity({
    required this.isAcive,
    required this.employeeKind,
    required this.token,
  });

  @override
  List<Object?> get props => [isAcive, employeeKind, token];
}
