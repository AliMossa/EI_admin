part of 'employees_bloc.dart';

sealed class EmployeesState extends Equatable {
  const EmployeesState();
  
  @override
  List<Object> get props => [];
}

final class EmployeesInitial extends EmployeesState {}
