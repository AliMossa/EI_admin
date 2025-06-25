part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SendSearchEvent extends SearchEvent {}

// ignore: must_be_immutable
class ReSendSearchEvent extends SearchEvent {
  String link;
  ReSendSearchEvent({required this.link});
}
