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

  static Color get white => const Color(0xffFFFFFF);
  static Color get black => const Color(0xff000000);
  static Color get negative => const Color(0xffFF1F4C);
  static Color get positive => const Color(0xff20DF33);

}

class _DGColorsLabel {
  _DGColorsLabel._();

  static Color get normal => const Color(0xff0C0C0D);
  static Color get strong => const Color(0xff000000);
  static Color get neutral => const Color(0xff3B3B40);
  static Color get alternative => const Color(0xff5E5E66);
  static Color get assistive => const Color(0xff5E5E66);
  static Color get disable => const Color(0xffF6F6F7);

}

class _DGColorsLine {
  _DGColorsLine._();

  static Color get normal => const Color(0xffE4E4E5);
  static Color get neutral => const Color(0xffF2F2F3);
  static Color get alternative => const Color(0xffF6F6F7);
}

class _DGColorsBackground {
  _DGColorsBackground._();

  static Color get normal => const Color(0xffFFFFFF);
  static Color get neutral => const Color(0xffFCFCFD);
}