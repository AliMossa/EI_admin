part of 'employees_bloc.dart';

sealed class EmployeesState extends Equatable {
  const EmployeesState();

  @override
  List<Object> get props => [];
}

final class EmployeesInitial extends EmployeesState {}

class LoadingGetEmployeesState extends EmployeesState {}

class SuccessGetEmployeesState extends EmployeesState {}

// ignore: must_be_immutable
class FailedGetEmployeesState extends EmployeesState {
  String message;
  FailedGetEmployeesState({required this.message});
}

class LoadingReGetEmployeesState extends EmployeesState {}

class SuccessReGetEmployeesState extends EmployeesState {}

// ignore: must_be_immutable
class FailedReGetEmployeesState extends EmployeesState {
  String message;
  FailedReGetEmployeesState({required this.message});
}
