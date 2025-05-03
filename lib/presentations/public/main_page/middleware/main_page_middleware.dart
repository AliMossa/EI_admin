import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';

class MainPageMiddleware {
  String title = '';

  void changeTitle(ChangePageState state) {
    title = state.title;
  }
}
