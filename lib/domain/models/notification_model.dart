import 'dart:convert';

class NotificationModel {
  final String title;
  final String subTitle;
  final String status;
  NotificationModel({
    required this.title,
    required this.subTitle,
    required this.status,
  });

  NotificationModel copyWith({
    String? title,
    String? subTitle,
    String? status,
  }) {
    return NotificationModel(
      title: title ?? this.title,
      subTitle: subTitle ?? this.subTitle,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'subTitle': subTitle,
      'status': status,
    };
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      title: map['title'] as String,
      subTitle: map['subTitle'] as String,
      status: map['status'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory NotificationModel.fromJson(String source) =>
      NotificationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'NotificationModel(title: $title, subTitle: $subTitle, status: $status)';
}
