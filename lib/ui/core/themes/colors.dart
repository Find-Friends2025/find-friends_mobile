import 'package:flutter/material.dart';

class DGColors {
  const DGColors._();

  static Color get primary => const Color(0xff00C7B1);
  static _DGColorsStatic get static => _DGColorsStatic._();
  static _DGColorsLabel get label => _DGColorsLabel._();
  static _DGColorsLine get line => _DGColorsLine._();
  static _DGColorsBackground get background => _DGColorsBackground._();
}

class _DGColorsStatic {
  _DGColorsStatic._();

  Color get white => const Color(0xffFFFFFF);
  Color get black => const Color(0xff000000);
  Color get negative => const Color(0xffFF1F4C);
  Color get positive => const Color(0xff20DF33);

}

class _DGColorsLabel {
  _DGColorsLabel._();

  Color get normal => const Color(0xff0C0C0D);
  Color get strong => const Color(0xff000000);
  Color get neutral => const Color(0xff3B3B40);
  Color get alternative => const Color(0xff5E5E66);
  Color get assistive => const Color(0xff767680);
  Color get disable => const Color(0xffF6F6F7);

}

class _DGColorsLine {
  _DGColorsLine._();

  Color get normal => const Color(0xffE4E4E5);
  Color get neutral => const Color(0xffF2F2F3);
  Color get alternative => const Color(0xffF6F6F7);
}

class _DGColorsBackground {
  _DGColorsBackground._();

  Color get normal => const Color(0xffFFFFFF);
  Color get neutral => const Color(0xffFCFCFD);
}