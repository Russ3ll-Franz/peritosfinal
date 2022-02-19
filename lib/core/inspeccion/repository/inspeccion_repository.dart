import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:peritosapp/core/inspeccion/model/inspeccion/inspeccion.dart';
import 'package:peritosapp/core/inspeccion/state/inspeccion_state.dart';
import 'package:peritosapp/shared/http/api_response.dart';
import 'package:peritosapp/shared/http/http_exceptions.dart';
import 'package:peritosapp/shared/http/http_methods.dart';

abstract class InspeccionsRepositoryProtocol {
  Future<InspeccionState> fetchInspeccion(String userID, String tipoInspeccion);
}

final inspeccionsRepositoryProvider = Provider((ref) => InspeccionRepository(ref.read));

class InspeccionRepository implements InspeccionsRepositoryProtocol {
  InspeccionRepository(this._reader) {}

  late final HttpMethodsType _api = _reader(apiProvider);

  final Reader _reader;
  late StreamController _inspeccionListController;

  StreamSink get inspeccionListSink => _inspeccionListController.sink;
  Stream get inspeccionListStream => _inspeccionListController.stream;
  @override
  Future<InspeccionState> fetchInspeccion(String userID, String tipoInspeccion) async {
    final response = await _api.get("operaciones/inspecciones/listAppInspeccion/$userID/$tipoInspeccion");
    print("MI FETCHiNSPECCION");
    print(response.toString());

    response.when(
        loading: (loading) {},
        success: (success) {},
        error: (error) {
          return InspeccionState.error(error);
        });

    if (response is APISuccess) {
      final value = response.value;
      try {
        final _inspeccions = inspeccionsFromJson(value);

        return InspeccionState.inspeccionLoaded(_inspeccions);
      } catch (e) {
        return InspeccionState.error(HttpException.errorWithMessage(e.toString()));
      }
    } else if (response is APIError) {
      return InspeccionState.error(response.exception);
    } else {
      return const InspeccionState.loadInProgress();
    }
  }

  fetchInspeccion2(String userID, String tipoInspeccion) async {
    final response = await _api.get("operaciones/inspecciones/listAppInspeccion/$userID/$tipoInspeccion");
    if (response is APISuccess) {
      final value = response.value;
      final _inspeccions = inspeccionsFromJson(value);

      return _inspeccions;
    }
  }
}
