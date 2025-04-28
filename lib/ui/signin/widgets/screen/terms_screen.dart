import 'package:find_friends/ui/core/themes/colors.dart';
import 'package:find_friends/ui/core/themes/typography.dart';
import 'package:find_friends/ui/core/ui/button.dart';
import 'package:find_friends/ui/core/ui/checkbox.dart';
import 'package:find_friends/ui/signin/widgets/screen/code_send_screen.dart';
import 'package:flutter/material.dart';

class TermsScreen extends StatefulWidget {
  const TermsScreen({super.key});

  @override
  State<TermsScreen> createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {
  bool isAllChecked = false;
  List<bool> isCheckedList = [false, false, false];

  void toggleAll(bool value) {
    setState(() {
      isAllChecked = value;
      isCheckedList = List<bool>.filled(isCheckedList.length, value);
    });
  }

  void toggleIndividual(int index, bool value) {
    setState(() {
      isCheckedList[index] = value;
      isAllChecked = isCheckedList.every((checked) => checked);
    });
  }

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
                  Row(
                    children: [
                      DGCheckbox(
                        onTap: (bool) {
                          toggleAll(bool);
                        },
                        size: DGCheckBoxSize.small,
                        isEnabled: true,
                        isToggled: isAllChecked,
                      ),

                      SizedBox(width: 10),
                      Text(
                        "전체동의",
                        style: DGTypography.headline2Medium.copyWith(
                          color: DGColors.label.strong,
                        ),
                      ),
                    ],
                  ),
                  // 개별 항목들
                  IndividualTermsToggle(
                    name: "개인정보 수집 및 이용",
                    toggle: isCheckedList[0],
                    onTap: (bool) {
                      toggleIndividual(0, bool);
                    },
                  ),
                  IndividualTermsToggle(
                    name: "이용약관",
                    toggle: isCheckedList[1],
                    onTap: (bool) {
                      toggleIndividual(1, bool);
                    },
                  ),
                  IndividualTermsToggle(
                    name: "개인정보 제 3자 제공",
                    toggle: isCheckedList[2],
                    onTap: (bool) {
                      toggleIndividual(2, bool);
                    },
                  ),
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
                isEnabled: isAllChecked,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IndividualTermsToggle extends StatelessWidget {
  final String name;
  final bool toggle;
  final ValueChanged<bool> onTap;

  const IndividualTermsToggle({
    super.key,
    required this.name,
    required this.toggle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 25),
        Row(
          children: [
            SizedBox(width: 28),
            DGCheckbox(
              onTap: onTap,
              size: DGCheckBoxSize.small,
              isEnabled: true,
              isToggled: toggle,
            ),

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
