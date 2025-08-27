import 'package:travel_app/core/utils/secure_storage.dart';

import '../services/auth_api_service.dart';

class AuthRepository {
  final AuthApiService apiService;

  AuthRepository(this.apiService);
//register
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
//login
 Future<void> login({
  required String username,
  required String password,
}) async {
  final response = await apiService.login(username: username, password: password);

if (response is String) {
      throw Exception(response);
    }

final accessToken = response['access'];
    if (accessToken != null) {
      await SecureStorage.writeToken("access", accessToken);
    } else {
      throw Exception("No access token received");
    }
    
}
//logout
Future<void> logout() async {
    await SecureStorage.deleteToken("access");
  }

}
