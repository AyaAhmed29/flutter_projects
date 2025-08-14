import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/feature/auth/domain/repos/auth_repo.dart';
import 'package:todo_app/feature/auth/presentation/cubit/sign_up_cubit/sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpitial());

  final AuthRepo authRepo;
  Future<void> register(String email, String pass) async {
    emit(SignUpLoading());

    try {
      final user = await authRepo.register(email, pass);
      emit(SignUpSuccess(user));
    } catch (e) {
      emit(SignUpFailure(e.toString()));
    }
  }
}
