import 'package:find_friends/config/injectable_init.dart';
import 'package:find_friends/data/core/storage/token_storage.dart';
import 'package:find_friends/routing/router.dart';
import 'package:find_friends/routing/routes.dart';
import 'package:find_friends/ui/core/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  configureFirebase();
  runApp(const MyApp());
}

final defaultRouter = router();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: DGTheme,
      routerConfig: defaultRouter,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [
        const Locale("ko", "KR"),
        const Locale("en", "US")
      ],
    );
  }
}

void configureFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

void goDefaultPage() {
  defaultRouter.go(Routes.start.path);
}