part of 'request_info_bloc.dart';

sealed class RequestInfoEvent extends Equatable {
  const RequestInfoEvent();

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class ViewRequestInfoEvent extends RequestInfoEvent {
  int id;
  ViewRequestInfoEvent({required this.id});
}

// ignore: must_be_immutable
class AcceptPropertyRequestEvent extends RequestInfoEvent {
  int id;
  AcceptPropertyRequestEvent({required this.id});
}

// ignore: must_be_immutable
class RejectPropertyRequestEvent extends RequestInfoEvent {
  int id;
  RejectPropertyRequestEvent({required this.id});
}
