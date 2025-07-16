import 'package:cached_network_image/cached_network_image.dart';
import 'package:find_friends/ui/core/themes/colors.dart';
import 'package:find_friends/ui/core/themes/typography.dart';
import 'package:flutter/material.dart';

class ChatDetailOtherItem extends StatelessWidget {
  final String text;
  final String? imageUrl;
  final String? username;
  final String? time;
  const ChatDetailOtherItem({
    super.key,
    required this.text,
    this.time,
    this.imageUrl,
    this.username,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        if (imageUrl != null)
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl: imageUrl!,
              width: 40,
              height: 40,
            ),
          ),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 6,
          children: [
            if (username != null)
              Text(
                username!,
                style: DGTypography.bodyMedium.copyWith(
                  color: DGColors.label.normal,
                ),
              ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (imageUrl == null) SizedBox(width: 48),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.7,
                  ),
                  decoration: BoxDecoration(
                    color: DGColors.secondary,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 6,
                    horizontal: 12,
                  ),
                  child: Text(
                    text,
                    style: DGTypography.bodyMedium.copyWith(
                      color: DGColors.static.white,
                    ),
                    maxLines: 2,
                    softWrap: true,
                  ),
                ),
                if (time != null) ...[
                  SizedBox(width: 4),
                  Text(
                    time!,
                    style: DGTypography.captionRegular.copyWith(
                      color: DGColors.label.normal,
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ],
    );
  }
}
