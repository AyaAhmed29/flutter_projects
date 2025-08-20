class TaskModel {
  final String title;
  final String description;
  final String group;
  final DateTime endTime;
  final String userId;

  TaskModel({
    required this.title,
    required this.description,
    required this.group,
    required this.endTime,
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'group': group,
      'endTime': endTime.toIso8601String(),
      'userId': userId,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      title: map['title'],
      description: map['description'],
      group: map['group'],
      endTime: DateTime.parse(map['endTime']),
      userId: map['userId'],
    );
  }
}
