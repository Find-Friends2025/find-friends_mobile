import 'package:find_friends/ui/core/themes/icons.dart';
import 'package:find_friends/ui/core/themes/typography.dart';
import 'package:find_friends/ui/core/ui/home_bottom_navigation_widget.dart';
import 'package:find_friends/ui/core/ui/home_top_bar_widget.dart';
import 'package:find_friends/ui/findtie/widgets/find_tie_card.dart';
import 'package:flutter/material.dart';

class FindTieScreen extends StatelessWidget {
  final bool notFoundUser = false;

  const FindTieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final itemWidth = (screenWidth - 8 * 3) / 2; // padding 고려
    return Scaffold(
      appBar: HomeTopBarWidget(
        title: "추천순",
        actions: [DGIcons.magnifyingglass],
        showPolygon: true,
        onClickAction: (icon) {},
      ),
      bottomNavigationBar: HomeBottomNavigationWidget(
        selectedItem: HomeBottomNavItems.findTie,
      ),
      body:
          notFoundUser
              ? Center(
                child: Text(
                  "해당 회원을 찾지 못하였습니다.",
                  style: DGTypography.headline2Regular,
                  textAlign: TextAlign.center,
                ),
              )
              : SingleChildScrollView(
                padding: const EdgeInsets.all(8),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 12,
                  children: List.generate(20, (index) {
                    return SizedBox(
                      width: itemWidth,
                      child: FindTieCard(
                        imageUrl: "https://i.pravatar.cc/300",
                        userName: "userName $index",
                        userLocation: "userLocation",
                        isOnline: false,
                        isLike: true,
                      ),
                    );
                  }),
                ),
              ),
    );
  }
}
