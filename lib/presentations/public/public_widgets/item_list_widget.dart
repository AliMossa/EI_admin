import 'package:admin_dashboard/presentations/public/public_widgets/sold_tag_widget.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/view_member_info_button_widget.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:admin_dashboard/util/flexible/flexible_method.dart';
import 'package:admin_dashboard/util/font/font_styles.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ItemListWidget extends StatelessWidget {
  Size size;
  String name;
  List<Widget> status;
  Widget trailing;
  String date;
  Function() onPressed;
  bool? isSold;
  ItemListWidget({
    this.trailing = const SizedBox(),
    required this.onPressed,
    required this.size,
    required this.name,
    required this.status,
    this.date = '',
    this.isSold = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: linkColor),
        gradient: mainGradient2,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          isSold!
              ? Positioned(
                top: -20,
                right: -65,
                child: SoldTagWidget(size: size),
              )
              : const SizedBox(),
          ListTile(
            title: Text(name, style: getProfileTitleLogginDateStyle(size)),
            trailing: ViewMemberInfoButtonWidget(onPressed: onPressed),
            subtitle: SizedBox(
              child:
                  !FlexibleMethod.getListItemsFlexible(size)
                      ? Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: status,
                      )
                      : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: status,
                      ),
            ),
          ),
        ],
      ),
    );
  }
}
