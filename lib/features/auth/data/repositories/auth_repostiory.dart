import '../services/auth_api_service.dart';

class AuthRepository {
  final AuthApiService apiService;

  AuthRepository(this.apiService);

  Future<void> register({
    required String username,
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    final response = await apiService.register(
      username: username,
      email: email,
      password: password,
      firstName: firstName,
      lastName: lastName,
    );

    if (response is String) {
      throw Exception(response);
    }
  }

 Future<Map<String, dynamic>> login({
  required String username,
  required String password,
}) async {
  final response = await apiService.login(username: username, password: password);

  if (response is String) throw Exception(response);

  return response;
}

}
