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
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 15,
            children: [
              SizedBox(height: 10),
              ...List.generate(
                10,
                (index) => NoticeCard(
                  title: "공지사항 제목",
                  content:
                      "공지사항공지사항공지사항공지사항공지사항공지사항공지사항공지사항공지사항공지사항공지사항공지사항공지사항공지사항공지사항공지사항공지사항공지사항공지사항",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
