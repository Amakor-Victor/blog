class AuthRemoteDatasource {
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    // throw Exception('networkNotAvailable');
    return {
      'email': 'victoramakor2@gmail.com',
      'id': 2321,
      'isActive': 'isActive',
      'role': 'role',
      'username': 'username',
    };
  }
}
