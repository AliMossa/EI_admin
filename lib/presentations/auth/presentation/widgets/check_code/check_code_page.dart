import 'package:admin_dashboard/presentations/auth/data/repositories_sources/auth_rempository_imp_source.dart';
import 'package:admin_dashboard/presentations/auth/domain/use_cases/verify_code_use_case.dart';
import 'package:admin_dashboard/presentations/auth/presentation/logic/bloc/check_code_bloc.dart';
import 'package:admin_dashboard/presentations/auth/presentation/middleware/auth_middleware.dart';
import 'package:admin_dashboard/presentations/auth/presentation/widgets/check_code/check_code_items_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckCodePage extends StatelessWidget {
  final AuthMiddleware _authMiddleware = AuthMiddleware.get();

  CheckCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => CheckCodeBloc(
            verifyCodeUseCase: VerifyCodeUseCase(
              authRepository: AuthRempositoryImpSource(),
            ),
            authMiddleware: _authMiddleware,
          ),
      child: CheckCodeItemsWidget(),
    );
  }
}
