part of 'requests_bloc.dart';

sealed class RequestsState extends Equatable {
  const RequestsState();

  @override
  List<Object> get props => [];
}

final class RequestsInitial extends RequestsState {}

class LoadingGetAllRequestsState extends RequestsState {}

class SuccessGetAllRequestsState extends RequestsState {}

// ignore: must_be_immutable
class FailedGetAllRequestsState extends RequestsState {
  String message;
  FailedGetAllRequestsState({required this.message});
}

class LoadingReGetAllRequestsState extends RequestsState {}

class SuccessReGetAllRequestsState extends RequestsState {}

// ignore: must_be_immutable
class FailedReGetAllRequestsState extends RequestsState {
  String message;
  FailedReGetAllRequestsState({required this.message});
}
