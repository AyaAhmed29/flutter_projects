import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/feature/auth/data/model/user_model.dart';

class AuthRepo {
  AuthRepo();
  Future< Either<String,UserModel>>login(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(UserModel(
        userName: credential.user!.displayName ?? '',
        email: email,
        uid: credential.user!.uid,
      ));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return left('No user found for that Username.');
      } else if (e.code == 'wrong-password') {
        return left('Wrong password provided for that user.');
      } else {
        return left(e.code);
      }
    }
  }

  Future<Either<String, UserModel>> register(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return right(UserModel(
        userName: credential.user!.displayName ?? '',
        email: email,
        uid: credential.user!.uid,
      ));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return left('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        return left('The account already exists for that Username.');
      }
      throw (e.code);
    } catch (e) {
      rethrow;
    }
  }
}
