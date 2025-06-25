import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:admin_dashboard/presentations/rewards/presentation/logic/add_reward/add_reward_bloc.dart';
import 'package:admin_dashboard/presentations/rewards/presentation/widgets/add_reward/add_reward_list_items_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddRewardItem extends StatelessWidget {
  const AddRewardItem({super.key});

  @override
  Widget build(BuildContext context) {
    final moreInfo = MediaQuery.sizeOf(context);
    return BlocListener<AddRewardBloc, AddRewardState>(
      listener:
          (context, state) => context
              .read<AddRewardBloc>()
              .rewardsMiddleware
              .showAddRewardFailedMessage(context, state),
      child: BlocBuilder<ChangePageBloc, ChangePageState>(
        builder: (context, state) {
          return AnimatedOpacity(
            opacity: state is MoveToAddRewardPageState ? 1 : 0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInBack,
            child:
                state is MoveToAddRewardPageState
                    ? AddRewardListItemsWidget(
                      globalKey:
                          context
                              .read<AddRewardBloc>()
                              .rewardsMiddleware
                              .getGlobalKey(),
                      onPress:
                          () => context
                              .read<AddRewardBloc>()
                              .rewardsMiddleware
                              .addReward(context.read<AddRewardBloc>()),
                      setLevel:
                          context
                              .read<AddRewardBloc>()
                              .rewardsMiddleware
                              .setLevel,
                      setTimes:
                          context
                              .read<AddRewardBloc>()
                              .rewardsMiddleware
                              .setTimes,

                      setPercent:
                          context
                              .read<AddRewardBloc>()
                              .rewardsMiddleware
                              .setPercent,
                      setThreshold:
                          context
                              .read<AddRewardBloc>()
                              .rewardsMiddleware
                              .setThreshold,
                      size: moreInfo,
                      percentFocusNode:
                          context
                              .read<AddRewardBloc>()
                              .rewardsMiddleware
                              .getPercentFocusNode(),
                      thresholdFocusNode:
                          context
                              .read<AddRewardBloc>()
                              .rewardsMiddleware
                              .getThresholdFocusNode(),
                      timesFocusNode:
                          context
                              .read<AddRewardBloc>()
                              .rewardsMiddleware
                              .getTimesFocusNode(),
                      levelValidation:
                          (value) => context
                              .read<AddRewardBloc>()
                              .rewardsMiddleware
                              .getNameValidation(value),
                      percentValidation:
                          (value) => context
                              .read<AddRewardBloc>()
                              .rewardsMiddleware
                              .getNumberValidation(value),
                    )
                    : SizedBox(),
          );
        },
      ),
    );
  }
}
