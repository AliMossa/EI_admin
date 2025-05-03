import 'package:admin_dashboard/presentations/auth/presentation/logic/bloc/login_bloc.dart';
import 'package:admin_dashboard/presentations/auth/presentation/logic/cubit/login_pages_cubit.dart';
import 'package:admin_dashboard/presentations/auth/presentation/login_page.dart';
import 'package:admin_dashboard/presentations/auth/presentation/middleware/auth_middleware.dart';
import 'package:admin_dashboard/presentations/public/main_page/main_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Routes {
  GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/home',
        builder:
            (context, state) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create:
                      (context) => LoginBloc(authMiddleware: AuthMiddleware()),
                ),
                BlocProvider<LoginPagesCubit>(
                  create: (context) => LoginPagesCubit()..moveToLogin(),
                ),
              ],
              child: LoginPage(),
            ),
      ),
      GoRoute(path: '/', builder: (context, state) => MainPage()),
    ],
  );
}
