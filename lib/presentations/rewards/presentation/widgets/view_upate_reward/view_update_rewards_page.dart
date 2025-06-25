import 'package:admin_dashboard/presentations/rewards/data/repositories_imp_sources/reward_repository_imp_source.dart';
import 'package:admin_dashboard/presentations/rewards/domain/use_cases/remove_reward_use_case.dart';
import 'package:admin_dashboard/presentations/rewards/domain/use_cases/update_reward_use_case.dart';
import 'package:admin_dashboard/presentations/rewards/presentation/logic/update_reward/view_update_reward_bloc.dart';
import 'package:admin_dashboard/presentations/rewards/presentation/middlewares/rewards_middleware.dart';
import 'package:admin_dashboard/presentations/rewards/presentation/widgets/view_upate_reward/view_update_reward_item.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ViewUpdateRewardsPage extends StatelessWidget {
  int id;
  final RewardsMiddleware _rewardsMiddleware = RewardsMiddleware().get();
  ViewUpdateRewardsPage({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => ViewUpdateRewardBloc(
            removeRewardUseCase: RemoveRewardUseCase(
              rewardsRepository: RewardRepositoryImpSource(),
            ),
            rewardsMiddleware: _rewardsMiddleware,
            updateRewardUseCase: UpdateRewardUseCase(
              rewardsRepository: RewardRepositoryImpSource(),
            ),
          ),
      child: ViewUpdateRewardItem(id: id),
    );
  }
}
