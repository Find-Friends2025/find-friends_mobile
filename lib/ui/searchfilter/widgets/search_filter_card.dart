import 'package:find_friends/ui/core/themes/colors.dart';
import 'package:find_friends/ui/core/themes/typography.dart';
import 'package:find_friends/ui/core/ui/toggle.dart';
import 'package:flutter/material.dart';

class SearchFilterCard extends StatelessWidget {
  final String text;
  final String? subText;
  final bool? toggleValue;
  final OnCheckChanged? onToggleChanged;

  const SearchFilterCard({
    super.key,
    required this.text,
    this.subText,
    this.toggleValue,
    this.onToggleChanged,
  });

  @override
  Widget build(BuildContext context) {
    assert(
      subText != null || toggleValue != null,
      "must have to subText or toggleValue",
    );
    return SizedBox(
      height: 47,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: DGTypography.headline2Bold.copyWith(
              color: DGColors.label.normal,
            ),
          ),
          if (subText != null)
            Text(
              subText!,
              style: DGTypography.headline2Regular.copyWith(
                color: DGColors.label.normal,
              ),
            ),

          if (toggleValue != null)
            DGToggle(
              isChecked: toggleValue!,
              onChanged: onToggleChanged ?? (value) {},
            ),
        ],
      ),
    );
  }
}
