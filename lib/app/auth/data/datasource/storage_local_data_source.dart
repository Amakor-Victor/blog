import 'package:blog/app/auth/domain/repository/token_repo.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage extends TokenRepo {
  final _storage = const FlutterSecureStorage();
  final String _accessToken = 'AccessToken';
  final String _refreshToken = 'RefreshToken';

  @override
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await _storage.write(key: _accessToken, value: accessToken);
    await _storage.write(key: _refreshToken, value: refreshToken);
  }

  @override
  Future<String?> getAccessToken() async {
    final token = await _storage.read(key: _accessToken);
    return token;
  }

  @override
  Future<String?> getRefreshToken() async {
    final token = await _storage.read(key: _refreshToken);
    return token;
  }

  @override
  Future<void> clearTokens() async {
    await _storage.deleteAll();
  }
}
