import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:peritosapp/core/home_menu/state/home_state.dart';
import 'package:peritosapp/shared/repository/user_repository.dart';

final homeProvider = StateNotifierProvider<HomeProvider, HomeState>((ref) {
  return HomeProvider(ref.read);
});

class HomeProvider extends StateNotifier<HomeState> {
  HomeProvider(this._reader) : super(const HomeState.loading()) {}
  final Reader _reader;

  late final UserRepository _userRepository = _reader(userRepositoryProvider);

  Future<void> logout() async {
    await _userRepository.remove();
    state = const HomeState.loggedOut();
  }
}
