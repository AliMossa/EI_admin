import 'package:admin_dashboard/gen/assets.gen.dart';
import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/add_member_button_widget.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/loading_widget.dart';
import 'package:admin_dashboard/presentations/public/shimmers/grid_shimmer.dart';
import 'package:admin_dashboard/presentations/rewards/domain/entities/reward_entity.dart';
import 'package:admin_dashboard/presentations/rewards/domain/entities/total_reward_entity.dart';
import 'package:admin_dashboard/presentations/rewards/presentation/logic/get_reawards/rewards_bloc.dart';
import 'package:admin_dashboard/presentations/rewards/presentation/widgets/reward_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class RewardsGridViewWidget extends StatelessWidget {
  GlobalKey<AnimatedGridState> globalKey;
  TotalRewardEntity totalRewardEntity;
  List<RewardEntity> tempRewards;
  RewardsGridViewWidget({
    required this.tempRewards,
    required this.totalRewardEntity,
    required this.globalKey,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final moreInfo = MediaQuery.sizeOf(context);
    return BlocBuilder<RewardsBloc, RewardsState>(
      builder: (context, state) {
        return context
            .watch<RewardsBloc>()
            .rewardsMiddleware
            .getCorrectWidget(state, moreInfo)
            .fold(
              (_) => Stack(
                children: [
                  SizedBox(
                    height: moreInfo.height * .85,
                    width: moreInfo.width * .8,
                    child: NotificationListener(
                      onNotification: (ScrollNotification notification) {
                        if (notification.metrics.pixels ==
                            notification.metrics.maxScrollExtent) {}
                        return false;
                      },
                      child: AnimatedGrid(
                        key: globalKey,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 7,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                        initialItemCount: totalRewardEntity.rewards.length,
                        itemBuilder:
                            (context, index, animation) => FadeTransition(
                              opacity: animation.drive(Tween(begin: 0, end: 1)),
                              child: RewardItemWidget(
                                level: totalRewardEntity.rewards[index].level!,
                                size: moreInfo,
                                function:
                                    () => context.read<ChangePageBloc>().add(
                                      MoveToViewUpdateRewardPageEvent(
                                        id: totalRewardEntity.rewards[index].id,
                                        title: 'Rewards',
                                      ),
                                    ),
                              ),
                            ),
                      ),
                    ),
                  ),

                  AddMemberButtonWidget(
                    onPress:
                        () => context.read<ChangePageBloc>().add(
                          MoveToAddRewardPageEvent(title: 'Add Reward'),
                        ),
                  ),
                ],
              ),
              (widget) => widget,
            );
      },
    );
  }
}
