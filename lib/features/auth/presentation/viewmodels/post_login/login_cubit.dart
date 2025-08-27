import 'package:bloc/bloc.dart';
import 'package:travel_app/features/auth/data/repositories/auth_repostiory.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository repository;

  LoginCubit(this.repository) : super(LoginInitial());

  Future<void> login({
    required String username,
    required String password,
  }) async {
    emit(LoginLoading());

    try {
      final response = await repository.login(
        username: username,
        password: password,
      );

      if (response.containsKey('access') &&
          response.containsKey('refresh') &&
          response.containsKey('user')) {
        emit(LoginSuccess(
          accessToken: response['access'],
          refreshToken: response['refresh'],
          user: response['user'],
        ));
      } else {
        emit(const LoginFailure('Invalid response from server'));
      }
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }

  void logout() {
    emit(LoginInitial());
  }
}
