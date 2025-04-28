import 'package:cached_network_image/cached_network_image.dart';
import 'package:find_friends/ui/core/themes/colors.dart';
import 'package:find_friends/ui/core/themes/icons.dart';
import 'package:find_friends/ui/core/themes/typography.dart';
import 'package:find_friends/ui/core/ui/home_bottom_navigation_widget.dart';
import 'package:find_friends/ui/core/ui/home_top_bar_widget.dart';
import 'package:find_friends/ui/core/ui/line_button.dart';
import 'package:find_friends/ui/my/widgets/my_card.dart';
import 'package:flutter/material.dart';

class MyScreen extends StatelessWidget {
  const MyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeTopBarWidget(title: "마이페이지", actions: []),
      bottomNavigationBar: HomeBottomNavigationWidget(
        selectedItem: HomeBottomNavItems.my,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 8,
          children: [
            SizedBox(height: 0),
            ClipRRect(
              borderRadius: BorderRadius.circular(99),
              child: CachedNetworkImage(
                imageUrl: "https://i.pravatar.cc/300",
                placeholder: (context, url) => CircularProgressIndicator(),
                width: 150,
                height: 150,
              ),
            ),
            SizedBox(
              width: 228,
              child: DGLineButton(
                text: "프로필 관리",
                buttonSize: LineButtonSize.medium,
                onPressed: () {},
                expand: true,
                leadingIcon: DGIcons.pencil,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 8,
              children: [
                DGIcons.attentionTriangle.toImage(
                  width: 16,
                  height: 16,
                  color: DGColors.static.negative,
                ),
                Text(
                  "자기소개가 입력되어 있지 않습니다.",
                  style: DGTypography.labelRegular.copyWith(
                    color: DGColors.static.negative,
                  ),
                ),
              ],
            ),
            Container(
              color: DGColors.line.neutral,
              width: double.infinity,
              height: 1,
              margin: EdgeInsets.symmetric(vertical: 8),
            ),
            MyCard(text: "공지 사항", onPressed: () {}),
            MyCard(text: "내가 보낸 좋아요", onPressed: () {}),
            MyCard(
              text: "로그아웃",
              textColor: DGColors.static.negative,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
