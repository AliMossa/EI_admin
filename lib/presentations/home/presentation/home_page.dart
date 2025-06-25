import 'package:admin_dashboard/presentations/home/data/repositories/home_repository_imp_source.dart';
import 'package:admin_dashboard/presentations/home/domain/use_cases/get_success_statistics_use_case.dart';
import 'package:admin_dashboard/presentations/home/presentation/logic/bloc/success_statistics_bloc.dart';
import 'package:admin_dashboard/presentations/home/presentation/middleware/home_middleware.dart';
import 'package:admin_dashboard/presentations/home/presentation/widgets/home_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  final HomeMiddleware _homeMiddleware = HomeMiddleware();
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => SuccessStatisticsBloc(
            homeMiddleware: _homeMiddleware,
            getSuccessStatisticsUseCase: GetSuccessStatisticsUseCase(
              homeRepository: HomeRepositoryImpSource(),
            ),
          )..add(GetSuccessStatisticsEvent(year: DateTime.now().year)),
      child: const HomeItems(),
    );
  }
}
