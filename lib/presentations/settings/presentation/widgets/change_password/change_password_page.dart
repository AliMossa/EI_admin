import 'package:admin_dashboard/presentations/settings/data/repositories_sources/settings_repository_imp_source.dart';
import 'package:admin_dashboard/presentations/settings/domain/use_cases/change_password_use_case.dart';
import 'package:admin_dashboard/presentations/settings/presentation/logic/bloc/password_bloc.dart';
import 'package:admin_dashboard/presentations/settings/presentation/middlewares/settings_middleware.dart';
import 'package:admin_dashboard/presentations/settings/presentation/widgets/change_password/change_password_items.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordPage extends StatelessWidget {
  final SettingsMiddleware _settingsMiddleware = SettingsMiddleware().get();
  ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PasswordBloc>(
      create:
          (context) => PasswordBloc(
            settingsMiddleware: _settingsMiddleware,
            changePasswordUseCase: ChangePasswordUseCase(
              settingsRepository: SettingsRepositoryImpSource(),
            ),
          ),
      child: const ChangePasswordItems(),
    );
  }
}
