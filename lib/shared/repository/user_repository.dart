import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user/user.dart';

abstract class TokenRepositoryProtocol {
  Future<void> remove();
  Future<void> saveIdUser(User user);
  Future<User?> fetchUserId();
}

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepository(ref.read);
});

class UserRepository implements TokenRepositoryProtocol {
  UserRepository(this._reader) {}
  final Reader _reader;
  User? _user;
  @override
  Future<User?> fetchUserId() async {
    String? idUserValue;
    final prefs = await SharedPreferences.getInstance();
    idUserValue = prefs.getString(_user!.id);
    print(idUserValue);
    try {
      if (idUserValue != null) {
        _user = userFromJson(idUserValue);
      }
    } on Exception catch (e) {
      return _user;
    }

    return _user;
  }

  @override
  Future<void> remove() async {
    _user = null;
    print(_user);
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_user!.id.toString());
  }

  @override
  Future<void> saveIdUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    _user = user;

    if (_user != null) {
      try {
        await prefs.setString(_user!.id, _user!.id);
      } on Exception catch (e) {}
    }
  }
}
