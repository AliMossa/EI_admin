import 'package:admin_dashboard/presentations/auth/data/repositories_sources/auth_rempository_imp_source.dart';
import 'package:admin_dashboard/presentations/auth/domain/use_cases/send_verifiication_code_use_case.dart';
import 'package:admin_dashboard/presentations/auth/presentation/logic/set_email_check_code/set_email_bloc.dart';
import 'package:admin_dashboard/presentations/auth/presentation/middleware/auth_middleware.dart';
import 'package:admin_dashboard/presentations/auth/presentation/widgets/set_email_check_code.dart/set_email_check_code_items.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetEmailCheckCodePage extends StatelessWidget {
  final AuthMiddleware _authMiddleware = AuthMiddleware.get();

  SetEmailCheckCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => SetEmailBloc(
            sendVerifiicationCodeUseCase: SendVerifiicationCodeUseCase(
              authRepository: AuthRempositoryImpSource(),
            ),
            authMiddleware: _authMiddleware,
          ),
      child: SetEmailCheckCodeItems(),
    );
  }
}
