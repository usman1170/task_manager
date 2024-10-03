import 'package:task_manager/domain/models/notification_model.dart';
import 'package:task_manager/domain/models/task_model.dart';

List<TaskModel> tasks = [
  TaskModel(
    title: "Yasir Broast - UCO Collection",
    description:
        "Go and collect UCO from Yasir Broast and let me know in the form details.",
    status: ["Not Started", "In Progress", "Completed"],
  ),
  TaskModel(
    title: "Cheezious",
    description:
        "Go and collect UCO from Cheezious and let me know in the form details.",
    status: ["Not Started", "In Progress", "Completed"],
  ),
  TaskModel(
    title: "Broadway Pizza",
    description:
        "Go and collect UCO from Broadway Pizza and let me know in the form details.",
    status: ["Not Started", "In Progress", "Completed"],
  ),
];

List<NotificationModel> notifications = [
  NotificationModel(
    title: "Major Zaidi Team",
    subTitle: "Work order",
    status: "Pending",
  ),
  NotificationModel(
    title: "Flutter Team",
    subTitle: "Task manager app",
    status: "Pending",
  ),
];
