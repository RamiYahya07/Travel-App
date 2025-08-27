import 'package:travel_app/core/constants.dart';
import 'package:travel_app/core/services/api.dart';

class AuthApiService {
  final Api api;

  AuthApiService(this.api);

  Future<dynamic> register({
    required String username,
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    final url = '$kBaseUrl/register/';
    final body = {
      'username': username,
      'email': email,
      'password': password,
      'first_name': firstName,
      'last_name': lastName,
    };
    return await api.post(url: url, body: body, token: null);
  }

Future<dynamic> login({
  required String username,
  required String password,
}) async {
  final url = '$kBaseUrl/login/';
  final body = {
    'username': username,
    'password': password,
  };
  return await api.post(url: url, body: body, token: null);
}

}
