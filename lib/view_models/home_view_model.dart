import 'package:flutter/material.dart';
import 'package:task_manager/data/repository/notification_repo/notification_repository.dart';
import 'package:task_manager/data/repository/task_repo/task_repository.dart';
import 'package:task_manager/domain/models/notification_model.dart';
import 'package:task_manager/domain/models/task_model.dart';

class HomeViewModel extends ChangeNotifier {
  final TaskRepository _taskRepository;
  final NotificationRepository _notificationRepository;

  HomeViewModel({
    required TaskRepository taskRepository,
    required NotificationRepository notificationRepository,
  })  : _taskRepository = taskRepository,
        _notificationRepository = notificationRepository;

  List<TaskModel> _tasks = [];
  List<TaskModel> get tasks => _tasks;

  List<NotificationModel> _notifications = [];
  List<NotificationModel> get notifications => _notifications;

  Future<void> loadDashboardData() async {
    _tasks = await _taskRepository.getTasks();
    _notifications = await _notificationRepository.getNotifications();
    notifyListeners();
  }

  void updateStatus(String status, String taskTitle) {
    for (var task in _tasks) {
      if (task.title == taskTitle) {
        task.status[0] = status;
        notifyListeners();
        break;
      }
    }
    notifyListeners();
  }
}
