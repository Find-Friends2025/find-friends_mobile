import 'package:find_friends/domain/enums/gender.dart';
import 'package:find_friends/ui/core/themes/colors.dart';
import 'package:find_friends/ui/core/themes/typography.dart';
import 'package:find_friends/ui/core/ui/button.dart';
import 'package:find_friends/ui/core/ui/checkbox.dart';
import 'package:find_friends/ui/core/ui/textfield.dart';
import 'package:find_friends/ui/core/ui/topbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignupGenderScreen extends StatefulWidget {
  @override
  State<SignupGenderScreen> createState() => _SignupGenderScreenState();
}

class _SignupGenderScreenState extends State<SignupGenderScreen> {
  Gender? selectedGender;

  void _onNextPressed() {
    if (selectedGender != null) {
      print("선택된 성별: $selectedGender");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DGTopBar(backgroundColor: DGColors.background.normal),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("당신의 성별을 알려주세요", style: DGTypography.title2Bold),
            const SizedBox(height: 56),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  for (var gender in Gender.values)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: Row(
                        children: [
                          DGCheckbox(
                            isToggled: selectedGender == gender,
                            onTap: (bool _) {
                              setState(() {
                                selectedGender = gender;
                              });
                            },
                          ),
                          const SizedBox(width: 20),
                          Text(gender.alias, style: DGTypography.headline1Bold),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            const Spacer(),
            DGButton(
              text: "다음",
              buttonSize: ButtonSize.large,
              expand: true,
              onPressed: _onNextPressed,
              isEnabled:
                  selectedGender !=
                  null, // 혹은 isDisabled: selectedGender == null
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
