import 'package:admin_dashboard/gen/assets.gen.dart';
import 'package:admin_dashboard/presentations/public/error_widget/snack_bar_widget.dart';
import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/loading_widget.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/notice_cancle_button_widget.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/notice_ok_button_widget.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/show_notice_widget.dart';
import 'package:admin_dashboard/presentations/public/shimmers/grid_shimmer.dart';
import 'package:admin_dashboard/presentations/rewards/domain/entities/reward_entity.dart';
import 'package:admin_dashboard/presentations/rewards/domain/entities/total_reward_entity.dart';
import 'package:admin_dashboard/presentations/rewards/presentation/logic/add_reward/add_reward_bloc.dart';
import 'package:admin_dashboard/presentations/rewards/presentation/logic/get_reawards/rewards_bloc.dart';
import 'package:admin_dashboard/presentations/rewards/presentation/logic/update_reward/view_update_reward_bloc.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

RewardsMiddleware? _rewardsMiddleware;

class RewardsMiddleware {
  RewardsMiddleware get() =>
      _rewardsMiddleware ?? (_rewardsMiddleware = RewardsMiddleware());
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final GlobalKey<AnimatedGridState> _animatedGridGlobalKey =
      GlobalKey<AnimatedGridState>();
  int? _percent;
  int? _times;
  String? _level;
  int? _threshold;
  FocusNode _thresholdFocusNode = FocusNode();
  FocusNode _percentFocusNode = FocusNode();
  FocusNode _timesFocusNode = FocusNode();

  FocusNode getThresholdFocusNode() => _thresholdFocusNode;
  FocusNode getPercentFocusNode() => _percentFocusNode;
  FocusNode getTimesFocusNode() => _timesFocusNode;

  TotalRewardEntity _totalRewardEntity = TotalRewardEntity.init();
  List<RewardEntity> tempRewards = [];

  GlobalKey<AnimatedGridState> getAnimatedGridGlobalKey() =>
      _animatedGridGlobalKey;
  GlobalKey<FormState> getGlobalKey() => _globalKey;
  TotalRewardEntity getTotalRewardEntity() => _totalRewardEntity;
  void setTotalRewardEntity(
    TotalRewardEntity newTotalRewardEntity,
    bool doClean,
  ) async {
    if (doClean) {
      _totalRewardEntity.rewards.clear();
    }
    _totalRewardEntity.nextPage = newTotalRewardEntity.nextPage;
    for (RewardEntity item in newTotalRewardEntity.rewards) {
      await Future.delayed(Duration(milliseconds: 250));
      _totalRewardEntity.rewards.add(item);
      _animatedGridGlobalKey.currentState!.insertItem(
        _totalRewardEntity.rewards.length - 1,
      );
    }
  }

  void removeUserCommonQuestionNotice(
    BuildContext context,
    ViewUpdateRewardBloc bloc,
    ViewUpdateRewardState state,
    int id,
  ) {
    ShowNoticeWidget.showNotice(
      context,
      Text('Remove'),
      Text('Do you want to remove this reward?'),
      state is LoadingRemoveRewardState
          ? LoadingWidget()
          : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NoticeOkButtonWidget(
                title: 'yes',
                function: () {
                  bloc.add(RemoveRewardEvent(id: id));
                  Navigator.of(context).pop();
                },
              ),
              NoticeCancleButtonWidget(),
            ],
          ),
      Icon(Icons.info_outline_rounded, color: cancleColor),
    );
  }

  void setLevel(String level) => _level = level;
  void setTimes(int times) => _times = times;
  void setPercent(int percent) => _percent = percent;
  void setThreshold(int threshold) => _threshold = threshold;

  RewardEntity getRewardEntity() => RewardEntity(
    level: _level,
    amountThreshold: _threshold,
    percentage: _percent,
    times: _times,
    createdAt: '',
    id: -1,
    updatedAt: '',
  );
  void clearUpdatedDataField() {
    _level = null;
    _threshold = null;
    _percent = null;
    _times = null;
  }

  RewardEntity getRewardById(int id) =>
      _totalRewardEntity.rewards.firstWhere((item) => item.id == id);
  void addReward(AddRewardBloc bloc) {
    if (_globalKey.currentState!.validate()) {
      bloc.add(AddNewRewardEvent());
    }
  }

  void updateReward(ViewUpdateRewardBloc bloc, int id) {
    if (_globalKey.currentState!.validate()) {
      bloc.add(UpdateRewardEvent(id: id));
    }
  }

  void showGetRewardsFailedMessage(BuildContext context, RewardsState state) {
    if (state is FailedGetRewardsState) {
      SnackBarWidget().show(context, state.message, Colors.red);
    }
  }

  void showAddRewardFailedMessage(BuildContext context, AddRewardState state) {
    if (state is FailedAddNewRewardState) {
      print(state.message);
      SnackBarWidget().show(context, state.message, Colors.red);
    } else if (state is SuccessAddNewRewardState) {
      context.read<ChangePageBloc>().add(
        MoveToRewardsPageEvent(title: 'Rewards'),
      );
    }
  }

  String? getNameValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    } else if (value.length <= 2) {
      return 'should be more than 2 characters';
    } else {
      return null;
    }
  }

  String? getNumberValidation(String? value) {
    print('is working 2');

    if (value == null || value.isEmpty) {
      return 'Please enter correct value';
    }
    final mobileRegex = RegExp(r'\d$');
    if (!mobileRegex.hasMatch(value)) {
      return 'Enter a value';
    }
    return null;
  }

  Either<Widget, Widget> getCorrectWidget(RewardsState state, Size size) {
    print(state);
    if (state is LoadingGetRewardsState) {
      return right(GridShimmer(size: size));
    } else if (state is SuccessGetRewardsState && tempRewards.isEmpty) {
      return right(SvgPicture.asset(Assets.images.empty));
    } else if (state is FailedGetRewardsState) {
      return right(SvgPicture.asset(Assets.images.error));
    } else {
      return left(const SizedBox());
    }
  }
}
