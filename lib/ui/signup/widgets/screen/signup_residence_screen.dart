import 'package:find_friends/domain/enums/gender.dart';
import 'package:find_friends/domain/enums/residence.dart';
import 'package:find_friends/ui/core/themes/colors.dart';
import 'package:find_friends/ui/core/themes/typography.dart';
import 'package:find_friends/ui/core/ui/button.dart';
import 'package:find_friends/ui/core/ui/topbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignupResidenceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DGTopBar(backgroundColor: DGColors.background.normal),
      body: Padding(
        padding: EdgeInsets.fromLTRB(24, 24, 24, 0),
        child: Column(
          spacing: 60,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("당신의 거주지를 알려주세요", style: DGTypography.title2Bold),
            Expanded(
                child: SingleChildScrollView(
                    child: Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: List.generate(Residence.values.length, (i) => Text(Residence.values[i].alias))
                    )
                )
            ),
            DGButton(
              text: "다음",
              buttonSize: ButtonSize.large,
              expand: true,
              onPressed: () {

              },
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
