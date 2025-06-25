import 'package:admin_dashboard/presentations/profile/data/repositories_sources/profile_repository_imp_source.dart';
import 'package:admin_dashboard/presentations/profile/domain/use_cases/get_logs_use_case.dart';
import 'package:admin_dashboard/presentations/profile/domain/use_cases/re_get_logs_use_case.dart';
import 'package:admin_dashboard/presentations/profile/presentation/logic/bloc/profile_logs_bloc.dart';
import 'package:admin_dashboard/presentations/profile/presentation/middleware/profile_middleware.dart';
import 'package:admin_dashboard/presentations/profile/presentation/widgets/logs/logs_items.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileLogsPage extends StatelessWidget {
  const ProfileLogsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => ProfileLogsBloc(
            profileMiddleware: ProfileMiddleware().get(),
            reGetLogsUseCase: ReGetLogsUseCase(
              profileRepository: ProfileRepositoryImpSource(),
            ),
            getLogsUseCase: GetLogsUseCase(
              profileRespository: ProfileRepositoryImpSource(),
            ),
          )..add(GetProfileLogsEvent()),
      child: LogsItems(),
    );
  }
}
