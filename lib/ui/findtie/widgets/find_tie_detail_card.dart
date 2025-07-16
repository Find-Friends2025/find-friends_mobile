import 'package:find_friends/ui/core/themes/colors.dart';
import 'package:find_friends/ui/core/themes/typography.dart';
import 'package:flutter/material.dart';

class FindTieDetailItem {
  final String title;
  final String content;

  FindTieDetailItem({required this.title, required this.content});
}

class FindTieDetailCard extends StatelessWidget {
  final String title;
  final List<FindTieDetailItem> items;

  const FindTieDetailCard({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    const text = '자녀분의 유무';
    final style = DGTypography.bodyMedium;
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
    )..layout();

    final textWidth = textPainter.size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: DGTypography.headline2Bold.copyWith(
              color: DGColors.label.strong,
            ),
          ),
          ...items.map((item) => _buildProfileItem(item, textWidth)),
        ],
      ),
    );
  }

  Widget _buildProfileItem(FindTieDetailItem item, double titleWidth) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: titleWidth,
                child: Text(
                  item.title,
                  style: DGTypography.bodyMedium.copyWith(
                    color: DGColors.label.neutral,
                  ),
                ),
              ),
              SizedBox(width: 8),
              Text(
                item.content,
                style: DGTypography.bodyMedium.copyWith(
                  color: DGColors.label.normal,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
