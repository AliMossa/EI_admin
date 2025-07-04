import 'package:admin_dashboard/presentations/requests/presentaiton/logic/cubit/desicion_cubit.dart';
import 'package:admin_dashboard/presentations/requests/presentaiton/models/desicion_model.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:admin_dashboard/util/font/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class DesicionDropDownWidget extends StatelessWidget {
  int currntValue;
  final onPressed;
  Size size;
  Widget underline;
  List<DesicionModel> kinds;
  DesicionDropDownWidget({
    this.underline = const SizedBox(),
    required this.kinds,
    required this.currntValue,
    required this.size,
    required this.onPressed,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
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
                      item.name,
                      style: getProfileTitleLogginDateStyle(size),
                    ),
                  ),
                )
                .toList(),
        onChanged: onPressed,
      ),
    );
  }
}
