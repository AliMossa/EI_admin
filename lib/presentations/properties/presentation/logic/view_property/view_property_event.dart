part of 'view_property_bloc.dart';

sealed class ViewPropertyEvent extends Equatable {
  const ViewPropertyEvent();

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class ViewPropertyInfoEvent extends ViewPropertyEvent {
  int id;
  ViewPropertyInfoEvent({required this.id});
}

// ignore: must_be_immutable
class SetPropertySoldEvent extends ViewPropertyEvent {
  int id;
  SetPropertySoldEvent({required this.id});
}

// ignore: must_be_immutable
class NewPropertyStudyEvent extends ViewPropertyEvent {
  int id;
  NewPropertyStudyEvent({required this.id});
}
