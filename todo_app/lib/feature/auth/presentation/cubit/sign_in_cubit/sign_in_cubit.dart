import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/feature/auth/domain/repos/auth_repo.dart';
import 'package:todo_app/feature/auth/presentation/cubit/sign_in_cubit/sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepo) : super(SignInitial());

  final AuthRepo authRepo;
  Future<void> login(String email, String pass) async {
    emit(SignInLoading());
    try {
      final user = await authRepo.signIn(email, pass);
      emit(SignInSuccess(user));
    } catch (e) {
      emit(SignInFailure(e.toString()));
    }
  }
}
