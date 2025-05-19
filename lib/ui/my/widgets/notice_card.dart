import 'package:find_friends/ui/core/themes/colors.dart';
import 'package:find_friends/ui/core/themes/typography.dart';
import 'package:flutter/material.dart';

class NoticeCard extends StatelessWidget {
  final String title;
  final String content;

  const NoticeCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: DGColors.line.neutral),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: DGTypography.headline1Bold.copyWith(color: Colors.black),
          ),
          SizedBox(height: 10),
          Text(
            content,
            style: DGTypography.captionRegular.copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
