import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class TaskModel {
  final String title;
  final String description;
  final String group;
  final DateTime endTime;
  final String userId;
  final bool isDone;

  TaskModel({
    required this.title,
    required this.description,
    required this.group,
    required this.endTime,
    required this.userId,
    this.isDone = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'group': group,
      'endTime': endTime,
      'userId': userId,
      'isDone': isDone,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      title: map['title'],
      description: map['description'],
      group: map['group'],
      endTime: (map['endTime'] as Timestamp).toDate(),
      userId: map['userId'],
      isDone: map['isDone'] ?? false,
    );
  }

  String get status {
    if (isDone) return "Done";
    if (endTime.isBefore(DateTime.now())) return "Missed";
    return "In Progress";
  }

  String get formattedEndTime {
    return DateFormat('d MMMM, y     h:mm a').format(endTime);
  }
}
