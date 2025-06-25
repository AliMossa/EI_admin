part of 'add_employee_bloc.dart';

sealed class AddEmployeeState extends Equatable {
  const AddEmployeeState();

  @override
  List<Object> get props => [];
}

final class AddEmployeeInitial extends AddEmployeeState {}

class UpdateIdImagesAddEmployeeState extends AddEmployeeState {}

class LoadingUpdateIdImagesAddEmployeeState extends AddEmployeeState {}

class RemoveIdImagesAddEmployeeState extends AddEmployeeState {}

class LoadingRemoveIdImagesAddEmployeeState extends AddEmployeeState {}

class LoadingAddNewEmployeeState extends AddEmployeeState {}

class SuccessAddNewEmployeeState extends AddEmployeeState {}

// ignore: must_be_immutable
class FailedAddNewEmployeeState extends AddEmployeeState {
  String message;
  FailedAddNewEmployeeState({required this.message});
}
