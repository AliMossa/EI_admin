import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:admin_dashboard/util/flexible/flexible_method.dart';
import 'package:admin_dashboard/util/sizes/fonts_sizes.dart';
import 'package:flutter/material.dart';

TextStyle getWelcomStyle(Size size) {
  return TextStyle(
    fontWeight: FontWeight.bold,

    fontSize: size.width * .028,
    color: Colors.black,
    decoration: TextDecoration.none,
  );
}

TextStyle getSlangNameStyle(Size size) {
  return TextStyle(
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none,
    fontSize: size.width * .05,
    foreground:
        Paint()
          ..shader = mainGradient.createShader(Rect.fromLTRB(0, 0, 200, 70)),
  );
}

TextStyle getLinkStyle(Size size) {
  return TextStyle(
    color: linkColor,
    fontWeight: FontWeight.bold,
    fontSize: size.width * .01,
    overflow: TextOverflow.ellipsis,
  );
}

TextStyle getPreLinkStyle(Size size) {
  return TextStyle(
    color: black75,
    fontWeight: FontWeight.bold,
    fontSize: size.width * .01,
    overflow: TextOverflow.ellipsis,
  );
}

final sideBarItemsStyle = TextStyle(
  color: selecteSideBarItem2,
  fontWeight: FontWeight.bold,
  overflow: TextOverflow.ellipsis,
);
final searchBarStyle = TextStyle(
  color: white75,
  fontWeight: FontWeight.bold,
  overflow: TextOverflow.ellipsis,
);
final titleBarStyle = TextStyle(
  color: black75,
  fontWeight: FontWeight.bold,
  fontSize: titleSize,
  overflow: TextOverflow.ellipsis,
);
final titleVariableContainerStyle = TextStyle(
  color: black75,
  fontWeight: FontWeight.bold,
  fontSize: semiBiglSize,
  overflow: TextOverflow.ellipsis,
);
TextStyle getProfileNameStyle(Size size) {
  return TextStyle(
    color: black75,
    fontWeight: FontWeight.bold,
    fontSize: size.width * .02,
    overflow: TextOverflow.ellipsis,
  );
}

TextStyle getProfileSubNameStyle(Size size) {
  return TextStyle(
    color: black30,
    fontWeight: FontWeight.bold,
    fontSize: size.width * .01,
    overflow: TextOverflow.ellipsis,
  );
}

final profileNamedFieldsStyle = TextStyle(
  color: black75,
  fontWeight: FontWeight.bold,

  overflow: TextOverflow.ellipsis,
);
final profileLogginDateStyle = TextStyle(
  color: black30,
  fontWeight: FontWeight.bold,
  fontSize: smallSize,
  overflow: TextOverflow.ellipsis,
);

TextStyle getProfileTitleLogginDateStyle(Size size) {
  return TextStyle(
    color: black75,
    fontWeight: FontWeight.bold,
    fontSize: FlexibleMethod.getCorrectListTileTextWidth(size).width,
    overflow: TextOverflow.ellipsis,
  );
}

TextStyle getPieTextStyle(Size size) {
  return TextStyle(
    color: black75,
    fontWeight: FontWeight.bold,
    fontSize: size.width * .021,
    overflow: TextOverflow.ellipsis,
  );
}

TextStyle getMoneytTextStyle(Size size) {
  return TextStyle(
    color: Colors.green,
    fontWeight: FontWeight.bold,
    fontSize: FlexibleMethod.getCorrectListTileTextWidth(size).width,
    overflow: TextOverflow.ellipsis,
  );
}

final profileTitleLogginDateStyle1 = TextStyle(
  color: black75,
  fontWeight: FontWeight.bold,
  fontSize: normalSize,
  overflow: TextOverflow.visible,
);
final variableTitleStyle = TextStyle(
  color: black50,
  fontWeight: FontWeight.bold,
  fontSize: normalSize,
  overflow: TextOverflow.ellipsis,
);
final variableSymbolTitleStyle = TextStyle(
  color: black50,
  fontWeight: FontWeight.bold,
  fontSize: verysmallSize,
  overflow: TextOverflow.visible,
);

final employeesStatusStyle = TextStyle(
  color: black75,
  inherit: true,
  fontWeight: FontWeight.bold,
  fontSize: verysmallSize,
  overflow: TextOverflow.ellipsis,
);
final requestsStatusStyle = TextStyle(
  color: black75,
  fontWeight: FontWeight.bold,
  fontSize: smallSize,
  overflow: TextOverflow.ellipsis,
);

final activeSwitchIconStyle = TextStyle(
  color: Colors.green,
  fontWeight: FontWeight.bold,
  fontSize: normalSize,
  overflow: TextOverflow.ellipsis,
);
final inActiveSwitchIconStyle = TextStyle(
  color: Colors.red,
  fontWeight: FontWeight.bold,
  fontSize: normalSize,
  overflow: TextOverflow.ellipsis,
);

TextStyle getprofileLogginDateStyle(Size size) {
  return TextStyle(
    color: black30,
    fontWeight: FontWeight.bold,
    fontSize: size.width * .01,
    overflow: TextOverflow.ellipsis,
  );
}

TextStyle getSoldPropertyStyle(Size size) {
  return TextStyle(
    color: black30,
    fontWeight: FontWeight.bold,
    fontSize: verysmallSize,
    overflow: TextOverflow.ellipsis,
  );
}

TextStyle getRewardsGridStyle(Size size) {
  return TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: size.width * .01,
    overflow: TextOverflow.visible,
  );
}
