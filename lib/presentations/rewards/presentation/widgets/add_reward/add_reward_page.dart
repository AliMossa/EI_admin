import 'package:admin_dashboard/presentations/rewards/data/repositories_imp_sources/reward_repository_imp_source.dart';
import 'package:admin_dashboard/presentations/rewards/domain/use_cases/add_reward_use_case.dart';
import 'package:admin_dashboard/presentations/rewards/presentation/logic/add_reward/add_reward_bloc.dart';
import 'package:admin_dashboard/presentations/rewards/presentation/middlewares/rewards_middleware.dart';
import 'package:admin_dashboard/presentations/rewards/presentation/widgets/add_reward/add_reward_item.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddRewardPage extends StatelessWidget {
  final RewardsMiddleware _rewardsMiddleware = RewardsMiddleware().get();
  AddRewardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddRewardBloc>(
      create:
          (context) => AddRewardBloc(
            rewardsMiddleware: _rewardsMiddleware,
            addRewardUseCase: AddRewardUseCase(
              rewardsRepository: RewardRepositoryImpSource(),
            ),
          ),
      child: AddRewardItem(),
    );
  }
}
