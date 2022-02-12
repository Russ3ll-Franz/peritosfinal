import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:peritosapp/app/widget/app_start_page.dart';
import 'package:peritosapp/core/auth/ui/routes.dart';
import 'package:peritosapp/core/home_menu/ui/routes.dart';

class AppRouteObserver extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {}
}

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: <AutoRoute>[
  AutoRoute(page: AppStartPage, initial: true),
  homeRouter,
  signInRouter,
  signUpRouter
])
class $AppRouter {}
