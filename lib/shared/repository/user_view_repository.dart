import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:peritosapp/core/auth/model/user_response/user.dart';
import 'package:peritosapp/core/auth/model/user_response/user_response.dart';
import 'package:peritosapp/shared/http/http_methods.dart';

abstract class UserRepositoryProtocol {
  Future<void> getUserID();
}

final inspeccionsRepositoryProvider = Provider((ref) => UserRepositoryView(ref.read));

class UserRepositoryView extends UserRepositoryProtocol {
  late final Reader _reader;

  UserRepositoryView(this._reader) : super() {}

  /*  User getCurrentUser() {
    return UserRepo.instance.userModel;
  } */
  late final HttpMethodsType _api = _reader(apiProvider);
  Future<void> getUserID() async {
    String? idUser;

    const storage = FlutterSecureStorage();

    idUser = await storage.read(key: 'id');

    final userResponse = await _api.get("usuario/getUserID/$idUser");
    print("USERRESPONSE ${userResponse}");
  }
}
