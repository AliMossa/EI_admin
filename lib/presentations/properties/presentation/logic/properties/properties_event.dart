part of 'properties_bloc.dart';

sealed class PropertiesEvent extends Equatable {
  const PropertiesEvent();

  @override
  List<Object> get props => [];
}

class GetPropertiesEvent extends PropertiesEvent {}

class GetCorrectPropertiesEvent extends PropertiesEvent {}

// ignore: must_be_immutable
class ReGetPropertiesEvent extends PropertiesEvent {
  String link;
  ReGetPropertiesEvent({required this.link});
}

class GetSoldPropertiesEvent extends PropertiesEvent {}

// ignore: must_be_immutable
class ReGetSoldPropertiesEvent extends PropertiesEvent {
  String link;
  ReGetSoldPropertiesEvent({required this.link});
}
