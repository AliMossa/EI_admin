part of 'requests_bloc.dart';

sealed class RequestsEvent extends Equatable {
  const RequestsEvent();

  @override
  List<Object> get props => [];
}

class GetAllRequestsEvent extends RequestsEvent {}

// ignore: must_be_immutable
class ReGetAllRequestsEvent extends RequestsEvent {
  String link;
  ReGetAllRequestsEvent({required this.link});
}
