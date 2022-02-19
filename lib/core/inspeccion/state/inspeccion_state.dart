import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:peritosapp/core/inspeccion/model/inspeccion/inspeccion.dart';
import 'package:peritosapp/shared/http/http_exceptions.dart';

part 'inspeccion_state.freezed.dart';

@freezed
class InspeccionState with _$InspeccionState {
  const factory InspeccionState.initial() = _Initial;
  const factory InspeccionState.loadInProgress() = _LoadInProgress;
  const factory InspeccionState.inspeccionLoaded(List<Inspeccion> tipoInspeccions) = _Loaded;
  const factory InspeccionState.error(HttpException error) = _Error;
}
