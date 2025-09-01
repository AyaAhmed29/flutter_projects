import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TaskModel {
  final String? taskId;
  final String title;
  final String description;
  final String group;
  final DateTime endTime;
  final String userId;
  // final bool isDone;
  final String status;
  final String? imageUrl;

  TaskModel({
    this.imageUrl,
    this.taskId,
    required this.title,
    required this.description,
    required this.group,
    required this.endTime,
    required this.userId,
    // this.isDone = false,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'taskId': taskId,
      'title': title,
      'description': description,
      'group': group,
      'endTime': endTime,
      'userId': userId,
      // 'isDone': isDone,
      'status': status,
      'imageUrl': imageUrl,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map, {String? id}) {
    return TaskModel(
      taskId: id ?? map['taskId'],
      title: map['title'],
      description: map['description'],
      group: map['group'],
      endTime: (map['endTime'] as Timestamp).toDate(),
      userId: map['userId'],
      // isDone: map['isDone'] ?? false,
      status: getstatus(
        endTime: (map['endTime'] as Timestamp).toDate(),
        // isDone: map['isDone'] ?? false,
      ),
      imageUrl: map['imageUrl'],
    );
  }

  TaskModel copyWith({
    String? taskId,
    String? title,
    String? description,
    String? group,
    DateTime? endTime,
    String? status,
    // bool? isDone,
    String? imageUrl,
  }) {
    return TaskModel(
      taskId: taskId ?? this.taskId,
      title: title ?? this.title,
      description: description ?? this.description,
      group: group ?? this.group,
      endTime: endTime ?? this.endTime,
      userId: userId,
      // isDone: isDone ?? this.isDone,
      status: status ?? this.status,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}

Future<Either<String, List<TaskModel>>> getTasksInProgress() async {
  try {
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

String getstatus({required DateTime endTime, bool isDone = false}) {
  if (endTime.isBefore(DateTime.now())) {
    return 'Missed';
  } else {
    return 'In Progress';
  }
}
