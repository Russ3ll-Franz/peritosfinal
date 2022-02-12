import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:peritosapp/data/model/user/response/user_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user/user.dart';

abstract class TokenRepositoryProtocol {
  Future<void> remove();
  Future<void> saveIdUser(String user);
  Future<String?> fetchUserId();
}

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepository(ref.read);
});

class UserRepository implements TokenRepositoryProtocol {
  UserRepository(this._reader) {}
  final Reader _reader;
  User? _user;
  @override
  Future<String?> fetchUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      final idUserValue = prefs.getString('id');

      return idUserValue;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> remove() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('id');
  }

  @override
  Future<void> saveIdUser(String idUser) async {
    final prefs = await SharedPreferences.getInstance();
    print("SAVE ID USER");
    print(idUser);

    try {
      await prefs.setString('id', idUser);
    } on Exception catch (e) {}
  }
}
