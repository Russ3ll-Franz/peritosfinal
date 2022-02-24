import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:peritosapp/shared/util/platform_type.dart';

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
  late final PlatformType _platform = _reader(platformTypeProvider);

  final Reader _reader;
  User? _user;
  @override
  Future<String?> fetchUserId() async {
    String? idValue;

    if (_platform == PlatformType.iOS ||
        _platform == PlatformType.android ||
        _platform == PlatformType.linux) {
      const storage = FlutterSecureStorage();
      idValue = await storage.read(key: 'id');
    } else {
      final prefs = await SharedPreferences.getInstance();
      idValue = prefs.getString('id');
    }
    try {
      if (idValue != null) return idValue;
    } catch (e) {
      rethrow;
    }
    return idValue;
  }

  @override
  Future<void> remove() async {
    if (_platform == PlatformType.iOS ||
        _platform == PlatformType.android ||
        _platform == PlatformType.linux) {
      const storage = FlutterSecureStorage();
      try {
        await storage.delete(key: 'id');
      } on Exception catch (e) {}
    }
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('id');
  }

  @override
  Future<void> saveIdUser(String idUser) async {
    final prefs = await SharedPreferences.getInstance();
    if (_platform == PlatformType.iOS ||
        _platform == PlatformType.android ||
        _platform == PlatformType.linux) {
      const storage = FlutterSecureStorage();
      try {
        await storage.write(key: 'id', value: idUser);
      } on Exception catch (e) {}
    } else {
      await prefs.setString('id', idUser);
    }
  }
}
