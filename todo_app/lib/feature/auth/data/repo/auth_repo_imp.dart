
import 'package:todo_app/core/service/firebase_auth_servise.dart';
import 'package:todo_app/feature/auth/domain/entites/user_entity.dart';
import 'package:todo_app/feature/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImpl(this.firebaseAuthService);

  @override
  Future<UserEntity> signIn(String email, String password) async {
    final user = await firebaseAuthService.signIn(email, password);
    return UserEntity(
      uid: user.uid,
      name: user.displayName ?? '',
      email: user.email ?? '',
    );
  }
  
  @override
  Future<UserEntity> register(String email, String password) async {
   final user = await firebaseAuthService.register(email, password);
    return UserEntity(
      uid: user.uid,
      name: user.displayName ?? '',
      email: user.email ?? '',
    );
}}
