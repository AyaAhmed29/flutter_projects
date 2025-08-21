import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/feature/task/data/model/task_model.dart';

class HomeRepo {
  HomeRepo();

  Stream<Either<String, List<TaskModel>>> getTasks() {
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
}
