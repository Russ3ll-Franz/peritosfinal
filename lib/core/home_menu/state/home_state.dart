import 'package:freezed_annotation/freezed_annotation.dart';

import '../../inspeccion/model/inspeccion/inspeccion.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.loading() = _Loading;
  const factory HomeState.loggedOut() = _LoggedOut;
  const factory HomeState.inspeccionLoaded(List<Inspeccion> tipoInspeccions) = _Loaded;
}
