import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:peritosapp/app/provider/app_start_provider.dart';
import 'package:peritosapp/router/app_router.gr.dart';
import 'package:peritosapp/shared/widget/loading_widget.dart';

class AppStartPage extends ConsumerWidget {
  const AppStartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(appStartProvider);

    return state.maybeWhen(
      initial: () => const LoadingWidget(),
      authenticated: () => MenuScreen(),
      unauthenticated: () => LoginScreen(),
/*       internetUnAvailable: () => const ConnectionUnavailableWidget(),
 */
      orElse: () => const LoadingWidget(),
    );
  }
}
