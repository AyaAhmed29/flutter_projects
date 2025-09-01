import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/feature/auth/data/model/user_model.dart';
import 'package:todo_app/feature/task/data/model/task_model.dart';

class HomeRepo {
  HomeRepo();

  Stream<Either<String, List<TaskModel>>> getTasks() {
    getAndUpdateMissedTasks();

    final uid = FirebaseAuth.instance.currentUser!.uid;

    return FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('tasks')
        .snapshots()
        .map((snapshot) {
          try {
            final tasks = snapshot.docs
                .map((doc) => TaskModel.fromMap(doc.data()))
                .toList();
            return Right<String, List<TaskModel>>(tasks);
          } catch (e) {
            return Left<String, List<TaskModel>>(e.toString());
          }
        });
  }

  Future<Either<String, UserModel>> getUser() async {
    try {
      var data = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
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
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, List<TaskModel>>> getAndUpdateMissedTasks() async {
    try {
      final now = Timestamp.now();

      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('tasks')
          .where('status', isEqualTo: 'In Progress')
          .where('endTime', isLessThan: now)
          .get();

      List<TaskModel> tasks = [];
      final batch = FirebaseFirestore.instance.batch();

      for (var doc in snapshot.docs) {
        var task = TaskModel.fromMap(doc.data());
        batch.update(doc.reference, {'status': "Missed"});
        tasks.add(task);
      }

      await batch.commit();

      return right(tasks);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, List<TaskModel>>> getTasksInProgress() async {
    try {
      await getAndUpdateMissedTasks();
      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('tasks')
          .where('status', isEqualTo: 'In Progress')
          .get();

      final tasks = snapshot.docs
          .map((doc) => TaskModel.fromMap(doc.data()))
          .toList();

      return right(tasks);
    } catch (e) {
      return left(e.toString());
    }
  }
}
