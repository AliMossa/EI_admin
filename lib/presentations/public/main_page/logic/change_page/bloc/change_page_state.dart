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
class MoveToEmployeesPageState extends ChangePageState {
  MoveToEmployeesPageState({required super.title});
}

// ignore: must_be_immutable
class MoveToAddEmployeesPageState extends ChangePageState {
  MoveToAddEmployeesPageState({required super.title});
}

// ignore: must_be_immutable
class MoveToViewEmployeePageState extends ChangePageState {
  int id;
  MoveToViewEmployeePageState({required this.id, required super.title});
}

// ignore: must_be_immutable
class MoveToAddUserPageState extends ChangePageState {
  MoveToAddUserPageState({required super.title});
}

// ignore: must_be_immutable
class MoveToUsersPageState extends ChangePageState {
  MoveToUsersPageState({required super.title});
}

// ignore: must_be_immutable
class MoveToViewUserPageState extends ChangePageState {
  int id;
  MoveToViewUserPageState({required this.id, required super.title});
}

// ignore: must_be_immutable
class MoveToRequestsPageState extends ChangePageState {
  MoveToRequestsPageState({required super.title});
}

// ignore: must_be_immutable
class MoveToViewRequestsPageState extends ChangePageState {
  int id;

  MoveToViewRequestsPageState({required this.id, required super.title});
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

// ignore: must_be_immutable
class MoveToHistoryPageState extends ChangePageState {
  int id;
  ChangePageEvent backWordFunction;
  MoveToHistoryPageState({
    required this.id,
    required this.backWordFunction,
    required super.title,
  });
}

// ignore: must_be_immutable
class MoveToSearchPageState extends ChangePageState {
  MoveToSearchPageState({required super.title});
}

// ignore: must_be_immutable
class MoveToViewCommonQuestionPageState extends ChangePageState {
  MoveToViewCommonQuestionPageState({required super.title});
}

// ignore: must_be_immutable
class MoveToAddAdminCommonQuestionPageState extends ChangePageState {
  MoveToAddAdminCommonQuestionPageState({required super.title});
}

// ignore: must_be_immutable
class MoveToRewardsPageState extends ChangePageState {
  MoveToRewardsPageState({required super.title});
}

// ignore: must_be_immutable
class MoveToAddRewardPageState extends ChangePageState {
  MoveToAddRewardPageState({required super.title});
}

// ignore: must_be_immutable
class MoveToViewUpdateRewardPageState extends ChangePageState {
  int id;
  MoveToViewUpdateRewardPageState({required this.id, required super.title});
}

// ignore: must_be_immutable
class MoveToViewPropertyPageState extends ChangePageState {
  int id;
  MoveToViewPropertyPageState({required this.id, required super.title});
}

// ignore: must_be_immutable
class MoveToChangePsswordPageState extends ChangePageState {
  MoveToChangePsswordPageState({required super.title});
}

// ignore: must_be_immutable
class MoveToWalletPageState extends ChangePageState {
  MoveToWalletPageState({required super.title});
}
