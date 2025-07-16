import 'package:cached_network_image/cached_network_image.dart';
import 'package:find_friends/ui/core/themes/colors.dart';
import 'package:find_friends/ui/core/themes/icons.dart';
import 'package:find_friends/ui/core/themes/typography.dart';
import 'package:flutter/material.dart';

class FindTieCard extends StatelessWidget {
  final String imageUrl;
  final String userName;
  final String userLocation;
  final bool isOnline;
  final bool isLike;

  const FindTieCard({
    super.key,
    required this.imageUrl,
    required this.userName,
    required this.userLocation,
    required this.isOnline,
    required this.isLike,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 4,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: AspectRatio(
              aspectRatio: 1,
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 4,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: DGTypography.bodyMedium.copyWith(
                      color: DGColors.label.normal,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 8,
                    children: [
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(99),
                          color:
                              isOnline
                                  ? DGColors.static.positive
                                  : DGColors.label.assistive,
                        ),
                      ),
                      Text(
                        userLocation,
                        style: DGTypography.bodyMedium.copyWith(
                          color: DGColors.label.normal,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              DGIcons.like.toImage(
                width: 32,
                height: 32,
                color: isLike ? DGColors.primary : DGColors.label.assistive,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
