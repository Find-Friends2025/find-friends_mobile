import 'package:find_friends/ui/core/themes/colors.dart';
import 'package:find_friends/ui/core/themes/typography.dart';
import 'package:find_friends/ui/core/ui/topbar.dart';
import 'package:find_friends/ui/searchfilter/widgets/search_filter_card.dart';
import 'package:flutter/material.dart';

class SearchFilterScreen extends StatelessWidget {
  const SearchFilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DGTopBar(backgroundColor: DGColors.background.normal),
      backgroundColor: DGColors.background.normal,
      body: Padding(
        padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(
                  "어떤 사람을 찾고 있나요?",
                  style: DGTypography.title1Bold.copyWith(
                    color: DGColors.label.normal,
                  ),
                ),
              ),
              SearchFilterCard(text: "나이", subText: "상관 없음"),
              SearchFilterCard(text: "거주지", subText: "상관 없음"),
              SearchFilterCard(text: "키", subText: "상관 없음"),
              SearchFilterCard(text: "체형", subText: "상관 없음"),
              SearchFilterCard(text: "자기소개 있음", toggleValue: false),
              SearchFilterCard(text: "회원가입 3일 이내", toggleValue: true),
            ],
          ),
        ),
      ),
    );
  }
}
