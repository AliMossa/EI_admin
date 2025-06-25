part of 'view_update_employee_bloc.dart';

sealed class ViewUpdateEmployeeState extends Equatable {
  const ViewUpdateEmployeeState();

  @override
  List<Object> get props => [];
}

final class ViewUpdateEmployeeInitial extends ViewUpdateEmployeeState {}

class LoadingViewEmployeesState extends ViewUpdateEmployeeState {}

class SuccessViewEmployeesState extends ViewUpdateEmployeeState {}

// ignore: must_be_immutable
class FailedViewEmployeesState extends ViewUpdateEmployeeState {
  String message;
  FailedViewEmployeesState({required this.message});
}

class LoadingActiveEmployeesState extends ViewUpdateEmployeeState {}

class SuccessActiveEmployeesState extends ViewUpdateEmployeeState {}

// ignore: must_be_immutable
class FailedActiveEmployeesState extends ViewUpdateEmployeeState {
  String message;
  FailedActiveEmployeesState({required this.message});
}

class LoadingUnActiveEmployeesState extends ViewUpdateEmployeeState {}

class SuccessUnActiveEmployeesState extends ViewUpdateEmployeeState {}

// ignore: must_be_immutable
class FailedUnActiveEmployeesState extends ViewUpdateEmployeeState {
  String message;
  FailedUnActiveEmployeesState({required this.message});
}

class LoadingUpdateEmployeesState extends ViewUpdateEmployeeState {}

class SuccessUpdateEmployeesState extends ViewUpdateEmployeeState {}

// ignore: must_be_immutable
class FailedUpdateEmployeesState extends ViewUpdateEmployeeState {
  String message;
  FailedUpdateEmployeesState({required this.message});
}

class UpdateEmployeeIdImage extends ViewUpdateEmployeeState {}

class LoadingUpdateEmployeeIdImage extends ViewUpdateEmployeeState {}
