import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:admin_dashboard/presentations/rewards/presentation/logic/get_reawards/rewards_bloc.dart';
import 'package:admin_dashboard/presentations/rewards/presentation/widgets/rewards_grid_view_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RewardsItems extends StatelessWidget {
  const RewardsItems({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RewardsBloc, RewardsState>(
      listener:
          (context, state) => context
              .read<RewardsBloc>()
              .rewardsMiddleware
              .showGetRewardsFailedMessage(context, state),
      child: BlocBuilder<ChangePageBloc, ChangePageState>(
        builder:
            (context, state) => AnimatedOpacity(
              opacity: state is MoveToRewardsPageState ? 1 : 0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInBack,
              child:
                  state is MoveToRewardsPageState
                      ? RewardsGridViewWidget(
                        tempRewards:
                            context
                                .watch<RewardsBloc>()
                                .rewardsMiddleware
                                .tempRewards,
                        totalRewardEntity:
                            context
                                .watch<RewardsBloc>()
                                .rewardsMiddleware
                                .getTotalRewardEntity(),
                        globalKey:
                            context
                                .read<RewardsBloc>()
                                .rewardsMiddleware
                                .getAnimatedGridGlobalKey(),
                      )
                      : SizedBox(),
            ),
      ),
    );
  }
}
