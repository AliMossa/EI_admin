part of 'add_employee_bloc.dart';

sealed class AddEmployeeEvent extends Equatable {
  const AddEmployeeEvent();

  @override
  List<Object> get props => [];
}

class UpdateIdImagesEmployeesEvent extends AddEmployeeEvent {}

class RemoveIdImagesEmployeesEvent extends AddEmployeeEvent {}

class AddNewEmployeeEvent extends AddEmployeeEvent {}
