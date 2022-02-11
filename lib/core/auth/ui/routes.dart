import 'package:auto_route/auto_route.dart';
import 'package:peritosapp/core/auth/ui/login_screen.dart';
import 'package:peritosapp/core/auth/ui/register_screen.dart';

const signInRouter = AutoRoute(
  path: '/signIn',
  page: LoginScreen,
);

const signUpRouter = AutoRoute(path: '/signUp', page: RegisterScreen);
