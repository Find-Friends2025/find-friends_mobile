import 'package:find_friends/config/injectable_init.dart';
import 'package:find_friends/routing/routes.dart';
import 'package:find_friends/ui/core/themes/colors.dart';
import 'package:find_friends/ui/core/themes/icons.dart';
import 'package:find_friends/ui/core/themes/typography.dart';
import 'package:find_friends/ui/core/ui/button.dart';
import 'package:find_friends/ui/core/ui/textfield.dart';
import 'package:find_friends/ui/core/ui/topbar.dart';
import 'package:find_friends/ui/signup/models/sign_up_event.dart';
import 'package:find_friends/ui/signup/models/sign_up_state.dart';
import 'package:find_friends/ui/signup/view_model/sign_up_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignupNickScreen extends StatefulWidget {

  const SignupNickScreen({super.key});

  @override
  State<SignupNickScreen> createState() => _SignupNickScreenState();
}

class _SignupNickScreenState extends State<SignupNickScreen> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: getIt<SignUpViewModel>(),
      child: BlocConsumer<SignUpViewModel, SignUpState>(
        listener: (context, state) {
          if(state.isRegister) {
            context.go(Routes.findTie.path);
          }
        },
          builder: (context, state) => Scaffold(
            appBar: DGTopBar(backgroundColor: DGColors.background.normal),
            body: Padding(
              padding: EdgeInsets.fromLTRB(24, 24, 24, 0),
              child: Column(
                spacing: 60,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text("닉네임을 정해주세요", style: DGTypography.title2Bold),
                  DGTextField(
                    icon: DGIcons.person,
                    controller: controller,

                    hintText: "닉네임을 입력해주세요.",
                    onChanged: (text) {
                      context.read<SignUpViewModel>().add(SignUpNickEdited(text));
                    },
                  ),
                  Spacer(),
                  DGButton(
                    text: "다음",
                    buttonSize: ButtonSize.large,
                    expand: true,
                    isEnabled: state.request.nickname != null && !state.isRegister,
                    onPressed: () {
                      context.read<SignUpViewModel>().add(SignUpRegister());

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
          ),
      ),
    );
  }
}
