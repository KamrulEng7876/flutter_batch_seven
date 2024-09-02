enum DeviceType { mobaile, tablet, desktop }

class ScreenUtils {
  static const double mobaileMaxSize = 640;
  static const double tabletMaxSize = 1000;
  static const double desktopMinSize = 1000;

  static DeviceType getDeviceType(double width) {
    if (width < ScreenUtils.mobaileMaxSize) {
      return DeviceType.mobaile;
    } else if (width >= ScreenUtils.mobaileMaxSize &&
        width < ScreenUtils.tabletMaxSize) {
      return DeviceType.tablet;
    }
    return DeviceType.desktop;
  }
}
