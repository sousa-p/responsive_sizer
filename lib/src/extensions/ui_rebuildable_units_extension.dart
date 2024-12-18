import 'dart:math';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/src/extensions/ui_screen_sizes_extension.dart';
import 'package:responsive_sizer/src/helpers/device.dart';

extension UIRebuildableUnits on num {
  // *****************  Relative length units *****************************************
  // https://developer.mozilla.org/en-US/docs/Learn/CSS/Building_blocks/Values_and_units

  /// Calculates a percentage of the smaller dimension of the viewport (width or height).
  ///
  /// Example: `20.cvmin(context)` takes 20% of the smaller dimension (either height or width) of the viewport.
  double cvmin(BuildContext context) => this * min(context.h, context.w) / 100;

  /// Calculates a percentage of the larger dimension of the viewport (width or height).
  ///
  /// Example: `20.cvmax(context)` takes 20% of the larger dimension (either height or width) of the viewport.
  double cvmax(BuildContext context) => this * max(context.h, context.w) / 100;

  /// Calculates the height depending on the device's screen size
  ///
  /// Eg: 20.h -> will take 20% of the screen's height
  double ch(BuildContext context) => this * context.h / 100;

  /// Calculates the width depending on the device's screen size
  ///
  /// Eg: 20.w -> will take 20% of the screen's width
  double cw(BuildContext context) => this * context.w / 100;

  /// Calculates the height as a percentage of the available device height,
  /// excluding areas occupied by the `SafeArea` (like notches or system bars).
  ///
  /// Example: `20.csh(context)` takes 20% of the height excluding `SafeArea` padding (top and bottom).
  double csh(BuildContext context) =>
      this * (context.h - (context.vp.top + context.vp.bottom)) / 100;

  /// Calculates the width as a percentage of the available device width,
  /// excluding areas occupied by the `SafeArea` (like system-side paddings).
  ///
  /// Example: `20.csw(context)` takes 20% of the width excluding `SafeArea` padding (left and right).
  double csw(BuildContext context) =>
      this * (context.w - (context.vp.left + context.vp.right)) / 100;

  /// Calculates a scalable pixel (sp) size based on the device's pixel density
  /// and aspect ratio, providing a responsive size for text or other scalable elements.
  ///
  /// Example: `16.csp(context)` provides a scalable size for fonts or other UI elements.
  double csp(BuildContext context) =>
      this *
      (((context.h + context.w) + (context.pixelRatio * context.aspectRatio)) /
          2.08) /
      100;

  /// Calculates the density-independent pixel (dp) value based on the device's
  /// screen width and pixel ratio, following Material Design guidelines.
  ///
  /// Example: `10.cdp(context)` calculates a density-independent size for UI elements.
  double cdp(BuildContext context) =>
      this * (context.w * 160) / Device.pixelRatio;

  /// Alternative scalable pixel calculation, adjusts for specific use cases
  /// where a constant factor of 240 is used with the device's aspect ratio.
  ///
  /// Example: `16.cspa(context)` provides an adjusted scalable size for fonts or UI elements.
  double cspa(BuildContext context) =>
      this *
      (((context.h + context.w) + (240 * context.aspectRatio)) / 2.08) /
      100;
}
