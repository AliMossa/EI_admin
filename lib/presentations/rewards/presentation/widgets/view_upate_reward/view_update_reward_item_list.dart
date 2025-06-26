import 'package:admin_dashboard/presentations/employees/presentation/logic/bloc/view_employees/employees_bloc.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/add_item_button_widget.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/loading_widget.dart';
import 'package:admin_dashboard/presentations/rewards/domain/entities/reward_entity.dart';
import 'package:admin_dashboard/presentations/rewards/presentation/logic/update_reward/view_update_reward_bloc.dart';
import 'package:admin_dashboard/presentations/rewards/presentation/widgets/add_reward/add_reward_text_fied.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ViewUpdateRewardItemList extends StatelessWidget {
  RewardEntity rewardEntity;
  Size size;
  GlobalKey<FormState> globalKey;
  FocusNode thresholdFocusNode;
  FocusNode percentFocusNode;
  FocusNode timesFocusNode;
  Function levelValidation;
  Function percentValidation;
  Function(String) setLevel;
  Function(int) setThreshold;
  Function(int) setPercent;
  Function(int) setTimes;
  Function() onPress;
  Function() remove;

  ViewUpdateRewardItemList({
    required this.rewardEntity,
    required this.percentFocusNode,
    required this.timesFocusNode,
    required this.thresholdFocusNode,
    required this.globalKey,
    required this.size,
    required this.setLevel,
    required this.setTimes,
    required this.setPercent,
    required this.setThreshold,
    required this.levelValidation,
    required this.percentValidation,
    required this.onPress,
    required this.remove,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewUpdateRewardBloc, ViewUpdateRewardState>(
      builder: (context, state) {
        return Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              width: size.width * .6,
              decoration: BoxDecoration(
                color: background,
                border: Border.all(color: textFieldBorder),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Form(
                key: globalKey,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    AddRewardTextFied(
                      multiline: 1,
                      autofocus: true,
                      focusNode: FocusNode(),
                      nextFocusNode: thresholdFocusNode,
                      onChange: (value) => setLevel(value),
                      validation: (value) => levelValidation(value),
                      size: size,
                      title: 'level',
                      widthSizeFactor: .28,
                      initialInfo: rewardEntity.level!,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AddRewardTextFied(
                          multiline: 1,
                          autofocus: false,
                          focusNode: thresholdFocusNode,
                          nextFocusNode: percentFocusNode,
                          onChange: (value) => setThreshold(int.parse(value)),
                          size: size,
                          title: 'amountThreshold',
                          widthSizeFactor: .3,
                          validation: (value) => percentValidation(value),
                          suffix: Icon(
                            Icons.attach_money_rounded,
                            color: textFieldBorder,
                          ),

                          initialInfo: rewardEntity.amountThreshold.toString(),
                        ),
                        AddRewardTextFied(
                          multiline: 1,
                          autofocus: false,
                          focusNode: percentFocusNode,
                          nextFocusNode: FocusNode(),
                          onChange: (value) => setPercent(int.parse(value)),
                          size: size,
                          title: 'percentage',
                          widthSizeFactor: .1,
                          initialInfo: rewardEntity.percentage.toString(),
                          suffix: Icon(Icons.percent, color: textFieldBorder),
                          validation: (value) => percentValidation(value),
                        ),

                        AddRewardTextFied(
                          multiline: 1,
                          autofocus: false,
                          focusNode: timesFocusNode,
                          nextFocusNode: FocusNode(),
                          onChange: (value) => setTimes(int.parse(value)),
                          size: size,
                          title: 'times',
                          widthSizeFactor: .1,
                          initialInfo: rewardEntity.times.toString(),
                          validation: (value) => percentValidation(value),
                        ),
                      ],
                    ),
                    state is LoadingGetEmployeesState
                        ? LoadingWidget()
                        : AddItemButtonWidget(
                          widthFactor: .14,
                          heightFactor: 50,
                          onPress: onPress,
                          title: 'update',
                          size: size,
                        ),
                  ],
                ),
              ),
            ),

            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                onPressed: remove,
                icon: Icon(Icons.delete, color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}
