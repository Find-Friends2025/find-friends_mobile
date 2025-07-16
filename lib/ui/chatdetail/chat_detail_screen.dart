import 'package:find_friends/config/injectable_init.dart';
import 'package:find_friends/ui/chatdetail/chat_detail_viewmodel.dart';
import 'package:find_friends/ui/chatdetail/model/chat_detail_event.dart';
import 'package:find_friends/ui/chatdetail/model/chat_detail_state.dart';
import 'package:find_friends/ui/chatdetail/widgets/chat_detail_bottom_bar.dart';
import 'package:find_friends/ui/chatdetail/widgets/chat_detail_my_item.dart';
import 'package:find_friends/ui/chatdetail/widgets/chat_detail_other_item.dart';
import 'package:find_friends/ui/core/themes/colors.dart';
import 'package:find_friends/ui/core/themes/typography.dart';
import 'package:find_friends/ui/core/ui/topbar.dart';
import 'package:find_friends/utils/date_time_utile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({super.key});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  late final ChatDetailViewModel _vm;

  @override
  void initState() {
    super.initState();

    _vm = getIt<ChatDetailViewModel>();
    _vm.add(ChatDetailLoad());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scrollController.hasListeners) {
        _scrollController.addListener(() {
          if (!_scrollController.hasClients) return;
          if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 200) {
            _vm.add(ChatDetailLoadMore());
          }
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _vm,
      child: BlocBuilder<ChatDetailViewModel, ChatDetailState>(
        builder: (context, state) {
          if (state.isLoading) {
            return Scaffold(
              backgroundColor: DGColors.static.white,
              appBar: DGTopBar(
                backgroundColor: DGColors.static.white,
                title: Text(
                  "신민호",
                  style: DGTypography.headline1Medium.copyWith(
                    color: DGColors.label.normal,
                  ),
                ),
              ),
              body: Center(child: CircularProgressIndicator()),
            );
          }

          return Scaffold(
            backgroundColor: DGColors.static.white,
            appBar: DGTopBar(
              backgroundColor: DGColors.static.white,
              title: Text(
                "신민호",
                style: DGTypography.headline1Medium.copyWith(
                  color: DGColors.label.normal,
                ),
              ),
            ),
            body: ListView.separated(
              controller: _scrollController,
              reverse: true,
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                final item = state.messages[index];
                final nextItem =
                    index - 1 >= 0 ? state.messages[index - 1] : null;
                final isShowTime = nextItem?.senderId != item.senderId;
                if (state.myInfo?.id.toString() == item.senderId) {
                  return ChatDetailMyItem(
                    text: item.message,
                    time: isShowTime ? item.sendAt.toIso8601OnlyHour() : null,
                  );
                }

                final previousItem = state.messages.elementAtOrNull(index + 1);
                final isFirstItem = previousItem?.senderId != item.senderId;
                return ChatDetailOtherItem(
                  text: item.message,
                  imageUrl: isFirstItem ? item.senderProfileImage : null,
                  username: isFirstItem ? item.senderName : null,
                  time: isShowTime ? item.sendAt.toIso8601OnlyHour() : null,
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 8);
              },
              itemCount: state.messages.length,
            ),
            bottomNavigationBar: ChatDetailBottomBar(
              controller: _controller,
              onPressed: () {
                context.read<ChatDetailViewModel>().add(
                  ChatDetailSendMessage(
                    message: _controller.text,
                    roomId: "39f745df-c905-4feb-99aa-8216097c25a4",
                  ),
                );
                _controller.clear();
              },
            ),
          );
        },
      ),
    );
  }
}
