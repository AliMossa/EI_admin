import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:admin_dashboard/util/font/font_styles.dart';
import 'package:admin_dashboard/util/sizes/fonts_sizes.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AddDepositSearchBarWidget extends StatelessWidget {
  Size size;
  Function onSubmitted;
  Function onValidate;
  Function onChange;

  Function() onPressed;
  AddDepositSearchBarWidget({
    required this.size,
    required this.onSubmitted,
    required this.onValidate,
    required this.onPressed,
    required this.onChange,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * .8,
      height: 50,
      padding: EdgeInsets.only(left: 5, right: 5),
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: linkColor),
        color: textFieldInside,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              enableSuggestions: true,
              style: getProfileTitleLogginDateStyle(size),
              onFieldSubmitted: (_) => onSubmitted,
              validator: (value) => onValidate(value),
              onChanged: (value) => onChange(value),
              autofocus: true,
              cursorHeight: smallSize,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                border: InputBorder.none,
                label: Text('Search', style: getVariableTitleStyle(size)),
              ),
            ),
          ),
          IconButton(onPressed: onPressed, icon: Icon(Icons.search_rounded)),
        ],
      ),
    );
  }
}
