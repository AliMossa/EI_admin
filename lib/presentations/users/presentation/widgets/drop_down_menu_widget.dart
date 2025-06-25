import 'package:admin_dashboard/presentations/users/presentation/logic/cubit/type/users_type_cubit.dart';
import 'package:admin_dashboard/presentations/users/presentation/models/user_state_model.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:admin_dashboard/util/font/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class DropDownMenuWidget extends StatelessWidget {
  int currntValue;
  final onPressed;
  Widget underline;
  List<UserStateModel> kinds;
  Size size;
  DropDownMenuWidget({
    this.underline = const SizedBox(),
    required this.kinds,
    required this.currntValue,
    required this.onPressed,
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersTypeCubit, UsersTypeState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: DropdownButton(
            borderRadius: BorderRadius.circular(20),
            underline: underline,
            iconEnabledColor: selecteSideBarItem2,
            enableFeedback: true,
            value: currntValue,
            items:
                kinds
                    .map(
                      (item) => DropdownMenuItem(
                        value: item.id,
                        child: Text(
                          item.state,
                          style: getProfileTitleLogginDateStyle(size),
                        ),
                      ),
                    )
                    .toList(),
            onChanged: (value) => onPressed(value),
          ),
        );
      },
    );
  }
}
