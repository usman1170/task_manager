import 'package:task_manager/domain/models/task_model.dart';

abstract class TaskRepository {
  Future<List<TaskModel>> getTasks();
}
