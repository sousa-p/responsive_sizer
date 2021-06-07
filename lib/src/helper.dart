part of responsive_sizer;

/// Type of Device
///
/// This can be android, ios, fuschia, web, or desktop (windows, mac, linux)
enum DeviceType { android, ios, fuschia, web, windows, mac, linux }

/// Type of Screen
///
/// This can either be mobile or tablet
enum ScreenType { mobile, tablet }

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

  /// Devices' Pixel Ratio
  static double get pixelRatio {
    return WidgetsBinding.instance?.window.devicePixelRatio ?? 1;
  }

  /// Device's Pixel Density
  static double get pixelDensity {
    return pixelRatio * (width > height ? width / height : height / width);
  }

  /// Sets the Screen's size and Device's `Orientation`,
  /// `BoxConstraints`, `Height`, and `Width`
  static void setScreenSize(
      BoxConstraints constraints, Orientation currentOrientation) {
    // Sets boxconstraints and orientation
    boxConstraints = constraints;
    orientation = currentOrientation;

    // Sets screen width and height
    width = boxConstraints.maxWidth;
    height = boxConstraints.maxHeight;

    // Sets DeviceType
    if (Platform.isAndroid) {
      deviceType = DeviceType.android;
    } else if (Platform.isIOS) {
      deviceType = DeviceType.ios;
    } else if (kIsWeb) {
      deviceType = DeviceType.web;
    } else if (Platform.isWindows) {
      deviceType = DeviceType.windows;
    } else if (Platform.isMacOS) {
      deviceType = DeviceType.mac;
    } else if (Platform.isLinux) {
      deviceType = DeviceType.linux;
    } else if (Platform.isFuchsia) {
      deviceType = DeviceType.fuschia;
    }

    // Sets ScreenType
    if ((orientation == Orientation.portrait && width < 600) ||
        (orientation == Orientation.landscape && height < 600)) {
      screenType = ScreenType.mobile;
    } else {
      screenType = ScreenType.tablet;
    }
  }
}

class Adaptive {
  /// Calculates the height depending on the device's screen size
  ///
  /// Eg: 20.h -> will take 20% of the screen's height
  static double h(num height) => height.h;

  /// Calculates the width depending on the device's screen size
  ///
  /// Eg: 20.h -> will take 20% of the screen's width
  static double w(num width) => width.w;

  /// Calculates the sp (Scalable Pixel) depending on the device's screen size
  static double sp(num scalablePixel) => scalablePixel.sp;
}
