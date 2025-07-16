import 'package:flutter/material.dart';

abstract class DGShadow {
  static final black1 = BoxShadow(
    color: Color(0x02000000),
    blurRadius: 10,
    offset: Offset(0, 3),
  );

  static final black2 = BoxShadow(
    color: Color(0x04000000),
    blurRadius: 12,
    offset: Offset(0, 4),
  );
}
