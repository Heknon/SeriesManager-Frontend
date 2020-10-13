import 'package:flutter/cupertino.dart';

extension ProportionalInsets on BuildContext {
  EdgeInsets getProportionalInsets(
      {double left = 0, double right = 0, double top = 0, double bottom = 0}) {
    if (left < 0 || left > 100) throw RangeError.range(left, 0, 100);
    if (right < 0 || right > 100) throw RangeError.range(right, 0, 100);
    if (top < 0 || top > 100) throw RangeError.range(top, 0, 100);
    if (bottom < 0 || bottom > 100) throw RangeError.range(bottom, 0, 100);

    Size size = MediaQuery.of(this).size;
    Size onePercent = new Size(size.width / 100.0, size.height / 100.0);
    return EdgeInsets.only(
        left: onePercent.width * left,
        right: onePercent.width * right,
        top: onePercent.height * top,
        bottom: onePercent.height * bottom);
  }

  EdgeInsets getProportionalInsetsBySize(Size size) {
    return this.getProportionalInsets(
        left: size.width,
        right: size.width,
        top: size.height,
        bottom: size.height);
  }

  Size getPixelCountFromScreenPercentage(
      {double width = 0, double height = 0}) {
    if (width < 0 || width > 100) throw RangeError.range(width, 0, 100);
    if (height < 0 || height > 100) throw RangeError.range(height, 0, 100);

    Size size = MediaQuery.of(this).size;
    Size onePercent = new Size(size.width / 100.0, size.height / 100.0);

    return new Size(onePercent.width * width, onePercent.height * height);
  }
}
