// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../../app/widget/app_start_page.dart' as _i1;
import '../../core/auth/ui/login_screen.dart' as _i4;
import '../../core/auth/ui/register_screen.dart' as _i5;
import '../../core/home_menu/ui/menu_screen.dart' as _i2;
import '../../core/inspeccion/ui/inspeccion_screen.dart' as _i3;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    AppStartPage.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.AppStartPage());
    },
    MenuRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.MenuScreen());
    },
    InspeccionRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<InspeccionRouteArgs>(
          orElse: () => InspeccionRouteArgs(
              tipoInspeccionId: pathParams.getString('tipoInspeccionId')));
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.InspeccionScreen(
              key: args.key, tipoInspeccionId: args.tipoInspeccionId));
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: _i4.LoginScreen(key: args.key));
    },
    RegisterRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterRouteArgs>(
          orElse: () => const RegisterRouteArgs());
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: _i5.RegisterScreen(key: args.key));
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(AppStartPage.name, path: '/'),
        _i6.RouteConfig(MenuRoute.name, path: '/home'),
        _i6.RouteConfig(InspeccionRoute.name,
            path: '/inspeccion/:tipoInspeccionId'),
        _i6.RouteConfig(LoginRoute.name, path: '/signIn'),
        _i6.RouteConfig(RegisterRoute.name, path: '/signUp')
      ];
}

/// generated route for
/// [_i1.AppStartPage]
class AppStartPage extends _i6.PageRouteInfo<void> {
  const AppStartPage() : super(AppStartPage.name, path: '/');

  static const String name = 'AppStartPage';
}

/// generated route for
/// [_i2.MenuScreen]
class MenuRoute extends _i6.PageRouteInfo<void> {
  const MenuRoute() : super(MenuRoute.name, path: '/home');

  static const String name = 'MenuRoute';
}

/// generated route for
/// [_i3.InspeccionScreen]
class InspeccionRoute extends _i6.PageRouteInfo<InspeccionRouteArgs> {
  InspeccionRoute({_i7.Key? key, required String tipoInspeccionId})
      : super(InspeccionRoute.name,
            path: '/inspeccion/:tipoInspeccionId',
            args: InspeccionRouteArgs(
                key: key, tipoInspeccionId: tipoInspeccionId),
            rawPathParams: {'tipoInspeccionId': tipoInspeccionId});

  static const String name = 'InspeccionRoute';
}

class InspeccionRouteArgs {
  const InspeccionRouteArgs({this.key, required this.tipoInspeccionId});

  final _i7.Key? key;

  final String tipoInspeccionId;

  @override
  String toString() {
    return 'InspeccionRouteArgs{key: $key, tipoInspeccionId: $tipoInspeccionId}';
  }
}

/// generated route for
/// [_i4.LoginScreen]
class LoginRoute extends _i6.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({_i7.Key? key})
      : super(LoginRoute.name, path: '/signIn', args: LoginRouteArgs(key: key));

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i7.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.RegisterScreen]
class RegisterRoute extends _i6.PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({_i7.Key? key})
      : super(RegisterRoute.name,
            path: '/signUp', args: RegisterRouteArgs(key: key));

  static const String name = 'RegisterRoute';
}

class RegisterRouteArgs {
  const RegisterRouteArgs({this.key});

  final _i7.Key? key;

  @override
  String toString() {
    return 'RegisterRouteArgs{key: $key}';
  }
}
