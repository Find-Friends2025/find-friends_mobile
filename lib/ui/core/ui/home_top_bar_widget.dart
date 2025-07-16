import 'package:find_friends/ui/core/themes/icons.dart';
import 'package:find_friends/ui/core/themes/typography.dart';
import 'package:find_friends/ui/core/ui/clickable.dart';
import 'package:flutter/material.dart';

class HomeTopBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const HomeTopBarWidget({
    super.key,
    required this.title,
    required this.actions,
    this.showPolygon = false,
    this.onClickAction,
  });

  final String title;
  final bool showPolygon;
  final List<DGIcons> actions;
  final void Function(DGIcons)? onClickAction;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 60,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 4,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 6,
              children: [
                Text(title, style: DGTypography.title2Bold),
                if (showPolygon) DGIcons.polygon.toImage(width: 10, height: 10),
              ],
            ),
            const Expanded(child: SizedBox()),
            ...actions.map(
              (icon) => DGClickable(
                onPressed: () => onClickAction?.call(icon),
                child: icon.toImage(width: 24, height: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 60);
}
