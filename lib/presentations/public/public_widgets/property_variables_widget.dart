import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:admin_dashboard/util/font/font_styles.dart';
import 'package:admin_dashboard/util/sizes/fonts_sizes.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PropertyVariablesWidget extends StatelessWidget {
  String title;
  String value;
  String symbol;
  double width;
  double textWidth;
  double height;
  bool isMovible;
  Size size;
  PropertyVariablesWidget({
    required this.title,
    required this.value,
    required this.width,
    required this.height,
    this.isMovible = false,
    this.symbol = '',
    this.textWidth = 0,
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        height: height,
        width: width,
        constraints: BoxConstraints(maxHeight: height, maxWidth: width),
        margin: EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            const SizedBox(width: 10),
            Text(title, style: variableTitleStyle),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child:
                  isMovible
                      ? Tooltip(
                        preferBelow: false,
                        excludeFromSemantics: true,
                        message: value,
                        enableTapToDismiss: true,
                        decoration: BoxDecoration(
                          color: textFieldIcons,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: smallSize,
                          overflow: TextOverflow.visible,
                        ),
                        child:
                            textWidth == 0
                                ? SizedBox(
                                  width: width * .35,
                                  height: height * .8,
                                  child: ListView(
                                    physics: NeverScrollableScrollPhysics(),
                                    children: [
                                      Text(
                                        value,
                                        style: getProfileTitleLogginDateStyle(
                                          size,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                                : SizedBox(
                                  width: textWidth,
                                  height: height * .8,

                                  child: ListView(
                                    physics: NeverScrollableScrollPhysics(),
                                    children: [
                                      Text(
                                        value,
                                        style: getProfileTitleLogginDateStyle(
                                          size,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                      )
                      : Text(
                        value,
                        style: getProfileTitleLogginDateStyle(size),
                      ),
            ),
            Text(symbol, style: variableSymbolTitleStyle),
          ],
        ),
      ),
    );
  }
}
