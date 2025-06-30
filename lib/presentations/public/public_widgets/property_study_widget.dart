import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:admin_dashboard/util/font/font_styles.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class PropertyStudyWidget extends StatelessWidget {
  String title;
  double height;
  double width;
  List<Widget> firstItemsWidget;
  List<Widget> secondItemsWidget;
  List<Widget> thirdItemsWidget;
  List<Widget> fourthItemsWidget;

  PropertyStudyWidget({
    required this.title,
    required this.height,
    this.width = 0,
    required this.firstItemsWidget,
    this.secondItemsWidget = const [SizedBox()],
    this.thirdItemsWidget = const [SizedBox()],
    this.fourthItemsWidget = const [SizedBox()],

    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return width == 0
        ? Expanded(
          child: Container(
            height: height,
            padding: EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 10),
            decoration: BoxDecoration(
              color: background,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: linkColor),
            ),
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5, bottom: 10),
                  child: Text(title, style: titleVariableContainerStyle),
                ),

                SizedBox(
                  // width: width,
                  height: height,
                  child: ListView(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: firstItemsWidget,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,

                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: secondItemsWidget,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,

                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: thirdItemsWidget,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,

                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: fourthItemsWidget,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
        : Container(
          height: height,
          width: width,
          padding: EdgeInsets.only(top: 3, left: 3, right: 3),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: firstItemsWidget,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,

                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: secondItemsWidget,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,

                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: thirdItemsWidget,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,

                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: fourthItemsWidget,
                  ),
                ],
              ),
            ],
          ),
        );
  }
}
