part of 'change_page_bloc.dart';

// ignore: must_be_immutable
sealed class ChangePageState extends Equatable {
  String title;
  ChangePageState({required this.title});

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
final class ChangePageInitial extends ChangePageState {
  ChangePageInitial({required super.title});
}

// ignore: must_be_immutable
class MoveToHomePageState extends ChangePageState {
  MoveToHomePageState({required super.title});
}

// ignore: must_be_immutable
class MoveToProfilePageState extends ChangePageState {
  MoveToProfilePageState({required super.title});
}

// ignore: must_be_immutable
class MoveToLoggingProfilePageState extends ChangePageState {
  MoveToLoggingProfilePageState({required super.title});
}

// ignore: must_be_immutable
class MoveToEmployeesPageState extends ChangePageState {
  MoveToEmployeesPageState({required super.title});
}

// ignore: must_be_immutable
class MoveToAddEmployeesPageState extends ChangePageState {
  MoveToAddEmployeesPageState({required super.title});
}

// ignore: must_be_immutable
class MoveToUsersPageState extends ChangePageState {
  MoveToUsersPageState({required super.title});
}

// ignore: must_be_immutable
class MoveToRequestsPageState extends ChangePageState {
  MoveToRequestsPageState({required super.title});
}

// ignore: must_be_immutable
class MoveToPropertiesPageState extends ChangePageState {
  MoveToPropertiesPageState({required super.title});
}

// ignore: must_be_immutable
class MoveToQuestionsPageState extends ChangePageState {
  MoveToQuestionsPageState({required super.title});
}

// ignore: must_be_immutable
class MoveToSettingsPageState extends ChangePageState {
  MoveToSettingsPageState({required super.title});
}
