import 'package:find_friends/config/injectable_init.dart';
import 'package:find_friends/routing/routes.dart';
import 'package:find_friends/ui/core/themes/colors.dart';
import 'package:find_friends/ui/core/themes/icons.dart';
import 'package:find_friends/ui/core/themes/typography.dart';
import 'package:find_friends/ui/core/ui/button.dart';
import 'package:find_friends/ui/core/ui/clickable.dart';
import 'package:find_friends/ui/core/ui/textfield.dart';
import 'package:find_friends/ui/core/ui/topbar.dart';
import 'package:find_friends/ui/signup/models/sign_up_event.dart';
import 'package:find_friends/ui/signup/models/sign_up_state.dart';
import 'package:find_friends/ui/signup/view_model/sign_up_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignupBirthScreen extends StatefulWidget {
  const SignupBirthScreen({super.key});

  @override
  State<SignupBirthScreen> createState() => _SignupBirthScreenState();
}

class _SignupBirthScreenState extends State<SignupBirthScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<SignUpViewModel>(),
      child: BlocBuilder<SignUpViewModel, SignUpState>(
        builder:
            (context, state) => Scaffold(
              appBar: DGTopBar(backgroundColor: DGColors.background.normal),
              body: Padding(
                padding: EdgeInsets.fromLTRB(24, 24, 24, 0),
                child: Column(
                  spacing: 56,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text("생년월일을 확인해 주세요", style: DGTypography.title2Bold),
                    DGClickable(
                      onPressed: () {
                        showDatePicker(
                          context: context,
                          builder: (context, child) {
                            return Theme(
                              data: Theme.of(context).copyWith(
                                colorScheme: ColorScheme.light(
                                  primary: DGColors.primary,
                                  onPrimary: DGColors.label.normal,
                                  onSurface: DGColors.label.normal,
                                ),
                              ),
                              child: child!,
                            );
                          },
                          initialDate: state.birthDate,
                          initialDatePickerMode: DatePickerMode.day,
                          firstDate: DateTime.utc(1900),
                          lastDate: DateTime.now(),
                          locale: const Locale('ko', 'KR')
                        ).then((selectedDate) {
                          if (mounted) {
                            if (selectedDate == null) {
                              return;
                            }

                            print(selectedDate);

                            context.read<SignUpViewModel>().add(
                              SignUpBirthEdited(selectedDate),
                            );
                          }
                        });
                      },
                      child: IgnorePointer(
                        child: DGTextField(
                          controller: TextEditingController(),
                          hintText: state.request.birth ?? "생년월일을 입력해주세요.",
                          icon: DGIcons.calendar,
                        ),
                      ),
                    ),
                    Spacer(),
                    DGButton(
                      text: "다음",
                      buttonSize: ButtonSize.large,
                      expand: true,
                      isEnabled: state.birthDate != null,
                      onPressed: () {
                        context.push(Routes.signupFourth.path);
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
