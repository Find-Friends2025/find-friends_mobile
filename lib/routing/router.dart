import 'package:find_friends/routing/routes.dart';
import 'package:find_friends/ui/findtie/find_tie_screen.dart';
import 'package:find_friends/ui/profilepicture/profile_picture_screen.dart';
import 'package:find_friends/ui/signin/widgets/screen/code_send_screen.dart';
import 'package:find_friends/ui/signin/widgets/screen/start_screen.dart';
import 'package:find_friends/ui/signin/widgets/screen/terms_screen.dart';
import 'package:find_friends/ui/signin/widgets/screen/verify_screen.dart';
import 'package:find_friends/ui/signup/widgets/screen/signup_birth_screen.dart';
import 'package:find_friends/ui/signup/widgets/screen/signup_gender_screen.dart';
import 'package:find_friends/ui/signup/widgets/screen/signup_meet_screen.dart';
import 'package:find_friends/ui/signup/widgets/screen/signup_nick_screen.dart';
import 'package:find_friends/ui/signup/widgets/screen/signup_residence_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

GoRouter router() => GoRouter(
  initialLocation: Routes.findTie.name,
  debugLogDiagnostics: true,
  redirect: _redirect,
  routes: [
    for (var item in Routes.values)
      GoRoute(
        path: item.name,
        builder: (BuildContext context, GoRouterState state) {
          return item.screen;
        },
      ),
  ],
);

Future<String?> _redirect(BuildContext context, GoRouterState state) async {
  final loggedIn = false;
  final loggingIn = state.matchedLocation == Routes.start.name;
  if (!loggedIn) {
    return Routes.start.name;
  }

  if (loggingIn) {
    return Routes.findTie.name;
  }

  return null;
}
