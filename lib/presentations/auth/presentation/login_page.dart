import 'package:admin_dashboard/presentations/auth/data/repositories_sources/auth_rempository_imp_source.dart';
import 'package:admin_dashboard/presentations/auth/domain/use_cases/login_use_case.dart';
import 'package:admin_dashboard/presentations/auth/presentation/logic/login/login_bloc.dart';
import 'package:admin_dashboard/presentations/auth/presentation/middleware/auth_middleware.dart';
import 'package:admin_dashboard/presentations/auth/presentation/widgets/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  final AuthMiddleware _authMiddleware = AuthMiddleware.get();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => LoginBloc(
            loginUseCase: LoginUseCase(
              authRepository: AuthRempositoryImpSource(),
            ),
            authMiddleware: _authMiddleware,
          )..add(Check()),
      child: ItemWidget(),
    );
  }
}
