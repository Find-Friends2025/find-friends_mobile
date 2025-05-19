import 'package:cached_network_image/cached_network_image.dart';
import 'package:find_friends/ui/core/themes/colors.dart';
import 'package:find_friends/ui/core/themes/icons.dart';
import 'package:find_friends/ui/core/themes/typography.dart';
import 'package:find_friends/ui/core/ui/home_top_bar_widget.dart';
import 'package:find_friends/ui/core/ui/line_button.dart';
import 'package:find_friends/ui/core/ui/topbar.dart';
import 'package:find_friends/ui/my/widgets/my_bottom_sheet.dart';
import 'package:find_friends/ui/my/widgets/my_edit_card.dart';
import 'package:flutter/material.dart';

class MyEditScreen extends StatelessWidget {
  const MyEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DGTopBar(title: Text("프로필 관리", style: DGTypography.title2Bold)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
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
              MyEditCard(name: "자기소개", content: "", type: SheetType.text),
              MyEditCard(name: "닉네임", content: "말랑탱이", type: SheetType.text),
              MyEditCard(name: "성별", content: "남자", type: SheetType.radio),
              MyEditCard(
                name: "생년월일",
                content: "2007-08-07",
                type: SheetType.date,
              ),
              MyEditCard(
                name: "거주지",
                content: "부산광역시",
                type: SheetType.residence,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
