import 'package:flutter/material.dart';
import 'package:flutter_batch_seven/presentation/utils/screen_utils.dart';

class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({
    super.key,
    required this.mobaile,
    required this.desktop,
    this.tablet,
  });

  final Widget mobaile;

  final Widget? tablet;
  final Widget desktop;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final DeviceType deviceType = ScreenUtils.getDeviceType(size.width);

    if (deviceType == DeviceType.mobaile) {
      return mobaile;
    } else if (deviceType == DeviceType.tablet) {
      return tablet ?? mobaile;
    }
    return desktop;
  }
}
