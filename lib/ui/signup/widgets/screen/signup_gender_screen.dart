import 'package:find_friends/domain/enums/gender.dart';
import 'package:find_friends/ui/core/themes/colors.dart';
import 'package:find_friends/ui/core/themes/typography.dart';
import 'package:find_friends/ui/core/ui/button.dart';
import 'package:find_friends/ui/core/ui/checkbox.dart';
import 'package:find_friends/ui/core/ui/textfield.dart';
import 'package:find_friends/ui/core/ui/topbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignupGenderScreen extends StatelessWidget {
  const SignupGenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DGTopBar(backgroundColor: DGColors.background.normal),
      body: Padding(
        padding: EdgeInsets.fromLTRB(24, 24, 24, 0),
        child: Column(
          spacing: 56,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text("당신의 성별을 알려주세요", style: DGTypography.title2Bold),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                spacing: 24,
                children: [
                  for (var gender in Gender.values)
                    Row(
                      spacing: 20,
                      children: [
                        DGCheckbox(onTap: (bool value) {}, isToggled: false),
                        Text(gender.name, style: DGTypography.headline1Bold),
                      ],
                    ),
                ],
              ),
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
