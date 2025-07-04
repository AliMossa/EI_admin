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
class MoveToEmployeesPageEvent extends ChangePageEvent {
  MoveToEmployeesPageEvent({required super.title});
}

// ignore: must_be_immutable
class MoveToAddEmployeesPageEvent extends ChangePageEvent {
  MoveToAddEmployeesPageEvent({required super.title});
}

// ignore: must_be_immutable
class MoveToViewEmployeePageEvent extends ChangePageEvent {
  int id;
  MoveToViewEmployeePageEvent({required this.id, required super.title});
}

// ignore: must_be_immutable
class MoveToUsersPageEvent extends ChangePageEvent {
  MoveToUsersPageEvent({required super.title});
}

// ignore: must_be_immutable
class MoveToAddUserPageEvent extends ChangePageEvent {
  MoveToAddUserPageEvent({required super.title});
}

// ignore: must_be_immutable
class MoveToViewUserPageEvent extends ChangePageEvent {
  int id;
  MoveToViewUserPageEvent({required this.id, required super.title});
}

// ignore: must_be_immutable
class MoveToRequestsPageEvent extends ChangePageEvent {
  MoveToRequestsPageEvent({required super.title});
}

// ignore: must_be_immutable
class MoveToViewRequestsPageEvent extends ChangePageEvent {
  int id;
  MoveToViewRequestsPageEvent({required this.id, required super.title});
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

// ignore: must_be_immutable
class MoveToHistoryPageEvent extends ChangePageEvent {
  int id;
  ChangePageEvent backWordFunction;
  MoveToHistoryPageEvent({
    required this.id,
    required this.backWordFunction,
    required super.title,
  });
}

// ignore: must_be_immutable
class MoveToSearchPageEvent extends ChangePageEvent {
  MoveToSearchPageEvent({required super.title});
}

// ignore: must_be_immutable
class MoveToViewCommonQuestionPageEvent extends ChangePageEvent {
  MoveToViewCommonQuestionPageEvent({required super.title});
}

// ignore: must_be_immutable
class MoveToAddAdminCommonQuestionPageEvent extends ChangePageEvent {
  MoveToAddAdminCommonQuestionPageEvent({required super.title});
}

// ignore: must_be_immutable
class MoveToRewardsPageEvent extends ChangePageEvent {
  MoveToRewardsPageEvent({required super.title});
}

// ignore: must_be_immutable
class MoveToAddRewardPageEvent extends ChangePageEvent {
  MoveToAddRewardPageEvent({required super.title});
}

// ignore: must_be_immutable
class MoveToViewUpdateRewardPageEvent extends ChangePageEvent {
  int id;
  MoveToViewUpdateRewardPageEvent({required this.id, required super.title});
}

// ignore: must_be_immutable
class MoveToViewPropertyPageEvent extends ChangePageEvent {
  int id;
  MoveToViewPropertyPageEvent({required this.id, required super.title});
}

// ignore: must_be_immutable
class MoveToChangePsswordPageEvent extends ChangePageEvent {
  MoveToChangePsswordPageEvent({required super.title});
}
