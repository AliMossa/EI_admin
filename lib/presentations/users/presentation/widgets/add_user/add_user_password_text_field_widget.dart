import 'package:admin_dashboard/presentations/users/presentation/logic/cubit/user_password_cubit.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:admin_dashboard/util/font/font_styles.dart';
import 'package:admin_dashboard/util/sizes/fonts_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class AddUserPasswordTextFieldWidget extends StatelessWidget {
  Size size;
  String title;
  double widthSizeFactor;
  FocusNode currentFocusNode;
  FocusNode nextFocusNode;
  Function onChange;
  Function(String?) validate;
  AddUserPasswordTextFieldWidget({
    required this.title,
    required this.widthSizeFactor,
    required this.currentFocusNode,
    required this.nextFocusNode,
    required this.onChange,
    required this.validate,
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserPasswordCubit(),

      child: BlocBuilder<UserPasswordCubit, UserPasswordState>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.end,

            children: [
              Text(title, style: variableTitleStyle),

              Container(
                width: size.width * widthSizeFactor,
                height: 40,
                padding: EdgeInsets.only(left: 5, right: 5, top: 4),
                margin: EdgeInsets.only(left: 20, top: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: linkColor),
                  color: textFieldInside,
                ),
                child: TextFormField(
                  validator: (value) => validate(value),

                  onChanged: (value) => onChange(value),
                  style: getProfileTitleLogginDateStyle(size),
                  onFieldSubmitted:
                      (_) => FocusScope.of(context).requestFocus(nextFocusNode),
                  focusNode: currentFocusNode,
                  autofocus: true,
                  cursorHeight: smallSize,

                  obscureText: state is ShowPasswordState ? false : true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: InkWell(
                      onTap:
                          () =>
                              context.read<UserPasswordCubit>().userPassword(),
                      child:
                          state is ShowPasswordState
                              ? Icon(Icons.visibility, color: textFieldIcons)
                              : Icon(
                                Icons.visibility_off,
                                color: textFieldIcons,
                              ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
