import 'package:admin_dashboard/presentations/public/error_widget/snack_bar_widget.dart';
import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:admin_dashboard/presentations/rewards/presentation/logic/update_reward/view_update_reward_bloc.dart';
import 'package:admin_dashboard/presentations/rewards/presentation/widgets/view_upate_reward/view_update_reward_item_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewUpdateRewardItem extends StatelessWidget {
  int id;
  ViewUpdateRewardItem({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    final moreInfo = MediaQuery.sizeOf(context);
    return BlocConsumer<ViewUpdateRewardBloc, ViewUpdateRewardState>(
      listener: (context, state) {
        if (state is SuccessUpdateRewardState ||
            state is SuccessRemoveRewardState) {
          context.read<ChangePageBloc>().add(
            MoveToRewardsPageEvent(title: 'Rewards'),
          );
        } else if (state is FailedUpdateRewardState) {
          SnackBarWidget().show(
            context,
            'could not update reawrd data !!',
            Colors.red,
          );
        } else if (state is FailedRemoveRewardState) {
          SnackBarWidget().show(
            context,
            'could not remove this reward !!',
            Colors.red,
          );
        }
      },
      builder:
          (context, viewUpdateState) =>
              BlocBuilder<ChangePageBloc, ChangePageState>(
                builder:
                    (context, state) => AnimatedOpacity(
                      opacity: state is MoveToViewUpdateRewardPageState ? 1 : 0,
                      duration: const Duration(microseconds: 500),
                      curve: Curves.easeInBack,
                      child:
                          state is MoveToViewUpdateRewardPageState
                              ? ViewUpdateRewardItemList(
                                rewardEntity: context
                                    .read<ViewUpdateRewardBloc>()
                                    .rewardsMiddleware
                                    .getRewardById(id),
                                globalKey:
                                    context
                                        .read<ViewUpdateRewardBloc>()
                                        .rewardsMiddleware
                                        .getGlobalKey(),
                                levelValidation:
                                    (value) => context
                                        .read<ViewUpdateRewardBloc>()
                                        .rewardsMiddleware
                                        .getNameValidation(value),
                                onPress:
                                    () => context
                                        .read<ViewUpdateRewardBloc>()
                                        .rewardsMiddleware
                                        .updateReward(
                                          context.read<ViewUpdateRewardBloc>(),
                                          id,
                                        ),
                                percentFocusNode:
                                    context
                                        .read<ViewUpdateRewardBloc>()
                                        .rewardsMiddleware
                                        .getPercentFocusNode(),
                                thresholdFocusNode:
                                    context
                                        .read<ViewUpdateRewardBloc>()
                                        .rewardsMiddleware
                                        .getThresholdFocusNode(),
                                timesFocusNode:
                                    context
                                        .read<ViewUpdateRewardBloc>()
                                        .rewardsMiddleware
                                        .getTimesFocusNode(),
                                percentValidation:
                                    (value) => context
                                        .read<ViewUpdateRewardBloc>()
                                        .rewardsMiddleware
                                        .getNumberValidation(value),
                                setLevel:
                                    (level) => context
                                        .read<ViewUpdateRewardBloc>()
                                        .rewardsMiddleware
                                        .setLevel(level),
                                setPercent:
                                    (percent) => context
                                        .read<ViewUpdateRewardBloc>()
                                        .rewardsMiddleware
                                        .setPercent(percent),
                                setThreshold:
                                    (threshold) => context
                                        .read<ViewUpdateRewardBloc>()
                                        .rewardsMiddleware
                                        .setThreshold(threshold),
                                setTimes:
                                    (percent) => context
                                        .read<ViewUpdateRewardBloc>()
                                        .rewardsMiddleware
                                        .setTimes(percent),
                                remove:
                                    () => context
                                        .read<ViewUpdateRewardBloc>()
                                        .rewardsMiddleware
                                        .removeUserCommonQuestionNotice(
                                          context,
                                          context.read<ViewUpdateRewardBloc>(),
                                          viewUpdateState,
                                          id,
                                        ),
                                size: moreInfo,
                              )
                              : SizedBox(),
                    ),
              ),
    );
  }
}
