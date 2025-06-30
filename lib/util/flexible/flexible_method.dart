import 'dart:ui';

class FlexibleMethod {
  static Size getCorrectProfileWidth(Size size) {
    if (size.width <= 500 && size.width < 600) {
      return Size(size.width * .64, size.height * .28);
    } else if (size.width > 600 && size.width <= 700) {
      return Size(size.width * .6, size.height * .3);
    } else if (size.width > 700 && size.width <= 800) {
      return Size(size.width * .58, size.height * .34);
    } else if (size.width > 800 && size.width <= 900) {
      return Size(size.width * .54, size.height * .38);
    } else if (size.width > 900 && size.width <= 1000) {
      return Size(size.width * .5, size.height * .4);
    } else if (size.width > 1000 && size.width <= 1100) {
      return Size(size.width * .48, size.height * .44);
    } else if (size.width > 1100 && size.width <= 1200) {
      return Size(size.width * .44, size.height * .48);
    } else {
      return Size(size.width * .4, size.height * .5);
    }
  }

  static Size getCorrectListTileIconWidth(Size size) =>
      size.width <= 700
          ? Size(size.width * .12, 20)
          : Size(size.width * .07, 50);

  static Size getCorrectListTileTextWidth(Size size) {
    if (size.width <= 500 && size.width < 600) {
      return Size(size.width * .021, 20);
    } else if (size.width > 600 && size.width <= 700) {
      return Size(size.width * .02, 20);
    } else if (size.width > 700 && size.width <= 800) {
      return Size(size.width * .019, 20);
    } else if (size.width > 800 && size.width <= 900) {
      return Size(size.width * .018, 20);
    } else if (size.width > 900 && size.width <= 1000) {
      return Size(size.width * .017, 20);
    } else if (size.width > 1000 && size.width <= 1100) {
      return Size(size.width * .016, 20);
    } else if (size.width > 1100 && size.width <= 1200) {
      return Size(size.width * .015, 20);
    } else {
      return Size(size.width * .01, 20);
    }
  }

  static getHomePageFlexible(Size size) {
    if (size.width <= 1200) {
      return true;
    }
    return false;
  }

  static getHomePageItemsFlexible(Size size) {
    if (size.width <= 500) {
      return true;
    }
    return false;
  }
}
