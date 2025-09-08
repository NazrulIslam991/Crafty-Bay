import 'package:crafty_bay/app/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, this.width});

  final double? width;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(AssetPaths.logo, width: width ?? 120);
  }
}
