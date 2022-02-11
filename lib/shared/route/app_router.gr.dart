// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../../app/widget/app_start_page.dart' as _i1;
import '../../core/auth/ui/login_screen.dart' as _i2;
import '../../core/auth/ui/register_screen.dart' as _i3;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    AppStartRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.AppStartPage());
    },
    LoginScreen.name: (routeData) {
      final args = routeData.argsAs<LoginScreenArgs>(
          orElse: () => const LoginScreenArgs());
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.LoginScreen(key: args.key));
    },
    RegisterScreen.name: (routeData) {
      final args = routeData.argsAs<RegisterScreenArgs>(
          orElse: () => const RegisterScreenArgs());
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.RegisterScreen(key: args.key));
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(AppStartRoute.name, path: '/'),
        _i4.RouteConfig(LoginScreen.name, path: '/signIn'),
        _i4.RouteConfig(RegisterScreen.name, path: '/signUp')
      ];
}

/// generated route for
/// [_i1.AppStartPage]
class AppStartRoute extends _i4.PageRouteInfo<void> {
  const AppStartRoute() : super(AppStartRoute.name, path: '/');

  static const String name = 'AppStartRoute';
}

/// generated route for
/// [_i2.LoginScreen]
class LoginScreen extends _i4.PageRouteInfo<LoginScreenArgs> {
  LoginScreen({_i5.Key? key})
      : super(LoginScreen.name,
            path: '/signIn', args: LoginScreenArgs(key: key));

  static const String name = 'LoginScreen';
}

class LoginScreenArgs {
  const LoginScreenArgs({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return 'LoginScreenArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.RegisterScreen]
class RegisterScreen extends _i4.PageRouteInfo<RegisterScreenArgs> {
  RegisterScreen({_i5.Key? key})
      : super(RegisterScreen.name,
            path: '/signUp', args: RegisterScreenArgs(key: key));

  static const String name = 'RegisterScreen';
}

class RegisterScreenArgs {
  const RegisterScreenArgs({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return 'RegisterScreenArgs{key: $key}';
  }
}
