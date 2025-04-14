import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum DGIcons {
  check;
}

extension DGIconsImage on DGIcons {
  Widget get image => toImage();


  Widget toImage({double? width, double? height, Color color = const Color(0xff000000)}) {
    return Container(
      alignment: Alignment.center,
      child: SvgPicture.asset("assets/icons/${name}.svg",
        width: width,
        height: height,
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      )
    );
  }
}