import 'package:admin_dashboard/presentations/common_questions/presentation/common_questions_page.dart';
import 'package:admin_dashboard/presentations/common_questions/presentation/widgets/add_question/add_admin_question_page.dart';
import 'package:admin_dashboard/presentations/common_questions/presentation/widgets/view_question/view_question_page.dart';
import 'package:admin_dashboard/presentations/employees/presentation/employees_page.dart';
import 'package:admin_dashboard/presentations/employees/presentation/widgets/add_employee/add_employee_page.dart';
import 'package:admin_dashboard/presentations/employees/presentation/widgets/view_employee/view_update_employee_page.dart';
import 'package:admin_dashboard/presentations/home/presentation/home_page.dart';
import 'package:admin_dashboard/presentations/profile/presentation/profile_page.dart';
import 'package:admin_dashboard/presentations/properties/presentation/properties_page.dart';
import 'package:admin_dashboard/presentations/properties/presentation/widgets/view_property/view_property_page.dart';
import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:admin_dashboard/presentations/monitoring_history/presentation/monitoring_history_page.dart';
import 'package:admin_dashboard/presentations/requests/presentaiton/request_page.dart';
import 'package:admin_dashboard/presentations/requests/presentaiton/widgets/view_request/view_request_page.dart';
import 'package:admin_dashboard/presentations/rewards/presentation/rewards_page.dart';
import 'package:admin_dashboard/presentations/rewards/presentation/widgets/add_reward/add_reward_page.dart';
import 'package:admin_dashboard/presentations/rewards/presentation/widgets/view_upate_reward/view_update_rewards_page.dart';
import 'package:admin_dashboard/presentations/search/presentation/search_page.dart';
import 'package:admin_dashboard/presentations/settings/presentation/settings_page.dart';
import 'package:admin_dashboard/presentations/settings/presentation/widgets/change_password/change_password_page.dart';
import 'package:admin_dashboard/presentations/users/presentation/users_page.dart';
import 'package:admin_dashboard/presentations/users/presentation/widgets/add_user/add_user_page.dart';
import 'package:admin_dashboard/presentations/users/presentation/widgets/view_users/view_user_page.dart';
import 'package:admin_dashboard/presentations/wallet/presentation/wallet_page.dart';
import 'package:flutter/widgets.dart';

class MainPageMiddleware {
  String title = '';

  void changeTitle(ChangePageState state) {
    title = state.title;
  }

  Widget getPages(ChangePageState state) {
    switch (state) {
      case ChangePageInitial():
      case MoveToHomePageState():
        return HomePage();
      case MoveToProfilePageState():
        return ProfilePage();
      case MoveToEmployeesPageState():
        return EmployeesPage();
      case MoveToAddEmployeesPageState():
        return AddEmployeePage();
      case MoveToViewEmployeePageState():
        return ViewUpdateEmployeePage(id: state.id);
      case MoveToHistoryPageState():
        return MonitoringHistoryPage(
          id: state.id,
          backWordk: state.backWordFunction,
        );
      case MoveToAddUserPageState():
        return AddUserPage();
      case MoveToUsersPageState():
        return UsersPage();
      case MoveToViewUserPageState():
        return ViewUserPage(id: state.id);
      case MoveToRequestsPageState():
        return RequestPage();
      case MoveToViewRequestsPageState():
        return ViewRequestPage(id: state.id);
      case MoveToPropertiesPageState():
        return PropertiesPage();
      case MoveToQuestionsPageState():
        return CommonQuestionsPage();
      case MoveToSettingsPageState():
        return SettingsPage();
      case MoveToSearchPageState():
        return SearchPage();
      case MoveToViewCommonQuestionPageState():
        return ViewQuestionPage();
      case MoveToAddAdminCommonQuestionPageState():
        return AddAdminQuestionPage();
      case MoveToRewardsPageState():
        return RewardsPage();
      case MoveToAddRewardPageState():
        return AddRewardPage();
      case MoveToViewUpdateRewardPageState():
        return ViewUpdateRewardsPage(id: state.id);
      case MoveToViewPropertyPageState():
        return ViewPropertyPage(id: state.id);
      case MoveToChangePsswordPageState():
        return ChangePasswordPage();
      case MoveToWalletPageState():
        return WalletPage();
    }
  }
}
