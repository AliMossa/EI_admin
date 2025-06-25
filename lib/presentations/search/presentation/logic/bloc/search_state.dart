part of 'search_bloc.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

class LoadingSendSearchState extends SearchState {}

class SuccessSendSearchState extends SearchState {}

// ignore: must_be_immutable
class FailedSendSearchState extends SearchState {
  String message;
  FailedSendSearchState({required this.message});
}

class LoadingReSendSearchState extends SearchState {}

class SuccessReSendSearchState extends SearchState {}

// ignore: must_be_immutable
class FailedReSendSearchState extends SearchState {
  String message;
  FailedReSendSearchState({required this.message});
}
