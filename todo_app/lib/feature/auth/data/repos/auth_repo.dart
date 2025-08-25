import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/feature/auth/data/model/user_model.dart';

class AuthRepo {
  AuthRepo();
Future<Either<String, UserModel>> login({required String email,required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      var data = await FirebaseFirestore.instance
          .collection('users')
          .doc(credential.user!.uid)
          .get();
      UserModel user = UserModel.fromJson(data.data()!);
      
      return right(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return left('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        return left('Wrong password provided for that user.');
      } else {
        return left(e.code);
      }
    }
  }

  Future<Either<String, UserModel>> register(
    String email,
    String password,
    String name,
    String? image, 
  ) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      UserModel user = UserModel(
        userName: name,
        uid: credential.user!.uid,
        email: email,
        image: image,
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .set(user.toJson());

      // if (!user.) {
      //   await user.sendEmailVerification();
      //   await FirebaseAuth.instance.signOut();
      //   return left('Check your email to verify your account.');
      // }

      return right(UserModel(uid: user.uid, email: user.email, userName: name));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return left('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        return left('The account already exists for that email.');
      }
      return left(e.code);
    } catch (e) {
      return left(e.toString());
    }
  }
}
