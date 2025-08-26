import 'dart:core';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/feature/task/data/model/task_model.dart';

class TaskRepo {
  TaskRepo();
  Future<Either<String, TaskModel>> addTask(TaskModel task) async {
    try {
      final docRef = FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('tasks')
          .doc();

      final taskWithId = TaskModel(
        taskId: docRef.id,
        title: task.title,
        description: task.description,
        group: task.group,
        endTime: task.endTime,
        userId: task.userId,
        isDone: task.isDone,
        status: task.status,
      );

      await docRef.set(taskWithId.toMap());

      log('task added: ${taskWithId.toMap()}');

      return right(taskWithId);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, List<TaskModel>>> getTodayTasks({
    String? group = "All",
    String? status = "All",
  }) async {
    try {
      final now = DateTime.now();
      final startOfDay = DateTime(now.year, now.month, now.day, 0, 0, 0);
      final endOfDay = DateTime(now.year, now.month, now.day, 23, 59, 59);

      var query = FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('tasks')
          .where('endTime', isGreaterThanOrEqualTo: startOfDay)
          .where('endTime', isLessThanOrEqualTo: endOfDay);

      if (group != "All") query = query.where('group', isEqualTo: group);

      if (status != "All") query = query.where('status', isEqualTo: status);

      final snapshot = await query.get();

      final tasks = snapshot.docs
          .map((doc) => TaskModel.fromMap(doc.data()))
          .toList();

      return right(tasks);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, List<TaskModel>>> getTasks() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('tasks')
          .get();

      final tasks = snapshot.docs
          .map((doc) => TaskModel.fromMap(doc.data()))
          .toList();

      return right(tasks);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, void>> updateTask(TaskModel task) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(task.userId)
          .collection('tasks')
          .doc(task.taskId)
          .update(task.toMap());
      return Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, void>> deleteTask(String taskId) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('tasks')
          .doc(taskId)
          .delete();
      return Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
