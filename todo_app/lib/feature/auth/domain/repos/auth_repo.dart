import 'package:todo_app/feature/auth/domain/entites/user_entity.dart';

abstract class AuthRepo {
  Future<UserEntity> login(String email, String password);
  Future<UserEntity> register(String email, String password);
}
