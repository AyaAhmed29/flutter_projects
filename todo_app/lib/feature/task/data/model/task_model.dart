import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  final String? taskId;
  final String title;
  final String description;
  final String group;
  final DateTime endTime;
  final String userId;
  final bool isDone;
  final String status;


  TaskModel({
    this.taskId,
    required this.title,
    required this.description,
    required this.group,
    required this.endTime,
    required this.userId,
    this.isDone = false,
  required  this.status ,
  });

  Map<String, dynamic> toMap() {
    return {
      'taskId': taskId,
      'title': title,
      'description': description,
      'group': group,
      'endTime': endTime,
      'userId': userId,
      'isDone': isDone,
      'status': status,
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
      isDone: map['isDone'] ?? false,
      status: getstatus(endTime: (map['endTime'] as Timestamp).toDate(), isDone: map['isDone'] ?? false),
    );
  }

  TaskModel copyWith({
    String? taskId,
    String? title,
    String? description,
    String? group,
    DateTime? endTime,
    String? status,
    bool? isDone,
  }) {
    return TaskModel(
      taskId: taskId ?? this.taskId,
      title: title ?? this.title,
      description: description ?? this.description,
      group: group ?? this.group,
      endTime: endTime ?? this.endTime,
      userId: userId,
      isDone: isDone ?? this.isDone,
      status: status ?? this.status,
    );
  }

}

  String getstatus( {required DateTime endTime, bool isDone =false }) {
    if (isDone) {
      return 'Done';
    } else if (endTime.isBefore(DateTime.now())) {
      return 'Missed';
    } else {
      return 'In Progress';
    }
  }