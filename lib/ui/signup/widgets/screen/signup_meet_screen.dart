import 'package:find_friends/ui/core/themes/colors.dart';
import 'package:find_friends/ui/core/themes/typography.dart';
import 'package:find_friends/ui/core/ui/button.dart';
import 'package:find_friends/ui/core/ui/topbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignupMeetScreen extends StatelessWidget {
  const SignupMeetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DGTopBar(
        backgroundColor: DGColors.background.normal,
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 14),
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 20,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: "두근두근",
                            style: DGTypography.title1Bold.copyWith(color: DGColors.primary)
                          ),
                          TextSpan(
                              text: " 에서는\n새로운 만남을 선물합니다.",
                              style: DGTypography.title1Bold
                          )
                        ]
                      )),
                    Text("\"환영합니다.\"", style: DGTypography.headline1Regular),
                    Text("지인과의 매칭을 원치 않는 분들을 위해\n연락처 정보를 수집합니다.", style: DGTypography.headline1Regular),
                    Text("다음에 다시 동의하고 싶은 경우,\n마이 페이지 -> 아는 사람과 만나지 않기로 설정 가능합니다.", style: DGTypography.bodyRegular)
                  ],
                )
            ),

            Spacer(),
            
            DGButton(
              text: "동의합니다",
              buttonSize: ButtonSize.large,
              expand: true,
              onPressed: () {

              }),

            DGButton(
                text: "거부합니다",
                buttonSize: ButtonSize.large,
                expand: true,
                onPressed: () {

                })

          ],
        )
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        color: DGColors.static.white,
        height: 0,
      ),
    );
  }

}