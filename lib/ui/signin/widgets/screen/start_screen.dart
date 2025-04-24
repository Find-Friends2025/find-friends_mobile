import 'package:find_friends/ui/core/themes/colors.dart';
import 'package:find_friends/ui/core/themes/icons.dart';
import 'package:find_friends/ui/core/themes/typography.dart';
import 'package:find_friends/ui/core/ui/button.dart';
import 'package:find_friends/ui/signin/widgets/screen/terms_screen.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: DGColors.static.black,
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 130),
            Text(
              "두근두근",
              style: TextStyle(
                color: DGColors.primary,
                fontSize: 45,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 7),
            Text(
              "새로운 만남을 시작합니다.",
              style: DGTypography.headline1Medium.copyWith(
                color: DGColors.static.white,
              ),
            ),
            Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: DGButton(
                text: "전화번호 인증",
                buttonSize: ButtonSize.large,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TermsScreen()),
                  );
                },
                leadingIcon: DGIcons.phone,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "나는 이용약관 및 개인정보취급방침에 동의하고\n만 19세 이상의 독신임을 맹세합니다.",
              style: DGTypography.captionRegular.copyWith(
                color: DGColors.label.assistive,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Terms of Service · Privacy Policy",
              style: DGTypography.captionRegular.copyWith(
                color: DGColors.static.white,
              ),
            ),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
