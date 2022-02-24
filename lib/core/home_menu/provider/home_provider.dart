// ignore_for_file: empty_constructor_bodies

import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:peritosapp/app/state/app_start_state.dart';
import 'package:peritosapp/core/home_menu/state/home_state.dart';
import 'package:peritosapp/core/inspeccion/repository/inspeccion_repository.dart';
import 'package:peritosapp/shared/repository/user_repository.dart';

final homeProvider = StateNotifierProvider<HomeProvider, HomeState>((ref) {
  return HomeProvider(ref.read);
});

class HomeProvider extends StateNotifier<HomeState> {
  HomeProvider(this._reader) : super(const HomeState.loading()) {}
  final Reader _reader;

  final _controller = StreamController<AppStartState>();

  late final UserRepository _userRepository = _reader(userRepositoryProvider);
  late final InspeccionRepository _inspeccionRepository =
      _reader(inspeccionsRepositoryProvider);

  Future<void> logout() async {
    await _userRepository.remove();
    _controller.add(const AppStartState.unauthenticated());

    state = const HomeState.loggedOut();
  }

  Future<void> inspeccionByTipoTasacion(String tipoInspeccion) async {
    String? idUsuario;

    const storage = FlutterSecureStorage();

    idUsuario = await storage.read(key: 'id');
    final response =
        await _inspeccionRepository.fetchInspeccion(idUsuario!, tipoInspeccion);
    if (mounted) {
      state = response as HomeState;
    }
  }
}
  /*  @override
  void dispose() {
    return super.dispose();
  } */

