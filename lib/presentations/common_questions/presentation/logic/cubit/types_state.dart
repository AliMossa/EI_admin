part of 'types_cubit.dart';

sealed class TypesState extends Equatable {
  const TypesState();

  @override
  List<Object> get props => [];
}

final class TypesInitial extends TypesState {}

class ChangeTypesState extends TypesState {}

class LoadingChangeTypesState extends TypesState {}
