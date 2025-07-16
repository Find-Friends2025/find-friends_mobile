import 'package:find_friends/ui/core/themes/colors.dart';
import 'package:find_friends/ui/core/themes/typography.dart';
import 'package:flutter/material.dart';

class ChatDetailMyItem extends StatelessWidget {
  final String text;
  final String? time;
  const ChatDetailMyItem({super.key, required this.text, this.time});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (time != null) ...[
          Text(
            time!,
            style: DGTypography.captionRegular.copyWith(
              color: DGColors.label.normal,
            ),
          ),
          SizedBox(width: 4),
        ],
        Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.8,
          ),
          decoration: BoxDecoration(
            color: DGColors.primary,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
          ),
          padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          child: Text(
            text,
            style: DGTypography.bodyMedium.copyWith(
              color: DGColors.static.white,
            ),
            softWrap: true,
          ),
        ),
      ],
    );
  }
}
