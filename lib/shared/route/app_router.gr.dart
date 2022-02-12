// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../../app/widget/app_start_page.dart' as _i1;
import '../../core/auth/ui/login_screen.dart' as _i3;
import '../../core/auth/ui/register_screen.dart' as _i4;
import '../../core/home_menu/ui/menu_screen.dart' as _i2;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    AppStartRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.AppStartPage());
    },
    MenuScreen.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.MenuScreen());
    },
    LoginScreen.name: (routeData) {
      final args = routeData.argsAs<LoginScreenArgs>(
          orElse: () => const LoginScreenArgs());
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.LoginScreen(key: args.key));
    },
    RegisterScreen.name: (routeData) {
      final args = routeData.argsAs<RegisterScreenArgs>(
          orElse: () => const RegisterScreenArgs());
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: _i4.RegisterScreen(key: args.key));
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(AppStartRoute.name, path: '/'),
        _i5.RouteConfig(MenuScreen.name, path: '/home'),
        _i5.RouteConfig(LoginScreen.name, path: '/signIn'),
        _i5.RouteConfig(RegisterScreen.name, path: '/signUp')
      ];
}

/// generated route for
/// [_i1.AppStartPage]
class AppStartRoute extends _i5.PageRouteInfo<void> {
  const AppStartRoute() : super(AppStartRoute.name, path: '/');

  static const String name = 'AppStartRoute';
}

/// generated route for
/// [_i2.MenuScreen]
class MenuScreen extends _i5.PageRouteInfo<void> {
  const MenuScreen() : super(MenuScreen.name, path: '/home');

  static const String name = 'MenuScreen';
}

/// generated route for
/// [_i3.LoginScreen]
class LoginScreen extends _i5.PageRouteInfo<LoginScreenArgs> {
  LoginScreen({_i6.Key? key})
      : super(LoginScreen.name,
            path: '/signIn', args: LoginScreenArgs(key: key));

  static const String name = 'LoginScreen';
}

class LoginScreenArgs {
  const LoginScreenArgs({this.key});

  final _i6.Key? key;

  @override
  String toString() {
    return 'LoginScreenArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.RegisterScreen]
class RegisterScreen extends _i5.PageRouteInfo<RegisterScreenArgs> {
  RegisterScreen({_i6.Key? key})
      : super(RegisterScreen.name,
            path: '/signUp', args: RegisterScreenArgs(key: key));

  static const String name = 'RegisterScreen';
}

class RegisterScreenArgs {
  const RegisterScreenArgs({this.key});

  final _i6.Key? key;

  @override
  String toString() {
    return 'RegisterScreenArgs{key: $key}';
  }
}
