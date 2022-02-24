import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:peritosapp/app/provider/app_start_provider.dart';
import 'package:peritosapp/core/auth/ui/login_screen.dart';
import 'package:peritosapp/core/home_menu/ui/menu_screen.dart';
import 'package:peritosapp/shared/widget/loading_widget.dart';

class AppStartPage extends ConsumerWidget {
  const AppStartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(appStartProvider);
    print("INICIO APP START");
    print(state);

    return state.maybeWhen(
      initial: () => const LoadingWidget(),
      authenticated: () => const MenuScreen(),
      unauthenticated: () => LoginScreen(),
      orElse: () => const LoadingWidget(),
    );
  }
}
