import 'package:admin_dashboard/presentations/public/main_page/middleware/main_page_middleware.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'change_page_event.dart';
part 'change_page_state.dart';

class ChangePageBloc extends Bloc<ChangePageEvent, ChangePageState> {
  MainPageMiddleware mainPageMiddleware = MainPageMiddleware();
  ChangePageBloc() : super(ChangePageInitial(title: '')) {
    on<MoveToHomePageEvent>(moveToHomePage);
    on<MoveToProfilePageEvent>(moveToProfilePage);
    on<MoveToAddEmployeesPageEvent>(moveToAddEmployeesPage);
    on<MoveToEmployeesPageEvent>(moveToEmployeesPage);
    on<MoveToViewEmployeePageEvent>(moveToViewEmployeesPage);
    on<MoveToUsersPageEvent>(moveToUsersPage);
    on<MoveToViewUserPageEvent>(moveToViewUsersPage);
    on<MoveToAddUserPageEvent>(moveToAddUsersPage);
    on<MoveToRequestsPageEvent>(moveToRequestsPage);
    on<MoveToViewRequestsPageEvent>(moveToViewRequestsPage);
    on<MoveToPropertiesPageEvent>(moveToPropertiesPage);
    on<MoveToQuestionsPageEvent>(moveToQuestionsPage);
    on<MoveToSettingsPageEvent>(moveToSettingsPage);
    on<MoveToHistoryPageEvent>(moveToHistoryPage);
    on<MoveToSearchPageEvent>(moveToSearchPage);
    on<MoveToViewCommonQuestionPageEvent>(moveToViewCommonQuestoin);
    on<MoveToAddAdminCommonQuestionPageEvent>(moveToAddAdminCommonQuestoin);
    on<MoveToRewardsPageEvent>(moveToRewards);
    on<MoveToAddRewardPageEvent>(moveToAddReward);
    on<MoveToViewUpdateRewardPageEvent>(moveToUpdateReward);
    on<MoveToViewPropertyPageEvent>(moveToViewProperty);
    on<MoveToChangePsswordPageEvent>(moveToChangePassword);
    on<MoveToWalletPageEvent>(moveToWallet);
  }

  void moveToHomePage(
    MoveToHomePageEvent event,
    Emitter<ChangePageState> emit,
  ) => emit(MoveToHomePageState(title: event.title));

  void moveToProfilePage(
    MoveToProfilePageEvent event,
    Emitter<ChangePageState> emit,
  ) => emit(MoveToProfilePageState(title: event.title));

  void moveToEmployeesPage(
    MoveToEmployeesPageEvent event,
    Emitter<ChangePageState> emit,
  ) => emit(MoveToEmployeesPageState(title: event.title));

  void moveToAddEmployeesPage(
    MoveToAddEmployeesPageEvent event,
    Emitter<ChangePageState> emit,
  ) => emit(MoveToAddEmployeesPageState(title: event.title));

  void moveToViewEmployeesPage(
    MoveToViewEmployeePageEvent event,
    Emitter<ChangePageState> emit,
  ) => emit(MoveToViewEmployeePageState(id: event.id, title: event.title));

  void moveToUsersPage(
    MoveToUsersPageEvent event,
    Emitter<ChangePageState> emit,
  ) => emit(MoveToUsersPageState(title: event.title));

  void moveToAddUsersPage(
    MoveToAddUserPageEvent event,
    Emitter<ChangePageState> emit,
  ) => emit(MoveToAddUserPageState(title: event.title));

  void moveToViewUsersPage(
    MoveToViewUserPageEvent event,
    Emitter<ChangePageState> emit,
  ) => emit(MoveToViewUserPageState(title: event.title, id: event.id));

  void moveToRequestsPage(
    MoveToRequestsPageEvent event,
    Emitter<ChangePageState> emit,
  ) => emit(MoveToRequestsPageState(title: event.title));

  void moveToViewRequestsPage(
    MoveToViewRequestsPageEvent event,
    Emitter<ChangePageState> emit,
  ) => emit(MoveToViewRequestsPageState(id: event.id, title: event.title));

  void moveToPropertiesPage(
    MoveToPropertiesPageEvent event,
    Emitter<ChangePageState> emit,
  ) => emit(MoveToPropertiesPageState(title: event.title));

  void moveToQuestionsPage(
    MoveToQuestionsPageEvent event,
    Emitter<ChangePageState> emit,
  ) => emit(MoveToQuestionsPageState(title: event.title));

  void moveToSettingsPage(
    MoveToSettingsPageEvent event,
    Emitter<ChangePageState> emit,
  ) => emit(MoveToSettingsPageState(title: event.title));

  void moveToHistoryPage(
    MoveToHistoryPageEvent event,
    Emitter<ChangePageState> emit,
  ) => emit(
    MoveToHistoryPageState(
      id: event.id,
      backWordFunction: event.backWordFunction,
      title: event.title,
    ),
  );
  void moveToSearchPage(
    MoveToSearchPageEvent event,
    Emitter<ChangePageState> emit,
  ) => emit(MoveToSearchPageState(title: event.title));
  void moveToViewCommonQuestoin(
    MoveToViewCommonQuestionPageEvent event,
    Emitter<ChangePageState> emit,
  ) => emit(MoveToViewCommonQuestionPageState(title: event.title));
  void moveToAddAdminCommonQuestoin(
    MoveToAddAdminCommonQuestionPageEvent event,
    Emitter<ChangePageState> emit,
  ) => emit(MoveToAddAdminCommonQuestionPageState(title: event.title));

  void moveToRewards(
    MoveToRewardsPageEvent event,
    Emitter<ChangePageState> emit,
  ) => emit(MoveToRewardsPageState(title: event.title));

  void moveToAddReward(
    MoveToAddRewardPageEvent event,
    Emitter<ChangePageState> emit,
  ) => emit(MoveToAddRewardPageState(title: event.title));
  void moveToUpdateReward(
    MoveToViewUpdateRewardPageEvent event,
    Emitter<ChangePageState> emit,
  ) => emit(MoveToViewUpdateRewardPageState(title: event.title, id: event.id));

  void moveToViewProperty(
    MoveToViewPropertyPageEvent event,
    Emitter<ChangePageState> emit,
  ) => emit(MoveToViewPropertyPageState(title: event.title, id: event.id));

  void moveToChangePassword(
    MoveToChangePsswordPageEvent event,
    Emitter<ChangePageState> emit,
  ) => emit(MoveToChangePsswordPageState(title: event.title));

  void moveToWallet(
    MoveToWalletPageEvent event,
    Emitter<ChangePageState> emit,
  ) => emit(MoveToWalletPageState(title: event.title));
}
