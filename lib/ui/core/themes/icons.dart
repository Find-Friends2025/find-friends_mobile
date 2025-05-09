import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum DGIcons { check, phone }

extension DGIconsImage on DGIcons {
  SvgPicture get image => toImage();

  SvgPicture toImage({
    double? width,
    double? height,
    Color color = const Color(0xff000000),
  }) {
    return SvgPicture.asset(
      "assets/icons/${name}.svg",
      width: width,
      height: height,
      fit: BoxFit.fitHeight,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
  }
}
