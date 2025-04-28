import 'package:find_friends/ui/core/themes/icons.dart';
import 'package:find_friends/ui/core/themes/theme.dart';
import 'package:find_friends/ui/core/ui/checkbox.dart';
import 'package:find_friends/ui/core/ui/topbar.dart';
import 'package:find_friends/ui/signin/widgets/screen/code_send_screen.dart';
import 'package:find_friends/ui/signin/widgets/screen/start_screen.dart';
import 'package:find_friends/ui/signin/widgets/screen/terms_screen.dart';
import 'package:find_friends/ui/signin/widgets/screen/verify_screen.dart';
import 'package:find_friends/ui/signup/widgets/screen/signup_birth_screen.dart';
import 'package:find_friends/ui/signup/widgets/screen/signup_gender_screen.dart';
import 'package:find_friends/ui/signup/widgets/screen/signup_nick_screen.dart';
import 'package:find_friends/ui/signup/widgets/screen/signup_residence_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: DGTheme,
      home: SignupNickScreen(),
    );
  }
}
