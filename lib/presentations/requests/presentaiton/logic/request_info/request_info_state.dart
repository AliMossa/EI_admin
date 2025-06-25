part of 'request_info_bloc.dart';

sealed class RequestInfoState extends Equatable {
  const RequestInfoState();

  @override
  List<Object> get props => [];
}

final class RequestInfoInitial extends RequestInfoState {}

class LoadingViewRequestInfoState extends RequestInfoState {}

class SuccessViewRequestInfoState extends RequestInfoState {}

// ignore: must_be_immutable
class FailedViewRequestInfoState extends RequestInfoState {
  String message;
  FailedViewRequestInfoState({required this.message});
}

class LoadingAcceptPropertyRequestState extends RequestInfoState {}

class SuccessAcceptPropertyRequestState extends RequestInfoState {}

// ignore: must_be_immutable
class FailedAcceptPropertyRequestState extends RequestInfoState {
  String message;
  FailedAcceptPropertyRequestState({required this.message});
}

class LoadingRejectPropertyRequestState extends RequestInfoState {}

class SuccessRejectPropertyRequestState extends RequestInfoState {}

// ignore: must_be_immutable
class FailedRejectPropertyRequestState extends RequestInfoState {
  String message;
  FailedRejectPropertyRequestState({required this.message});
}
