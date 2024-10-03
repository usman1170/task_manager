import 'dart:convert';

class TaskModel {
  final String title;
  final String description;
  final List<String> status;

  TaskModel({
    required this.title,
    required this.description,
    required this.status,
  });

  TaskModel copyWith({
    String? title,
    String? description,
    List<String>? status,
  }) {
    return TaskModel(
      title: title ?? this.title,
      description: description ?? this.description,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'status': status,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      title: map['title'] as String,
      description: map['description'] as String,
      status: List<String>.from(map['status']),
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) =>
      TaskModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'TaskModel(title: $title, description: $description, status: $status)';
}
