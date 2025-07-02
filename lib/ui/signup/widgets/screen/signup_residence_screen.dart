import 'package:find_friends/config/injectable_init.dart';
import 'package:find_friends/domain/enums/gender.dart';
import 'package:find_friends/domain/enums/residence.dart';
import 'package:find_friends/routing/routes.dart';
import 'package:find_friends/ui/core/themes/colors.dart';
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

class SignupResidenceScreen extends StatelessWidget {
  const SignupResidenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: getIt<SignUpViewModel>(),
      child: BlocBuilder<SignUpViewModel, SignUpState>(
          builder: (context, state) => Scaffold(
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
                        children: List.generate(Residence.values.length, (i) {
                          Residence item = Residence.values[i];
                          return DGClickable(
                            onPressed: () {
                              context.read<SignUpViewModel>().add(SignUpResidenceEdited(item.alias));
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: state.request.location == item.alias ? DGColors.primary : DGColors.label.disable),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                item.alias,
                                style: DGTypography.headline2Medium.copyWith(
                                  color: state.request.location == item.alias ? DGColors.primary : DGColors.label.disable,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                  DGButton(
                    text: "다음",
                    buttonSize: ButtonSize.large,
                    expand: true,
                    isEnabled: state.request.location != null,
                    onPressed: () {
                      print(state.request.toJson());
                      context.push(Routes.signupFifth.path);
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
          )
      ),
    );
  }
}
