import 'package:admin_dashboard/presentations/home/data/repositories/home_repository_imp_source.dart';
import 'package:admin_dashboard/presentations/home/domain/use_cases/get_monies_rates_use_case.dart';
import 'package:admin_dashboard/presentations/home/domain/use_cases/get_requests_statistics_use_case.dart';
import 'package:admin_dashboard/presentations/home/domain/use_cases/get_statistics_of_uses_use_case.dart';
import 'package:admin_dashboard/presentations/home/domain/use_cases/get_success_statistics_use_case.dart';
import 'package:admin_dashboard/presentations/home/presentation/logic/bloc/requests_statistics_bloc.dart';
import 'package:admin_dashboard/presentations/home/presentation/logic/cubit/statistics_date_cubit.dart';
import 'package:admin_dashboard/presentations/home/presentation/logic/monies_rates/monies_rates_bloc.dart';
import 'package:admin_dashboard/presentations/home/presentation/logic/statistics_of_users/statistics_of_users_bloc.dart';
import 'package:admin_dashboard/presentations/home/presentation/logic/success_statistics/success_statistics_bloc.dart';
import 'package:admin_dashboard/presentations/home/presentation/middleware/home_middleware.dart';
import 'package:admin_dashboard/presentations/home/presentation/widgets/home_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  final HomeMiddleware _homeMiddleware = HomeMiddleware();
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => MoniesRatesBloc(
                homeMiddleware: _homeMiddleware,
                getMoniesRatesUseCase: GetMoniesRatesUseCase(
                  homeRepository: HomeRepositoryImpSource(),
                ),
              )..add(GetAllMoniesRatesEvent()),
        ),
        BlocProvider(
          create:
              (context) => StatisticsOfUsersBloc(
                homeMiddleware: _homeMiddleware,
                getStatisticsOfUsesUseCase: GetStatisticsOfUsesUseCase(
                  homeRepository: HomeRepositoryImpSource(),
                ),
              )..add(GetStatisticsOfusersEvent()),
        ),
        BlocProvider(
          create:
              (context) => SuccessStatisticsBloc(
                homeMiddleware: _homeMiddleware,
                getSuccessStatisticsUseCase: GetSuccessStatisticsUseCase(
                  homeRepository: HomeRepositoryImpSource(),
                ),
              )..add(GetSuccessStatisticsEvent(year: DateTime.now().year)),
        ),
        BlocProvider(
          create:
              (context) => RequestsStatisticsBloc(
                homeMiddleware: _homeMiddleware,
                getRequestsStatisticsUseCase: GetRequestsStatisticsUseCase(
                  homeRepository: HomeRepositoryImpSource(),
                ),
              )..add(GetAllRequestsStatisticsEvent(year: DateTime.now().year)),
        ),
        BlocProvider(
          create:
              (context) => StatisticsDateCubit(homeMiddleware: _homeMiddleware),
        ),
      ],
      child: const HomeItems(),
    );
  }
}
