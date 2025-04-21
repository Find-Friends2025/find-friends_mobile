import 'package:find_friends/ui/core/themes/colors.dart';
import 'package:find_friends/ui/core/themes/icons.dart';
import 'package:find_friends/ui/core/themes/typography.dart';
import 'package:find_friends/ui/core/ui/button.dart';
import 'package:find_friends/ui/core/ui/textfield.dart';
import 'package:flutter/material.dart';

import '../policy_texts.dart';

class CodeSendScreen extends StatelessWidget {
  const CodeSendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return Center(
      child: Column(
        children: [
          SizedBox(height: 140),
          DGTextField(
            controller: controller,
            hintText: "전화번호를 입력해주세요.",
            icon: DGIcons.phone,
            iconColor: DGColors.primary,
          ),
          Expanded(child: Container()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                PolicyTexts(),
                SizedBox(height: 20),
                DGButton(
                  text: "인증번호 전송",
                  buttonSize: ButtonSize.large,
                  onPressed: () {},
                ),
              ],
            ),
          ),
          SizedBox(height: 45),
        ],
      ),
    );
  }
}
