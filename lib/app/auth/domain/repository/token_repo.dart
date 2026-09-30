abstract class TokenRepo {
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  });
  Future<String?> getRefreshToken();
  Future<String?> getAccessToken();
  Future<void> clearTokens();
}
