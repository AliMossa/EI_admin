import 'package:admin_dashboard/presentations/rewards/data/repositories_imp_sources/reward_repository_imp_source.dart';
import 'package:admin_dashboard/presentations/rewards/domain/use_cases/get_rewards_use_case.dart';
import 'package:admin_dashboard/presentations/rewards/domain/use_cases/re_get_rewards_use_case.dart';
import 'package:admin_dashboard/presentations/rewards/presentation/logic/get_reawards/rewards_bloc.dart';
import 'package:admin_dashboard/presentations/rewards/presentation/middlewares/rewards_middleware.dart';
import 'package:admin_dashboard/presentations/rewards/presentation/widgets/rewards_items.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RewardsPage extends StatelessWidget {
  final RewardsMiddleware _rewardsMiddleware = RewardsMiddleware().get();
  RewardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RewardsBloc>(
      create:
          (context) => RewardsBloc(
            reGetRewardsUseCase: ReGetRewardsUseCase(
              rewardsRepository: RewardRepositoryImpSource(),
            ),
            getRewardsUseCase: GetRewardsUseCase(
              rewardsRepository: RewardRepositoryImpSource(),
            ),
            rewardsMiddleware: _rewardsMiddleware,
          )..add(GetRewardsEvent()),
      child: RewardsItems(),
    );
  }
}
