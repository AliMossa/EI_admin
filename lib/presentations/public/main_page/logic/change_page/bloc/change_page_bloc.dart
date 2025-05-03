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
    on<MoveToLoggingProfilePageEvent>(moveToLoggingProfilePage);
    on<MoveToAddEmployeesPageEvent>(moveToAddEmployeesPage);
    on<MoveToEmployeesPageEvent>(moveToEmployeesPage);
    on<MoveToUsersPageEvent>(moveToUsersPage);
    on<MoveToRequestsPageEvent>(moveToRequestsPage);
    on<MoveToPropertiesPageEvent>(moveToPropertiesPage);
    on<MoveToQuestionsPageEvent>(moveToQuestionsPage);
    on<MoveToSettingsPageEvent>(moveToSettingsPage);
  }

  void moveToHomePage(
    MoveToHomePageEvent event,
    Emitter<ChangePageState> emit,
  ) => emit(MoveToHomePageState(title: event.title));

  void moveToProfilePage(
    MoveToProfilePageEvent event,
    Emitter<ChangePageState> emit,
  ) => emit(MoveToProfilePageState(title: event.title));

  void moveToLoggingProfilePage(
    MoveToLoggingProfilePageEvent event,
    Emitter<ChangePageState> emit,
  ) => emit(MoveToLoggingProfilePageState(title: event.title));

  void moveToEmployeesPage(
    MoveToEmployeesPageEvent event,
    Emitter<ChangePageState> emit,
  ) => emit(MoveToEmployeesPageState(title: event.title));

  void moveToAddEmployeesPage(
    MoveToAddEmployeesPageEvent event,
    Emitter<ChangePageState> emit,
  ) => emit(MoveToAddEmployeesPageState(title: event.title));

  void moveToUsersPage(
    MoveToUsersPageEvent event,
    Emitter<ChangePageState> emit,
  ) => emit(MoveToUsersPageState(title: event.title));

  void moveToRequestsPage(
    MoveToRequestsPageEvent event,
    Emitter<ChangePageState> emit,
  ) => emit(MoveToRequestsPageState(title: event.title));

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
}
