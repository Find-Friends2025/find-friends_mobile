import 'package:cached_network_image/cached_network_image.dart';
import 'package:find_friends/ui/core/themes/colors.dart';
import 'package:find_friends/ui/core/themes/typography.dart';
import 'package:find_friends/ui/core/ui/clickable.dart';
import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String content;
  final String time;
  final int? count;
  final GestureTapCallback onPressed;

  const ChatItem({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.content,
    required this.time,
    this.count,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return DGClickable(
      onPressed: () {},
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        width: double.infinity,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(99),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                width: 40,
                height: 40,
              ),
            ),
            SizedBox(width: 8),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: DGTypography.bodyMedium.copyWith(
                    color: DGColors.label.normal,
                  ),
                ),
                Text(
                  content,
                  style: DGTypography.labelMedium.copyWith(
                    color: DGColors.label.neutral,
                  ),
                ),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 4,
              children: [
                Text(
                  time,
                  style: DGTypography.labelRegular.copyWith(
                    color: DGColors.label.assistive,
                  ),
                ),
                if (count != null)
                  Container(
                    decoration: BoxDecoration(
                      color: DGColors.primary,
                      borderRadius: BorderRadius.circular(99),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                    child: Text(
                      count.toString(),
                      style: DGTypography.labelRegular.copyWith(
                        color: DGColors.static.white,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
