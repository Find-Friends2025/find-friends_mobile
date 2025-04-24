import 'package:find_friends/ui/core/themes/colors.dart';
import 'package:find_friends/ui/core/themes/typography.dart';
import 'package:find_friends/ui/core/ui/button.dart';
import 'package:find_friends/ui/core/ui/checkbox.dart';
import 'package:find_friends/ui/signin/widgets/screen/code_send_screen.dart';
import 'package:flutter/material.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: DGColors.background.normal,
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 120),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "이용약관",
                    style: DGTypography.title2Bold.copyWith(
                      color: DGColors.label.strong,
                    ),
                  ),
                  SizedBox(height: 25),
                  AcceptAllToggle(),
                  IndividualTermsToggle(name: "개인정보 수집 및 이용"),
                  IndividualTermsToggle(name: "이용약관"),
                  IndividualTermsToggle(name: "개인정보 제 3자 제공"),
                ],
              ),
            ),
            Expanded(child: Container()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 45),
              child: DGButton(
                text: "다음",
                buttonSize: ButtonSize.large,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CodeSendScreen()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AcceptAllToggle extends StatelessWidget {
  const AcceptAllToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DGCheckbox(size: DGCheckBoxSize.small),
        SizedBox(width: 10),
        Text(
          "전체동의",
          style: DGTypography.headline2Medium.copyWith(
            color: DGColors.label.strong,
          ),
        ),
      ],
    );
  }
}

class IndividualTermsToggle extends StatelessWidget {
  final String name;

  const IndividualTermsToggle({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 25),
        Row(
          children: [
            SizedBox(width: 28),
            DGCheckbox(size: DGCheckBoxSize.small),
            TermsLabel(name: name),
          ],
        ),
      ],
    );
  }
}

class TermsLabel extends StatelessWidget {
  final String name;

  const TermsLabel({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 10),
        Text(
          "(필수) ",
          style: DGTypography.bodyRegular.copyWith(
            color: DGColors.label.strong,
          ),
        ),
        Text(
          this.name,
          style: DGTypography.bodyRegular.copyWith(color: DGColors.primary),
        ),
        Text(
          "에 동의합니다.",
          style: DGTypography.bodyRegular.copyWith(
            color: DGColors.label.strong,
          ),
        ),
      ],
    );
  }
}
