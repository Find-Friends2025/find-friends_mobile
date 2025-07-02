import 'package:cached_network_image/cached_network_image.dart';
import 'package:find_friends/ui/core/themes/colors.dart';
import 'package:find_friends/ui/core/themes/icons.dart';
import 'package:find_friends/ui/core/themes/typography.dart';
import 'package:find_friends/ui/core/ui/clickable.dart';
import 'package:flutter/material.dart';

class FindTieCard extends StatefulWidget {
  final String imageUrl;
  final String userName;
  final String userLocation;
  final bool isOnline;
  bool isLike;

  FindTieCard({
    super.key,
    required this.imageUrl,
    required this.userName,
    required this.userLocation,
    required this.isOnline,
    required this.isLike,
  });

  @override
  State<FindTieCard> createState() => _FindTieCardState();
}

class _FindTieCardState extends State<FindTieCard> {
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
                  child: widget.imageUrl.isNotEmpty ? CachedNetworkImage(
                    imageUrl: widget.imageUrl,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget:
                        (context, url, error) =>
                        Image.asset("assets/images/profile_placeholder.png"),
                  ) : Image.asset("assets/images/profile_placeholder.png")
              )
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
                    widget.userName,
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
                              widget.isOnline
                                  ? DGColors.static.positive
                                  : DGColors.label.assistive,
                        ),
                      ),
                      Text(
                        widget.userLocation,
                        style: DGTypography.bodyMedium.copyWith(
                          color: DGColors.label.normal,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              DGClickable(
                onPressed: () {
                  setState(() {
                    widget.isLike = !widget.isLike;
                  });
                },
                child: DGIcons.like.toImage(
                  width: 32,
                  height: 32,
                  color: widget.isLike ? DGColors.primary : DGColors.label.assistive,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
