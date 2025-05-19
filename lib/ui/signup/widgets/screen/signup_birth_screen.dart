import 'package:find_friends/ui/core/themes/colors.dart';
import 'package:find_friends/ui/core/themes/icons.dart';
import 'package:find_friends/ui/core/themes/typography.dart';
import 'package:find_friends/ui/core/ui/button.dart';
import 'package:find_friends/ui/core/ui/clickable.dart';
import 'package:find_friends/ui/core/ui/textfield.dart';
import 'package:find_friends/ui/core/ui/topbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignupBirthScreen extends StatelessWidget {
  const SignupBirthScreen({super.key});

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
                Text("생년월일을 확인해 주세요",
                    style: DGTypography.title2Bold),
                DGClickable(
                    onPressed: () {
                      showDatePicker(context: context, firstDate: DateTime.utc(1900) , lastDate: DateTime.now());
                    },
                    child: IgnorePointer(
                        child: DGTextField(
                          controller: TextEditingController(),
                          hintText: "생년월일을 입력해주세요.",
                          icon: DGIcons.calendar,
                        )
                    )
                ),
                Spacer(),
                DGButton(text: "다음", buttonSize: ButtonSize.large, expand: true, onPressed: () {

                })
              ]
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