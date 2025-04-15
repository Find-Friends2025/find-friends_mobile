import 'package:find_friends/ui/core/themes/icons.dart';
import 'package:find_friends/ui/core/themes/theme.dart';
import 'package:find_friends/ui/core/ui/checkbox.dart';
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
      home: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            DGCheckbox()
          ]
        )
      )
    );
  }
}