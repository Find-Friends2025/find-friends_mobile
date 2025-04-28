import 'package:find_friends/ui/core/themes/colors.dart';
import 'package:find_friends/ui/core/themes/icons.dart';
import 'package:find_friends/ui/core/themes/typography.dart';
import 'package:find_friends/ui/core/ui/button.dart';
import 'package:find_friends/ui/core/ui/textfield.dart';
import 'package:find_friends/ui/core/ui/topbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignupNickScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DGTopBar(
        backgroundColor: DGColors.background.normal,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(24, 24, 24, 0),
        child: Column(
          spacing: 60,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text("닉네임을 정해주세요", style: DGTypography.title2Bold),
            DGTextField(
              icon: DGIcons.,
                controller: TextEditingController(),
                hintText: "닉네임을 입력해주세요."
            ),
            Spacer(),
            DGButton(
              text: "다음",
              buttonSize: ButtonSize.large,
              expand: true,
              onPressed: () {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        color: DGColors.static.white,
        height: 0,
      ),
    );
  }
}
