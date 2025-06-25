import 'package:admin_dashboard/presentations/auth/data/repositories_sources/auth_rempository_imp_source.dart';
import 'package:admin_dashboard/presentations/auth/domain/use_cases/reset_password_use_case.dart';
import 'package:admin_dashboard/presentations/auth/presentation/logic/reset_password/reset_password_bloc.dart';
import 'package:admin_dashboard/presentations/auth/presentation/middleware/auth_middleware.dart';
import 'package:admin_dashboard/presentations/auth/presentation/widgets/reset_password/reset_password_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordPage extends StatelessWidget {
  final AuthMiddleware _authMiddleware = AuthMiddleware.get();

  ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => ResetPasswordBloc(
            resetPasswordUseCase: ResetPasswordUseCase(
              authRepository: AuthRempositoryImpSource(),
            ),
            authMiddleware: _authMiddleware,
          ),
      child: ResetPasswordItems(),
    );
  }
}
