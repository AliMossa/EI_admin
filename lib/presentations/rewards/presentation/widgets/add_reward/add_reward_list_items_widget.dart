import 'package:admin_dashboard/presentations/public/public_widgets/add_item_button_widget.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/loading_widget.dart';
import 'package:admin_dashboard/presentations/rewards/presentation/logic/add_reward/add_reward_bloc.dart';
import 'package:admin_dashboard/presentations/rewards/presentation/widgets/add_reward/add_reward_text_fied.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddRewardListItemsWidget extends StatelessWidget {
  Size size;
  GlobalKey<FormState> globalKey;
  FocusNode thresholdFocusNode;
  FocusNode percentFocusNode;
  FocusNode timesFocusNode;
  Function(String?) levelValidation;
  Function(String?) percentValidation;
  Function(String) setLevel;
  Function(int) setThreshold;
  Function(int) setPercent;
  Function(int) setTimes;
  Function() onPress;

  AddRewardListItemsWidget({
    required this.timesFocusNode,
    required this.percentFocusNode,
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
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddRewardBloc, AddRewardState>(
      builder: (context, state) {
        return Container(
          width: size.width * .55,
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
                  widthSizeFactor: .3,
                  initialInfo: '',
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
                      initialInfo: '',
                    ),
                    AddRewardTextFied(
                      multiline: 1,
                      autofocus: false,
                      focusNode: percentFocusNode,
                      nextFocusNode: timesFocusNode,
                      onChange: (value) => setPercent(int.parse(value)),
                      size: size,
                      title: 'percentage',
                      widthSizeFactor: .1,
                      initialInfo: '',
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
                      initialInfo: '',

                      validation: (value) => percentValidation(value),
                    ),
                  ],
                ),
                state is LoadingAddNewRewardState
                    ? LoadingWidget()
                    : AddItemButtonWidget(
                      widthFactor: .14,
                      heightFactor: 50,
                      onPress: onPress,
                      title: 'add',
                      size: size,
                    ),
              ],
            ),
          ),
        );
      },
    );
  }
}
