import 'package:find_friends/config/injectable_init.dart';
import 'package:find_friends/data/auth/models/register_request.dart';
import 'package:find_friends/domain/enums/gender.dart';
import 'package:find_friends/routing/routes.dart';
import 'package:find_friends/ui/core/themes/colors.dart';
import 'package:find_friends/ui/core/themes/typography.dart';
import 'package:find_friends/ui/core/ui/button.dart';
import 'package:find_friends/ui/core/ui/checkbox.dart';
import 'package:find_friends/ui/core/ui/textfield.dart';
import 'package:find_friends/ui/core/ui/topbar.dart';
import 'package:find_friends/ui/signup/models/sign_up_event.dart';
import 'package:find_friends/ui/signup/models/sign_up_state.dart';
import 'package:find_friends/ui/signup/view_model/sign_up_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignupGenderScreen extends StatefulWidget {
  const SignupGenderScreen({super.key});

  @override
  State<SignupGenderScreen> createState() => _SignupGenderScreenState();
}

class _SignupGenderScreenState extends State<SignupGenderScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<SignUpViewModel>(),
      child: BlocBuilder<SignUpViewModel, SignUpState>(
          builder: (context, state) => Scaffold(

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
                                  isToggled: state.request.gender == gender.name,
                                  onTap: (_) {
                                    context.read<SignUpViewModel>().add(SignUpGenderEdited(gender.name));
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
                    onPressed: () {
                      context.push(Routes.signupThird.path);

                    },
                    isEnabled: state.request.gender != null
                  ),
                ],
              ),
            ),
            bottomNavigationBar: BottomAppBar(
              elevation: 0.0,
              color: DGColors.static.white,
              height: 0,
            ),
          )
      ),
    );
  }
}
