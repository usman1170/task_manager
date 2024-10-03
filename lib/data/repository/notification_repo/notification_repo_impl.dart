import 'package:task_manager/data/services/mock_data.dart';
import 'package:task_manager/data/repository/notification_repo/notification_repository.dart';
import 'package:task_manager/domain/models/notification_model.dart';

class MockNotificationRepository implements NotificationRepository {
  @override
  Future<List<NotificationModel>> getNotifications() async {
    return notifications;
  }
}
