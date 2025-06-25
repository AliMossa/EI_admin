part of 'properties_types_cubit.dart';

sealed class PropertiesTypesState extends Equatable {
  const PropertiesTypesState();

  @override
  List<Object> get props => [];
}

final class PropertiesTypesInitial extends PropertiesTypesState {}

class LoadingChangePropertiesTypes extends PropertiesTypesState {}

class ChangePropertiesTypes extends PropertiesTypesState {}
