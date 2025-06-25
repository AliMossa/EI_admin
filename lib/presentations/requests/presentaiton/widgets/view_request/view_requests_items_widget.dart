import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:admin_dashboard/util/font/font_styles.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class ViewRequestsItemsWidget extends StatelessWidget {
  String title;
  double height;
  double width;
  List<Widget> leftItemsWidget;
  List<Widget> rigthItemsWidget;

  ViewRequestsItemsWidget({
    required this.title,
    required this.height,
    this.width = 0,
    required this.leftItemsWidget,
    this.rigthItemsWidget = const [SizedBox()],
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return width == 0
        ? Container(
          height: height,
          padding: EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 10),
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: linkColor),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5, bottom: 10),
                child: Text(title, style: titleVariableContainerStyle),
              ),

              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: leftItemsWidget,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: rigthItemsWidget,
                  ),
                ],
              ),
            ],
          ),
        )
        : Container(
          height: height,
          width: width,
          padding: EdgeInsets.only(top: 5, left: 10, right: 10),
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: linkColor),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5, bottom: 10),
                child: Text(title, style: titleVariableContainerStyle),
              ),

              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: leftItemsWidget,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: rigthItemsWidget,
                  ),
                ],
              ),
            ],
          ),
        );
  }
}
