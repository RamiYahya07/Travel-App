import 'package:bloc/bloc.dart';
import 'package:travel_app/features/auth/data/repositories/auth_repostiory.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository repository;

  LoginCubit(this.repository) : super(LoginInitial());

  /// Log in the user and store access token in SecureStorage
  Future<void> login({
    required String username,
    required String password,
  }) async {
    emit(LoginLoading());

    try {

      await repository.login(username: username, password: password);

      emit(LoginSuccess());
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }

  /// Log out user
  Future<void> logout() async {
    await repository.logout();
    emit(LoginInitial());
  }
}
