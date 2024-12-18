import 'package:responsive_sizer/src/extensions/ui_not_rebuildable_units_extension.dart';

class Adaptive {
  /// Calculates the height depending on the device's screen size
  ///
  /// Eg: 20.h -> will take 20% of the screen's height
  static double h(num height) => height.h;

  /// Calculates the width depending on the device's screen size
  ///
  /// Eg: 20.w -> will take 20% of the screen's width
  static double w(num width) => width.w;

  /// Calculates the height depending on the device's screen size
  ///
  /// Eg: 20.sh -> will take 20% of the safe area height
  static double sh(num height) => height.sh;

  /// Calculates the width depending on the device's screen size
  ///
  /// Eg: 20.sw -> will take 20% of the safe area width
  static double sw(num width) => width.sw;

  /// Calculates the sp (Scalable Pixel) depending on the device's pixel
  /// density and aspect ratio
  static double sp(num scalablePixel) => scalablePixel.sp;

  /// Calculates the material dp (Pixel Density)
  /// (https://material.io/design/layout/pixel-density.html#pixel-density-on-android))
  static double dp(num densityPixel) => densityPixel.dp;

  /// The respective value in centimeters
  static double cm(num centimeters) => centimeters.cm;

  /// The respective value in millimeters
  static double mm(num millimeters) => millimeters.mm;

  /// The respective value in quarter-millimeters
  static double Q(num quarterMillimeters) => quarterMillimeters.Q;

  /// The respective value in inches
  static double inches(num inches) => inches.inches;

  /// The respective value in picas (1/6th of 1 inch)
  static double pc(num picas) => picas.pc;

  /// The respective value in points (1/72th of 1 inch)
  static double pt(num point) => point.pt;

  /// The respective value in pixels (default)
  static double px(num pixels) => pixels.px;
}
