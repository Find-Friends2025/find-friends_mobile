import 'package:find_friends/ui/core/themes/colors.dart';
import 'package:find_friends/ui/core/themes/typography.dart';
import 'package:find_friends/ui/core/ui/clickable.dart';
import 'package:flutter/material.dart';

class MyEditCard extends StatelessWidget {
  final String name;
  final String? content;
  final Function() onPressed;

  const MyEditCard({
    super.key,
    required this.name,
    required this.content,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return DGClickable(
      onPressed: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          spacing: 8,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 40,
              children: [
                Text(
                  name,
                  style: DGTypography.headline2Medium.copyWith(
                    color: DGColors.label.strong,
                  ),
                ),
                Text(
                  content ?? "",
                  style: DGTypography.headline2Medium.copyWith(
                    color: DGColors.label.strong,
                  ),
                ),
              ],
            ),
            Container(
              color: DGColors.line.neutral,
              width: double.infinity,
              height: 1,
              margin: EdgeInsets.symmetric(vertical: 8),
            ),
          ],
        ),
      ),
    );
  }
}
