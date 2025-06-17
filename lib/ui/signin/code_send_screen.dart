import 'package:find_friends/config/injectable_init.dart';
import 'package:find_friends/data/firebase/repository/firebase_repository_impl.dart';
import 'package:find_friends/routing/routes.dart';
import 'package:find_friends/ui/core/themes/colors.dart';
import 'package:find_friends/ui/core/themes/icons.dart';
import 'package:find_friends/ui/core/themes/typography.dart';
import 'package:find_friends/ui/core/ui/button.dart';
import 'package:find_friends/ui/core/ui/textfield.dart';
import 'package:find_friends/ui/core/ui/topbar.dart';
import 'package:find_friends/ui/signin/verify_screen.dart';
import 'package:find_friends/ui/signin/view_model/sign_in_event.dart';
import 'package:find_friends/ui/signin/view_model/sign_in_state.dart';
import 'package:find_friends/ui/signin/view_model/sign_in_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CodeSendScreen extends StatefulWidget {
  const CodeSendScreen({super.key});

  @override
  State<CodeSendScreen> createState() => _CodeSendScreenState();
}

class _CodeSendScreenState extends State<CodeSendScreen> {
  TextEditingController controller = TextEditingController();

  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();


    controller.addListener(() {
      if (isButtonEnabled == controller.text.isNotEmpty) {
        return;
      }
      setState(() {
        isButtonEnabled = controller.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<SignInViewModel>(),
      child: BlocConsumer<SignInViewModel, SignInState>(
          listener: (context, state) {
            if(state.isSuccess) {
              context.push(Routes.verify.path);
              context.read<SignInViewModel>().add(SignInInit());
            }
          },
          builder: (context, state) => Scaffold(
            backgroundColor: DGColors.background.normal,
            appBar: DGTopBar(
              backgroundColor: DGColors.background.normal,
              title: Text(
                "전화번호 인증",
                style: DGTypography.headline2Bold.copyWith(
                  color: DGColors.label.strong,
                ),
              ),
            ),
            body: SafeArea(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: 40),
                    DGTextField(
                      controller: controller,
                      hintText: "전화번호를 입력해주세요.",
                      icon: DGIcons.phone,
                      iconColor: DGColors.primary,
                      fieldType: TextInputType.number,
                      onChanged: (phoneNum) {
                        context.read<SignInViewModel>().add(SignInPhoneNumEdited(phoneNum));
                      },
                    ),
                    Expanded(child: SizedBox()),
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
                            text: "인증번호 전송",
                            buttonSize: ButtonSize.large,
                            onPressed: () {
                              context.read<SignInViewModel>().add(SignInSubmitted());
                            },
                            isEnabled: isButtonEnabled,
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
          )
      )
    );
  }
}
