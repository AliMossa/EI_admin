import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:admin_dashboard/presentations/public/sidebar/logic/bloc/logout_bloc.dart';
import 'package:admin_dashboard/presentations/public/sidebar/widgets/accept_logout_widget.dart';
import 'package:admin_dashboard/presentations/public/sidebar/widgets/cancle_logout_widget.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:admin_dashboard/util/safe_storage/safe_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SidebarMiddleware {
  SidebarMiddleware? _instance;
  SidebarMiddleware get() => _instance ?? (_instance = SidebarMiddleware());

  double getCorrectWidth(double width, double height) {
    return height > 1.5 * width
        ? width * .4
        : width <= 700 && width >= 450
        ? width * .1
        : width * .15;
  }

  Color getAroundSelectedItem(
    int index,
    int selectedIndex,
    ChangePageState state,
  ) {
    // if (state is ChangePageToSearchState) return mainColor;
    // ;

    return index == selectedIndex ? selecteSideBarItem1 : Colors.transparent;
  }

  Color getInsideSelectedItem(
    int index,
    int selectedIndex,
    ChangePageState state,
  ) {
    //if (state is ChangePageToSearchState) return selecteSideBarItem1;

    return index == selectedIndex ? selecteSideBarItem2 : selecteSideBarItem1;
  }

  Future<void> removeToken() async {
    await SafeStorage.clearAllData();
  }

  showNotice(
    BuildContext context,
    Size size,
    LogoutBloc bloc,
    String title,
    String content,
  ) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder:
          (_) => BlocProvider.value(
            value: bloc,
            child: BlocBuilder<LogoutBloc, LogoutState>(
              builder: (context, state) {
                return AlertDialog(
                  title: Text(title),
                  content: Text(content),
                  actions: [
                    state is LaodingSendLogoutState
                        ? const Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.white,
                          ),
                        )
                        : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AcceptLogoutWidget(
                              onPressed: () => bloc.add(SendLogoutEvent()),
                              title: 'ok',
                            ),
                            const CancleLogoutWidget(),
                          ],
                        ),
                  ],
                );
              },
            ),
          ),
    );
  }

  bool checkCorrectColor(ChangePageState state) {
    if (state is MoveToSearchPageState ||
        state is MoveToAddEmployeesPageState ||
        state is MoveToViewEmployeePageState ||
        state is MoveToAddUserPageState ||
        state is MoveToViewUserPageState ||
        state is MoveToViewRequestsPageState ||
        state is MoveToViewUpdateRewardPageState ||
        state is MoveToViewPropertyPageState ||
        state is MoveToAddAdminCommonQuestionPageState ||
        state is MoveToViewCommonQuestionPageState) {
      return true;
    }
    return false;
  }
}
