import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:peritosapp/app/provider/app_start_provider.dart';
import 'package:peritosapp/app/state/app_start_state.dart';
import 'package:peritosapp/core/inspeccion/model/inspeccion/inspeccion.dart';
import 'package:peritosapp/core/inspeccion/repository/inspeccion_repository.dart';
import 'package:peritosapp/core/inspeccion/state/inspeccion_state.dart';
import 'package:peritosapp/shared/http/api_response.dart';
import 'package:peritosapp/shared/http/http_exceptions.dart';
import 'package:peritosapp/shared/http/http_methods.dart';

/* final inspeccionProvider = StateNotifierProvider<InspeccionProvider, InspeccionState>((ref) {
  final appStartState = ref.watch(appStartProvider);

  return InspeccionProvider(ref.read, appStartState);
}); */

/* final inspeccionProviderFamily3 = StreamProvider<List<Inspeccion>>((ref) {
  return OrdersRepo.instance.getUpcomingOrdersStream();
});
 */

final inspeccionProviderFamily3 = FutureProvider.autoDispose.family<List<Inspeccion>, String?>((ref, tipoInspeccion) async {
  String? userID;

  const storage = FlutterSecureStorage();

  userID = await storage.read(key: 'id');
  final repository = ref.watch(inspeccionsRepositoryProvider);
  final character = await repository.fetchInspeccion2(
    userID!,
    tipoInspeccion!,
  );
  return character;
});
final inspeccionProviderFamily2 = ChangeNotifierProvider.family<InspeccionProvider2, String?>((ref, tipoInspeccion) {
  return InspeccionProvider2(ref, tipoInspeccion);
});

class InspeccionProvider2 extends ChangeNotifier {
  InspeccionProvider2(this.ref, this.tipoInspeccion) {
    fetchInspeccionesByTipo();
  }
  Ref ref;
  String? tipoInspeccion;

  late final HttpMethodsType _api = _reader(apiProvider);
  late final Reader _reader;

  fetchInspeccionesByTipo() async {
    try {
      String? userID;

      const storage = FlutterSecureStorage();

      userID = await storage.read(key: 'id');
      final response = await _api.get("operaciones/inspecciones/listAppInspeccion/$userID/$tipoInspeccion");
      if (response is APISuccess) {
        final value = response.value;
        try {
          final _inspeccions = inspeccionsFromJson(value);

          return _inspeccions;
        } catch (e) {
          return InspeccionState.error(HttpException.errorWithMessage(e.toString()));
        }
      } else if (response is APIError) {
        return InspeccionState.error(response.exception);
      } else {
        return const InspeccionState.loadInProgress();
      }
    } catch (e) {}
  }
}

final inspeccionProviderFamily = StateNotifierProvider<InspeccionProvider, InspeccionState>((ref) {
  String tipoInspeccion = "";
  return InspeccionProvider(ref.read, tipoInspeccion);
});

class InspeccionProvider extends StateNotifier<InspeccionState> {
  InspeccionProvider(this._reader, this.tipoInspeccion) : super(const InspeccionState.loadInProgress()) {
    fetchInspeccion(tipoInspeccion);
  }
  final Reader _reader;
  late final InspeccionRepository _repository = _reader(inspeccionsRepositoryProvider);
  String tipoInspeccion;

  Future<InspeccionState> fetchInspeccion(String tipoInspeccion) async {
    String? userID;

    const storage = FlutterSecureStorage();

    userID = await storage.read(key: 'id');

    final response = await _repository.fetchInspeccion(userID!, tipoInspeccion);

    if (mounted) {
      state = response;
    }
    return state;
  }
}


/*
class InspeccionProvider extends StateNotifier<InspeccionState> {
  InspeccionProvider(this._reader, this._appStartState) : super(const InspeccionState.loadInProgress()) {
    return fetchInspeccion();
  }
  final Reader _reader;
  final AppStartState _appStartState;
  late final InspeccionRepository _repository = _reader(inspeccionsRepositoryProvider);

  Future<void> _init() async {
    _appStartState.maybeWhen(
        authenticated: () async {
          fetchInspeccion("2");
        },
        orElse: () {});
  }

  Future<InspeccionState> fetchInspeccion(String tipoInspeccion) async {
    String? userID;

    const storage = FlutterSecureStorage();

    userID = await storage.read(key: 'id');

    final response = await _repository.fetchInspeccion(userID!, tipoInspeccion);

    if (mounted) {
      state = response;
    }
    return state;
  }
} */
