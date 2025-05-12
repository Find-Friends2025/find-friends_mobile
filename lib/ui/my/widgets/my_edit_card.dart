import 'package:find_friends/ui/core/themes/colors.dart';
import 'package:find_friends/ui/core/themes/typography.dart';
import 'package:find_friends/ui/core/ui/clickable.dart';
import 'package:find_friends/ui/my/widgets/my_bottom_sheet.dart';
import 'package:flutter/material.dart';
import '../../../domain/enums/sheet_type.dart';

class MyEditCard extends StatelessWidget {
  final String name;
  final String? content;
  final SheetType type;

  const MyEditCard({
    super.key,
    required this.name,
    required this.content,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        spacing: 0,
        children: [
          DGClickable(
            onPressed: () {
              Scaffold.of(context).showBottomSheet((BuildContext context) {
                return MyBottomSheet(type: this.type);
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                spacing: 40,
                children: [
                  Text(
                    name,
                    style: DGTypography.headline2Medium.copyWith(
                      color: DGColors.label.strong,
                    ),
                  ),
                  Text(
                    content ?? "",
                    style: DGTypography.headline2Medium.copyWith(
                      color: DGColors.label.strong,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: DGColors.line.neutral,
            width: double.infinity,
            height: 1,
          ),
        ],
      ),
    );
  }
}
