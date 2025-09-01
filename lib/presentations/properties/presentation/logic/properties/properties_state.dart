part of 'properties_bloc.dart';

sealed class PropertiesState extends Equatable {
  const PropertiesState();

  @override
  List<Object> get props => [];
}

final class PropertiesInitial extends PropertiesState {}

class GetCorrectPropertiesState extends PropertiesState {}

class LoadingGetPropertiesState extends PropertiesState {}

class SuccessGetPropertiesState extends PropertiesState {}

// ignore: must_be_immutable
class FailedGetPropertiesState extends PropertiesState {
  String message;
  FailedGetPropertiesState({required this.message});
}

class LoadingReGetPropertiesState extends PropertiesState {}

class SuccessReGetPropertiesState extends PropertiesState {}

// ignore: must_be_immutable
class FailedReGetPropertiesState extends PropertiesState {
  String message;
  FailedReGetPropertiesState({required this.message});
}

class LoadingGetSoldPropertiesState extends PropertiesState {}

class SuccessGetSoldPropertiesState extends PropertiesState {}

// ignore: must_be_immutable
class FailedGetSoldPropertiesState extends PropertiesState {
  String message;
  FailedGetSoldPropertiesState({required this.message});
}

class LoadingReGetSoldPropertiesState extends PropertiesState {}

class SuccessReGetSoldPropertiesState extends PropertiesState {}

// ignore: must_be_immutable
class FailedReGetSoldPropertiesState extends PropertiesState {
  String message;
  FailedReGetSoldPropertiesState({required this.message});
}

class LoadingGetViewedPropertiesState extends PropertiesState {}

class SuccessGetViewedPropertiesState extends PropertiesState {}

// ignore: must_be_immutable
class FailedGetViewedPropertiesState extends PropertiesState {
  String message;
  FailedGetViewedPropertiesState({required this.message});
}
