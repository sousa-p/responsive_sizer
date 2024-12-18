import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/src/helpers/types/device_type.dart';
import 'package:responsive_sizer/src/helpers/types/screen_type.dart';

class Device {
  /// Device's BoxConstraints
  static late BoxConstraints boxConstraints;

  /// Device's Orientation
  static late Orientation orientation;

  /// Type of Device
  static late DeviceType deviceType;

  /// Type of Screen
  static late ScreenType screenType;

  /// Device's Height
  static late double height;

  /// Device's Width
  static late double width;

  /// Device's Remaining Height after applying `SafeArea`
  static late double safeHeight;

  /// Device's Remaining Width after applying `SafeArea`
  static late double safeWidth;

  /// Device's Aspect Ratio
  static late double aspectRatio;

  /// Device's Pixel Ratio
  static late double pixelRatio;

  /// Sets the Screen's size and Device's `Orientation`,
  /// `BoxConstraints`, `Height`, and `Width`
  static void setScreenSize(
    BuildContext context,
    BoxConstraints constraints,
    Orientation currentOrientation,
    double maxMobileWidth, [
    double? maxTabletWidth,
  ]) {
    // Sets boxconstraints and orientation
    boxConstraints = constraints;
    orientation = currentOrientation;

    // Sets screen width and height
    width = boxConstraints.maxWidth;
    height = boxConstraints.maxHeight;

    // Calculates remaining available size after `SafeArea`
    final viewPadding = MediaQuery.of(context).viewPadding;
    safeWidth = width - (viewPadding.left + viewPadding.right);
    safeHeight = height - (viewPadding.top + viewPadding.bottom);

    // Sets aspect and pixel ratio
    aspectRatio = constraints.constrainDimensions(width, height).aspectRatio;
    pixelRatio = MediaQuery.of(context).devicePixelRatio;

    // Sets DeviceType
    if (kIsWeb) {
      deviceType = DeviceType.web;
    } else {
      switch (defaultTargetPlatform) {
        case TargetPlatform.android:
          deviceType = DeviceType.android;
          break;
        case TargetPlatform.iOS:
          deviceType = DeviceType.ios;
          break;
        case TargetPlatform.windows:
          deviceType = DeviceType.windows;
          break;
        case TargetPlatform.macOS:
          deviceType = DeviceType.mac;
          break;
        case TargetPlatform.linux:
          deviceType = DeviceType.linux;
          break;
        case TargetPlatform.fuchsia:
          deviceType = DeviceType.fuchsia;
          break;
      }
    }

    // Sets ScreenType
    if ((orientation == Orientation.portrait && width <= maxMobileWidth) ||
        (orientation == Orientation.landscape && height <= maxMobileWidth)) {
      screenType = ScreenType.mobile;
    } else if (maxTabletWidth == null ||
        (orientation == Orientation.portrait && width <= maxTabletWidth) ||
        (orientation == Orientation.landscape && height <= maxTabletWidth)) {
      screenType = ScreenType.tablet;
    } else {
      screenType = ScreenType.desktop;
    }
  }
}

