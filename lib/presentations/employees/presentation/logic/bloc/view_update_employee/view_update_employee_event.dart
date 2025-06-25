part of 'view_update_employee_bloc.dart';

sealed class ViewUpdateEmployeeEvent extends Equatable {
  const ViewUpdateEmployeeEvent();

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class ViewEmployeeEvent extends ViewUpdateEmployeeEvent {
  int id;
  ViewEmployeeEvent({required this.id});
}

// ignore: must_be_immutable
class ActiveEmployeeEvent extends ViewUpdateEmployeeEvent {
  int id;

  ActiveEmployeeEvent({required this.id});
}

// ignore: must_be_immutable
class UnActiveEmployeeEvent extends ViewUpdateEmployeeEvent {
  int id;

  UnActiveEmployeeEvent({required this.id});
}

// ignore: must_be_immutable
class UpdateEmployeeEvent extends ViewUpdateEmployeeEvent {
  int id;

  UpdateEmployeeEvent({required this.id});
}

class UpdateEmployeeIdImageEvent extends ViewUpdateEmployeeEvent {}
