part of 'view_property_bloc.dart';

sealed class ViewPropertyState extends Equatable {
  const ViewPropertyState();

  @override
  List<Object> get props => [];
}

final class ViewPropertyInitial extends ViewPropertyState {}

class LoadingViewPropertyInfoState extends ViewPropertyState {}

class SuccessViewPropertyInfoState extends ViewPropertyState {}

// ignore: must_be_immutable
class FailedViewPropertyInfoState extends ViewPropertyState {
  String message;
  FailedViewPropertyInfoState({required this.message});
}

class LoadingSetPropertySoldState extends ViewPropertyState {}

class SuccessSetPropertySoldState extends ViewPropertyState {}

// ignore: must_be_immutable
class FailedSetPropertySoldState extends ViewPropertyState {
  String message;
  FailedSetPropertySoldState({required this.message});
}

class LoadingNewPropertyStudyState extends ViewPropertyState {}

class SuccessNewPropertyStudyState extends ViewPropertyState {}

// ignore: must_be_immutable
class FailedNewPropertyStudyState extends ViewPropertyState {
  String message;
  FailedNewPropertyStudyState({required this.message});
}
