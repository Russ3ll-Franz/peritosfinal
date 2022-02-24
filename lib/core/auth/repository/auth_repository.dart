import 'dart:async';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:peritosapp/app/state/app_start_state.dart';
import 'package:peritosapp/app/widget/app_start_page.dart';
import 'package:peritosapp/core/auth/model/user_response/user_response.dart';
import 'package:peritosapp/core/auth/state/auth_state.dart';
import 'package:peritosapp/shared/http/http_exceptions.dart';
import 'package:peritosapp/shared/http/http_methods.dart';
import 'package:peritosapp/shared/repository/user_repository.dart';
import 'package:peritosapp/shared/util/validator.dart';

abstract class AuthRepositoryProtocol {
  Future<AuthState> login(String email, String password);
  Future<AuthState> signUp(String name, String email, String password);
}

final authRepositoryProvider = Provider((ref) => AuthRepository(ref.read));

class AuthRepository implements AuthRepositoryProtocol {
  final Reader _reader;

  AuthRepository(this._reader) {}

  late final HttpMethodsType _api = _reader(apiProvider);

  @override
  Future<AuthState> login(String email, String password) async {
    final params = {
      'username': email,
      'password': password,
    };
    final loginResponse =
        await _api.post('usuario/logInApp', jsonEncode(params));
    print("loginResponses");
    print(loginResponse);

    return loginResponse.when(loading: (loading) async {
      return const AuthState.loading();
    }, success: (success) async {
      final userRepository = _reader(userRepositoryProvider);
      final userId = UserResponse.fromJson(success);
      await userRepository.saveIdUser(userId.user!.id.toString());
      print("LLEGO a AUTHSTATE");
      return const AuthState.loggedIn();
    }, error: (error) {
      return AuthState.error(error);
    });
  }

  @override
  Future<AuthState> signUp(String name, String email, String password) async {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
