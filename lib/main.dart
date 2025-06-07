import 'package:find_friends/routing/router.dart';
import 'package:find_friends/ui/core/themes/theme.dart';
import 'package:find_friends/ui/my/notice_board_screen.dart';
import 'package:find_friends/ui/signin/start_screen.dart';
import 'package:find_friends/ui/signup/widgets/screen/signup_gender_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'config/injectable_init.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  configureFirebase();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: DGTheme,
      routerConfig: router(),
    );
  }
}

void configureFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}