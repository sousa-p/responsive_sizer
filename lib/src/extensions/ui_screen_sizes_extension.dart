import 'package:flutter/material.dart';

extension UIScreenSizesExtension on BuildContext {
  /// Retrieves the width of the screen from the MediaQuery.
  double get w => MediaQuery.sizeOf(this).width;

  /// Retrieves the height of the screen from the MediaQuery.
  double get h => MediaQuery.sizeOf(this).height;

  /// Retrieves the device's pixel ratio, which represents the number of physical pixels per logical pixel.
  double get pixelRatio => MediaQuery.devicePixelRatioOf(this);

  /// Retrieves the padding values from the MediaQuery, which represent areas of the screen that are obstructed by system UI (e.g., notches, status bars, or system navigation bars).
  EdgeInsets get vp => MediaQuery.paddingOf(this);

  /// Calculates the aspect ratio of the screen (width divided by height).
  double get aspectRatio => w / h;
}
