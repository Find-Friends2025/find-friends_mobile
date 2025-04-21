import 'package:find_friends/ui/core/themes/colors.dart';
import 'package:find_friends/ui/core/themes/typography.dart';
import 'package:flutter/material.dart';

class TermsLabel extends StatelessWidget {
  final String name;

  const TermsLabel({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 10),
        Text(
          "(필수) ",
          style: DGTypography.bodyRegular.copyWith(
            color: DGColors.label.strong,
          ),
        ),
        Text(
          this.name,
          style: DGTypography.bodyRegular.copyWith(color: DGColors.primary),
        ),
        Text(
          "에 동의합니다.",
          style: DGTypography.bodyRegular.copyWith(
            color: DGColors.label.strong,
          ),
        ),
      ],
    );
  }
}
