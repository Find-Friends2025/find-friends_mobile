import 'package:find_friends/ui/chat/widgets/chat_item.dart';
import 'package:find_friends/ui/core/themes/typography.dart';
import 'package:find_friends/ui/core/ui/home_bottom_navigation_widget.dart';
import 'package:find_friends/ui/core/ui/home_top_bar_widget.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final bool isNotLoad = false;
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeTopBarWidget(title: "채팅", actions: []),
      bottomNavigationBar: HomeBottomNavigationWidget(
        selectedItem: HomeBottomNavItems.chat,
      ),
      body:
          isNotLoad
              ? Column(
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
              )
              : ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: 30,
                itemBuilder: (context, index) {
                  return ChatItem(
                    name: "Name",
                    imageUrl: "https://i.pravatar.cc/300",
                    content: "Content",
                    time: "12:30",
                    count: index % 2 == 0 ? 1 : null,
                    onPressed: () {},
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 8),
              ),
    );
  }
}
