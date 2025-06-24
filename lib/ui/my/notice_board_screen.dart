import 'package:find_friends/ui/core/themes/typography.dart';
import 'package:find_friends/ui/core/ui/topbar.dart';
import 'package:find_friends/ui/my/widgets/notice_card.dart';
import 'package:flutter/material.dart';

class NoticeBoardScreen extends StatelessWidget {
  const NoticeBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DGTopBar(title: Text("공지사항", style: DGTypography.title2Bold)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              SizedBox(height: 10),
              ...List.generate(
                1,
                (index) => NoticeCard(
                  title: "버전 v1.0 출시",
                  content:
                      "드디어 기다리던 버전 1.0을 출시하게 되었습니다.\n많은 분들의 관심과 응원 덕분에 여기까지 올 수 있었습니다.\n앞으로도 꾸준히 업데이트하며 더 나은 서비스를 제공하겠습니다.\n사용자 여러분의 소중한 피드백도 언제든지 환영합니다!",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
