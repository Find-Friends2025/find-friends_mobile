import 'package:find_friends/config/injectable_init.dart';
import 'package:find_friends/routing/routes.dart';
import 'package:find_friends/ui/core/themes/colors.dart';
import 'package:find_friends/ui/core/themes/icons.dart';
import 'package:find_friends/ui/core/themes/typography.dart';
import 'package:find_friends/ui/core/ui/button.dart';
import 'package:find_friends/ui/core/ui/clickable.dart';
import 'package:find_friends/ui/core/ui/topbar.dart';
import 'package:find_friends/ui/signup/models/sign_up_event.dart';
import 'package:find_friends/ui/signup/models/sign_up_state.dart';
import 'package:find_friends/ui/signup/view_model/sign_up_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignupMeetScreen extends StatefulWidget {
  const SignupMeetScreen({super.key});

  @override
  State<SignupMeetScreen> createState() => _SignupMeetScreenState();
}

class _SignupMeetScreenState extends State<SignupMeetScreen> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> routerState = GoRouterState.of(context).extra as Map<String, dynamic>;
    return BlocProvider.value(
      value: getIt<SignUpViewModel>()..add(SignUpUidEdited(routerState["uid"], routerState["xToken"])),
      child: BlocBuilder<SignUpViewModel, SignUpState>(
          builder: (context, state) => Scaffold(
            appBar: DGTopBar(
              backgroundColor: DGColors.background.normal,
              leading: Container(),
            ),
            body: SafeArea(
                child: Padding(
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
                              context.read<SignUpViewModel>().add(SignUpGetPermission());
                              context.push(Routes.signupSecond.path);
                            }),

                        SizedBox(height: 8),

                        DGButton(

                            text: "거부합니다",
                            buttonSize: ButtonSize.large,
                            expand: true,
                            color: DGColors.static.negative,
                            onPressed: () {
                              print(routerState);
                              print("${state.xToken}, ${state.request.toJson()}");
                              context.push(Routes.signupSecond.path);
                            })

                      ],
                    )
                )
            ),
          )
      ),
    );

  }
}