import 'dart:async';
import 'package:find_friends/config/injectable_init.dart';
import 'package:find_friends/data/firebase/repository/firebase_repository_impl.dart';
import 'package:find_friends/routing/routes.dart';
import 'package:find_friends/ui/core/themes/colors.dart';
import 'package:find_friends/ui/core/themes/typography.dart';
import 'package:find_friends/ui/core/ui/clickable.dart';
import 'package:find_friends/ui/core/ui/topbar.dart';
import 'package:find_friends/ui/signin/view_model/sign_in_event.dart';
import 'package:find_friends/ui/signin/view_model/sign_in_state.dart';
import 'package:find_friends/ui/signin/view_model/sign_in_view_model.dart';
import 'package:find_friends/ui/signin/widgets/verify_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../core/ui/button.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  int remainingSeconds = 60;
  Timer? timer;
  TextEditingController controller = TextEditingController();

  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    startCountdown();
    controller.addListener(() {
      setState(() {
        isButtonEnabled = controller.text.length == 6;
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startCountdown() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      if (remainingSeconds == 0) {
        t.cancel();
      } else {
        setState(() {
          remainingSeconds--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => getIt<SignInViewModel>(),
      child: BlocConsumer<SignInViewModel, SignInState>(
        listener: (context, state) {
          if (state.isVerify) {
            GoRouter.of(context).go(Routes.findTie.path);
          }
        },
        builder:
            (context, state) => Scaffold(
              appBar: DGTopBar(
                title: Text(
                  "인증코드",
                  style: DGTypography.headline2Bold.copyWith(
                    color: DGColors.label.strong,
                  ),
                ),
              ),
              body: Center(
                child: Column(
                  children: [
                    SizedBox(height: 140),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: VerifyTextField(
                        controller: controller,
                        onChanged: (value) {
                          context.read<SignInViewModel>().add(SignInSmsCodeEdited(value));
                        },
                        onCompleted: (value) {},
                      ),
                    ),
                    this.remainingSeconds != 0
                        ? Text(
                          "${this.remainingSeconds}초 후에 재전송",
                          style: DGTypography.labelRegular.copyWith(
                            color: DGColors.label.strong,
                          ),
                        )
                        : DGClickable(
                          onPressed: () {
                            this.timer?.cancel();
                            setState(() {
                              this.remainingSeconds = 60;
                            });
                            startCountdown();
                          },
                          child: Text(
                            "재전송 하기",
                            style: DGTypography.labelRegular.copyWith(
                              color: DGColors.primary,
                            ),
                          ),
                        ),
                    Expanded(child: Container()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Text(
                            "‘전화번호 인증’ 버튼을 탭하면 서비스 약관 및 개인정보 처리방침에 동의하는 것으로 간주됩니다. SMS가 발송될 수 있으며, 메시지 및 데이터 요금이 부과될 수 있습니다.",
                            style: DGTypography.labelRegular.copyWith(
                              color: DGColors.label.assistive,
                            ),
                          ),
                          SizedBox(height: 20),
                          DGButton(
                            text: "인증하기",
                            buttonSize: ButtonSize.large,
                            onPressed: () {
                              context.read<SignInViewModel>().add(SignInVerify());
                            },
                            isEnabled: isButtonEnabled && !state.isLogin,
                            expand: true,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 45),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}
