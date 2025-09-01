import 'package:admin_dashboard/presentations/public/auth/auth_page.dart';
import 'package:admin_dashboard/presentations/public/auth/logic/bloc/auth_bloc.dart';
import 'package:admin_dashboard/presentations/public/auth/middleware/auth_widget_middleware.dart';
import 'package:admin_dashboard/presentations/public/main_page/main_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Routes {
  GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder:
            (context, state) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create:
                      (context) =>
                          AuthBloc(authWidgetMiddleware: AuthWidgetMiddleware())
                            ..add(MoveToLoginPageEvent()),
                ),
              ],
              child: AuthPage(),
            ),
      ),
      GoRoute(path: '/home', builder: (context, state) => MainPage()),
    ],
  );
}
