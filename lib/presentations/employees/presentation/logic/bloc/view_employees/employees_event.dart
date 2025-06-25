part of 'employees_bloc.dart';

sealed class EmployeesEvent extends Equatable {
  const EmployeesEvent();

  @override
  List<Object> get props => [];
}

class GetEmployeesEvent extends EmployeesEvent {}

// ignore: must_be_immutable
class ReGetEmployeesEvent extends EmployeesEvent {
  String link;
  ReGetEmployeesEvent({required this.link});
}
