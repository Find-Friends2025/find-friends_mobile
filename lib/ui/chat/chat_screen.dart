import 'package:find_friends/config/injectable_init.dart';
import 'package:find_friends/routing/routes.dart';
import 'package:find_friends/ui/chat/chat_viewmodel.dart';
import 'package:find_friends/ui/chat/model/chat_event.dart';
import 'package:find_friends/ui/chat/model/chat_state.dart';
import 'package:find_friends/ui/chat/widgets/chat_item.dart';
import 'package:find_friends/ui/core/themes/typography.dart';
import 'package:find_friends/ui/core/ui/home_bottom_navigation_widget.dart';
import 'package:find_friends/ui/core/ui/home_top_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ChatScreen extends StatelessWidget {
  final bool isNotLoad = false;
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ChatViewModel>()..add(ChatLoadEvent()),
      child: Scaffold(
        appBar: HomeTopBarWidget(title: "채팅", actions: []),
        bottomNavigationBar: HomeBottomNavigationWidget(
          selectedItem: HomeBottomNavItems.chat,
        ),
        body: BlocBuilder<ChatViewModel, ChatState>(
          builder: (context, ChatState state) {
            if (isNotLoad) {
              return Column(
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
              );
            }
            return ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemCount: state.rooms.length,
              itemBuilder: (context, index) {
                final item = state.rooms[index];
                return ChatItem(
                  name: item.name,
                  imageUrl: item.profileImageUrl,
                  content: item.lastMessage ?? "",
                  time:
                      item.lastMessageDate == null
                          ? ""
                          : "${item.lastMessageDate!.hour}:${item.lastMessageDate!.minute}",
                  count:
                      item.unreadMessagesCount == 0
                          ? null
                          : item.unreadMessagesCount,
                  onPressed: () {
                    context.push(Routes.chatDetail.path);
                  },
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 8),
            );
          },
        ),
      ),
    );
  }
}
