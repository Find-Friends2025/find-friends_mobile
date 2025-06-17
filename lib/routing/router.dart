import 'package:find_friends/config/injectable_init.dart';
import 'package:find_friends/data/core/storage/token_storage.dart';
import 'package:find_friends/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

GoRouter router() => GoRouter(
  initialLocation: Routes.start.path,
  debugLogDiagnostics: true,
  onException: (context, state, router) {},
  redirect: (context, state) async {
    final tokenStorage = getIt<TokenStorage>();
    final token = await tokenStorage.get();


    if (state.fullPath == Routes.start.path && token != null) {
      return Routes.findTie.path;
    }
    return null;
  },
  routes: [
    for (var item in Routes.values)
      GoRoute(
        path: item.path,
        pageBuilder: (BuildContext context, GoRouterState state) {
          switch (item) {
            case Routes.start:
            case Routes.findTie:
            case Routes.like:
            case Routes.chat:
            case Routes.my:
              return NoTransitionPage(child: item.screen);
            default:
              return CustomTransitionPage(
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) =>
                        SlideTransition(
                            position: animation.drive(
                              Tween<Offset>(
                                begin: Offset(0.75, 0),
                                end: Offset.zero,
                              ).chain(CurveTween(curve: Curves.linear))),
                          child: child,
                        ),
                child: item.screen,
              );
          }
        },
      ),
  ],
);
