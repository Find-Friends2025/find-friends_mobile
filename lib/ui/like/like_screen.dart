import 'package:find_friends/ui/core/themes/typography.dart';
import 'package:find_friends/ui/core/ui/home_bottom_navigation_widget.dart';
import 'package:find_friends/ui/core/ui/home_top_bar_widget.dart';
import 'package:flutter/material.dart';

class LikeScreen extends StatelessWidget {
  const LikeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeTopBarWidget(title: "내가 받은 좋아요", actions: []),
      bottomNavigationBar: HomeBottomNavigationWidget(
        selectedItem: HomeBottomNavItems.like,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "해당 회원을 찾지 못하였습니다.",
              style: DGTypography.headline2Regular,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
