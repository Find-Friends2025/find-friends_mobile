import 'package:cached_network_image/cached_network_image.dart';
import 'package:find_friends/ui/core/themes/icons.dart';
import 'package:find_friends/ui/core/ui/home_top_bar_widget.dart';
import 'package:find_friends/ui/core/ui/line_button.dart';
import 'package:find_friends/ui/my/widgets/my_edit_card.dart';
import 'package:flutter/material.dart';

class MyEditScreen extends StatelessWidget {
  const MyEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeTopBarWidget(title: "프로필 수정", actions: []),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
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
                width: 130,
                child: DGLineButton(
                  text: "프로필 사진 수정",
                  buttonSize: LineButtonSize.medium,
                  onPressed: () {},
                  expand: true,
                ),
              ),
              MyEditCard(name: "자기소개", onPressed: () {}, content: ''),
              MyEditCard(name: "닉네임", onPressed: () {}, content: '말랑탱이'),
              MyEditCard(name: "성별", onPressed: () {}, content: '남자'),
              MyEditCard(name: "생년월일", onPressed: () {}, content: '2007-08-09'),
              MyEditCard(name: "거주지", onPressed: () {}, content: '대구광역시'),
            ],
          ),
        ),
      ),
    );
  }
}
