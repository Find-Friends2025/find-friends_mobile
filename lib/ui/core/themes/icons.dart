import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum DGIcons {
  check,
  phone,
  arrowLeft,
  polygon,
  magnifyingglass,
  like,
  chat,
  person,
  attentionTriangle,
  arrowRight,
  pencil,
  plus,
  sendFill,
  calendar
}

extension DGIconsImage on DGIcons {
  Container get image => toImage();

  Container toImage({
    double? width,
    double? height,
    Color color = const Color(0xff000000),
  }) {
    return Container(
      alignment: Alignment.center,
      child: SvgPicture.asset(
        "assets/icons/${name}.svg",
        width: width,
        height: height,
        fit: BoxFit.fitHeight,
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      ),
    );
  }
}
