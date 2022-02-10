import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:peritosapp/shared/http/http_exceptions.dart';
part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.loggedIn() = _LoggedIn;
  const factory AuthState.error(HttpException error) = _Error;
}
