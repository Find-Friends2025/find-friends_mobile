import 'package:find_friends/ui/core/themes/colors.dart';
import 'package:find_friends/ui/core/themes/icons.dart';
import 'package:find_friends/ui/core/themes/typography.dart';
import 'package:find_friends/ui/core/ui/clickable.dart';
import 'package:flutter/material.dart';

class ChatDetailBottomBar extends StatelessWidget {
  final TextEditingController controller;
  const ChatDetailBottomBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final textBorder = OutlineInputBorder(
      borderSide: BorderSide(color: DGColors.line.normal, width: 1),
      borderRadius: BorderRadius.circular(8),
    );

    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(thickness: 1, color: DGColors.line.normal),
          Row(
            children: [
              SizedBox(width: 16),
              DGClickable(
                onPressed: () {},
                child: DGIcons.plus.toImage(
                  width: 32,
                  height: 32,
                  color: DGColors.label.assistive.withValues(alpha: 0.7),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: TextField(
                  controller: controller,
                  style: DGTypography.bodyMedium.copyWith(
                    color: DGColors.label.normal,
                  ),
                  decoration: InputDecoration(
                    labelStyle: DGTypography.bodyMedium.copyWith(
                      color: DGColors.label.assistive,
                    ),
                    border: textBorder,
                    enabledBorder: textBorder,
                    focusedBorder: textBorder,
                  ),
                ),
              ),
              SizedBox(width: 8),
              DGClickable(
                onPressed: () {},
                child: DGIcons.sendFill.toImage(
                  width: 32,
                  height: 32,
                  color: DGColors.primary,
                ),
              ),
              SizedBox(width: 16),
            ],
          ),
        ],
      ),
    );
  }
}
