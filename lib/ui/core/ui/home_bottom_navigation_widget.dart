import 'package:find_friends/ui/core/themes/colors.dart';
import 'package:find_friends/ui/core/themes/icons.dart';
import 'package:find_friends/ui/core/themes/shadow.dart';
import 'package:find_friends/ui/core/themes/typography.dart';
import 'package:find_friends/ui/core/ui/clickable.dart';
import 'package:flutter/material.dart';

typedef OnClickCallBack = void Function(DGIcons);

enum HomeBottomNavItems { findTie, like, chat, my }

class HomeBottomNavigationWidget extends StatelessWidget {
  const HomeBottomNavigationWidget({super.key, required this.selectedItem});

  final HomeBottomNavItems selectedItem;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: 64,
        margin: EdgeInsets.only(left: 24, right: 24, bottom: 4),
        decoration: ShapeDecoration(
          color: DGColors.static.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
            ),
          ),
          shadows: [DGShadow.black1],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _BottomNavItem(
              title: "인연 찾기",
              icon: DGIcons.magnifyingglass,
              selected: selectedItem == HomeBottomNavItems.findTie,
              onClick: onClickNavItem,
            ),
            _BottomNavItem(
              title: "내가 받은",
              icon: DGIcons.like,
              selected: selectedItem == HomeBottomNavItems.like,
              onClick: onClickNavItem,
            ),
            _BottomNavItem(
              title: "채팅",
              icon: DGIcons.chat,
              selected: selectedItem == HomeBottomNavItems.chat,
              onClick: onClickNavItem,
            ),
            _BottomNavItem(
              title: "마이페이지",
              icon: DGIcons.person,
              selected: selectedItem == HomeBottomNavItems.my,
              onClick: onClickNavItem,
            ),
          ],
        ),
      ),
    );
  }

  void onClickNavItem(DGIcons icon) {}
}

class _BottomNavItem extends StatelessWidget {
  const _BottomNavItem({
    super.key,
    required this.title,
    required this.icon,
    required this.selected,
    required this.onClick,
  });

  final String title;
  final DGIcons icon;
  final bool selected;
  final OnClickCallBack onClick;

  @override
  Widget build(BuildContext context) {
    final disabledColor = DGColors.label.assistive.withValues(alpha: 0.4);
    return Expanded(
      child: DGClickable(
        onPressed: () => onClick.call(icon),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 8,
          children: [
            icon.toImage(
              width: 28,
              height: 28,
              color: selected ? DGColors.primary : disabledColor,
            ),
            Text(
              title,
              style: DGTypography.captionBold.copyWith(
                color: selected ? DGColors.primary : disabledColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
