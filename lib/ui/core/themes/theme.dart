import 'package:find_friends/ui/core/themes/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ThemeData get DGTheme => ThemeData(
  scaffoldBackgroundColor: DGColors.background.normal,
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: DGColors.static.black,
    selectionColor: DGColors.static.black.withOpacity(0.2),
    selectionHandleColor: DGColors.static.black,
  ),
  cupertinoOverrideTheme: NoDefaultCupertinoThemeData(
    primaryColor: DGColors.static.black,
    applyThemeToAll: true,
  ),
);
