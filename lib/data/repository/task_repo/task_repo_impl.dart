import 'package:task_manager/data/services/mock_data.dart';
import 'package:task_manager/data/repository/task_repo/task_repository.dart';
import 'package:task_manager/domain/models/task_model.dart';

class MockTaskRepository implements TaskRepository {
  @override
  Future<List<TaskModel>> getTasks() async {
    return tasks;
  }
}
