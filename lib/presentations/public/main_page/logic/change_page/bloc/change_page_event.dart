part of 'change_page_bloc.dart';

// ignore: must_be_immutable
sealed class ChangePageEvent extends Equatable {
  String title;
  ChangePageEvent({required this.title});

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class MoveToHomePageEvent extends ChangePageEvent {
  MoveToHomePageEvent({required super.title});
}

// ignore: must_be_immutable
class MoveToProfilePageEvent extends ChangePageEvent {
  MoveToProfilePageEvent({required super.title});
}

// ignore: must_be_immutable
class MoveToLoggingProfilePageEvent extends ChangePageEvent {
  MoveToLoggingProfilePageEvent({required super.title});
}

// ignore: must_be_immutable
class MoveToEmployeesPageEvent extends ChangePageEvent {
  MoveToEmployeesPageEvent({required super.title});
}

// ignore: must_be_immutable
class MoveToAddEmployeesPageEvent extends ChangePageEvent {
  MoveToAddEmployeesPageEvent({required super.title});
}

// ignore: must_be_immutable
class MoveToUsersPageEvent extends ChangePageEvent {
  MoveToUsersPageEvent({required super.title});
}

// ignore: must_be_immutable
class MoveToRequestsPageEvent extends ChangePageEvent {
  MoveToRequestsPageEvent({required super.title});
}

// ignore: must_be_immutable
class MoveToPropertiesPageEvent extends ChangePageEvent {
  MoveToPropertiesPageEvent({required super.title});
}

// ignore: must_be_immutable
class MoveToQuestionsPageEvent extends ChangePageEvent {
  MoveToQuestionsPageEvent({required super.title});
}

// ignore: must_be_immutable
class MoveToSettingsPageEvent extends ChangePageEvent {
  MoveToSettingsPageEvent({required super.title});
}
