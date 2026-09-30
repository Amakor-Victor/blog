class AuthRemoteDatasource {
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    return {
      'email': '',
      'id': 2321,
      'isActive': 'isActive',
      'role': 'role',
      'username': 'username',
    };
  }
}
