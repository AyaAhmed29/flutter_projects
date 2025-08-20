import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/feature/task/data/model/task_model.dart';

class TaskRepo {
  TaskRepo();
  Future<Either<String, TaskModel>> addTask(TaskModel task) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('tasks')
          .add(task.toMap());
      return right(task);
    } catch (e) {
      return left(e.toString());
    }
  }

  Stream<Either<String, List<TaskModel>>> fetchTasks(String userId) {
    try {
      return FirebaseFirestore.instance
          .collection('tasks')
          .where('userId', isEqualTo: userId)
          .snapshots()
          .map(
            (snapshot) => right(
              snapshot.docs
                  .map((doc) => TaskModel.fromMap(doc.data()))
                  .toList(),
            ),
          );
    } catch (e) {
      return Stream.value(left(e.toString()));
    }
  }
}
