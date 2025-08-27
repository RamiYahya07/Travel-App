import 'package:bloc/bloc.dart';
import 'package:travel_app/features/auth/data/repositories/auth_repostiory.dart';
import 'register_state.dart';


class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepository repository;

  RegisterCubit(this.repository) : super(RegisterInitial());

  Future<void> register({
    required String username,
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    emit(RegisterLoading());
    try {
      await repository.register(
        username: username,
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
      );
      emit(RegisterSuccess('Registration successful'));
    } catch (e) {
      emit(RegisterFailure(e.toString()));
    }
  }
}
