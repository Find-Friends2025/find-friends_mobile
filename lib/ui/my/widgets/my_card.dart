import 'package:find_friends/ui/core/themes/colors.dart';
import 'package:find_friends/ui/core/themes/icons.dart';
import 'package:find_friends/ui/core/themes/typography.dart';
import 'package:find_friends/ui/core/ui/clickable.dart';
import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final String text;
  final Color? textColor;
  final Function() onPressed;

  const MyCard({
    super.key,
    required this.text,
    this.textColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return DGClickable(
      onPressed: onPressed,
      child: Container(
        height: 48,
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: DGTypography.headline2Medium.copyWith(
                color: textColor ?? DGColors.label.strong,
              ),
            ),
            DGIcons.arrowRight.toImage(
              width: 24,
              height: 24,
              color: DGColors.label.normal,
            ),
          ],
        ),
      ),
    );
  }
}
