import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:peritosapp/app/state/app_start_state.dart';
import 'package:peritosapp/core/auth/provider/auth_provider.dart';
import 'package:peritosapp/core/auth/state/auth_state.dart';
import 'package:peritosapp/core/home_menu/provider/home_provider.dart';
import 'package:peritosapp/core/home_menu/state/home_state.dart';
import 'package:peritosapp/shared/repository/user_repository.dart';

final appStartProvider = StateNotifierProvider<AppStartNotifier, AppStartState>((ref) {
  final loginState = ref.watch(authProvider);
  final homeState = ref.watch(homeProvider);

  late AppStartState appStartState;
  appStartState = loginState is AppAuthenticated ? const AppStartState.authenticated() : const AppStartState.initial();

  return AppStartNotifier(appStartState, ref.read, loginState, homeState);
});

class AppStartNotifier extends StateNotifier<AppStartState> {
  AppStartNotifier(AppStartState appStartState, this._reader, this._authState, this._homeState) : super(appStartState) {
    _init();
  }

  late final UserRepository _userRepository = _reader(userRepositoryProvider);
  final AuthState _authState;
  final HomeState _homeState;
  final Reader _reader;

  Future<void> _init() async {
    _authState.maybeWhen(
        loggedIn: () {
          state = const AppStartState.authenticated();
        },
        orElse: () {});

    _homeState.maybeWhen(
        loggedOut: () {
          state = const AppStartState.unauthenticated();
        },
        orElse: () {});

    final token = await _userRepository.fetchUserId();
    print("Usuario START PROVIDER");
    print(token);
    if (token != null) {
      if (mounted) {
        state = const AppStartState.authenticated();
      }
    } else {
      if (mounted) {
        state = const AppStartState.unauthenticated();
      }
    }
  }
}
