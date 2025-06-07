import 'package:find_friends/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

GoRouter router() => GoRouter(
  initialLocation: Routes.start.path,
  debugLogDiagnostics: true,
  onException: (context, state, router) {

  },
  routes: [
    for (var item in Routes.values)
      GoRoute(
        path: item.path,
        builder: (BuildContext context, GoRouterState state) {
          return item.screen;
        },
      ),
  ],
);

