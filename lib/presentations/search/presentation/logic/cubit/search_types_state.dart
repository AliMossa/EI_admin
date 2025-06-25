part of 'search_types_cubit.dart';

sealed class SearchTypesState extends Equatable {
  const SearchTypesState();

  @override
  List<Object> get props => [];
}

final class SearchTypesInitial extends SearchTypesState {}

class ChangeSearchTypeState extends SearchTypesState {}

class LoadingChangeSearchTypeState extends SearchTypesState {}
