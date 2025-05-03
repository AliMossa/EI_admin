import 'package:admin_dashboard/presentations/profile/presentation/logic/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UpdateProfileFiledWidget extends StatelessWidget {
  Widget leading;
  Widget trailing;
  String content;
  final onPress;
  Size size;
  UpdateProfileFiledWidget({
    required this.content,
    required this.leading,
    required this.trailing,
    required this.onPress,
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: leading,
        ),
        SizedBox(
          width: size.width * .2,

          child: TextFormField(
            initialValue: content,

            autovalidateMode: AutovalidateMode.onUserInteraction,

            decoration: InputDecoration(border: InputBorder.none),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: IconButton(onPressed: onPress, icon: trailing),
        ),
      ],
    );
  }
}
