import 'package:find_friends/ui/chatdetail/widgets/chat_detail_bottom_bar.dart';
import 'package:find_friends/ui/chatdetail/widgets/chat_detail_my_item.dart';
import 'package:find_friends/ui/chatdetail/widgets/chat_detail_other_item.dart';
import 'package:find_friends/ui/core/themes/colors.dart';
import 'package:find_friends/ui/core/themes/typography.dart';
import 'package:find_friends/ui/core/ui/topbar.dart';
import 'package:flutter/material.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({super.key});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          return switch (index % 6) {
            0 => ChatDetailMyItem(
              text: "$index qewqqweoqwjeoqeosdfl;asdfkgkjqewrewrkjew",
            ),
            1 => ChatDetailMyItem(text: "$index", time: "12:30"),
            2 => ChatDetailOtherItem(
              text: "$index 1321ㅓㅏㄷㅈ류ㅗㅁ아러ㅣ131233ㅏㄱㄷㅈ",
              imageUrl: "https://i.pravatar.cc/300",
              username: "username $index",
              time: "12:30",
            ),
            3 => ChatDetailMyItem(text: "$index", time: "12:30"),
            4 => ChatDetailOtherItem(
              text: "$index",
              imageUrl: "https://i.pravatar.cc/300",
              username: "username $index",
            ),
            5 => ChatDetailOtherItem(text: "$index", time: "12:30"),
            int() => throw UnimplementedError(),
          };
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 8);
        },
        itemCount: 30,
      ),
      bottomNavigationBar: ChatDetailBottomBar(controller: _controller),
    );
  }
}
