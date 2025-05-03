part of 'employee_image_cubit.dart';

sealed class EmployeeImageState extends Equatable {
  const EmployeeImageState();

  @override
  List<Object> get props => [];
}

final class EmployeeImageInitial extends EmployeeImageState {}

class HoverEmployeeImageState extends EmployeeImageState {}

class EndHoverEmployeeImageState extends EmployeeImageState {}
