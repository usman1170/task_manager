import 'package:task_manager/data/services/month.dart';

abstract class MonthRepository {
  List<String> getMonths();
}

class MockMonthRepository implements MonthRepository {
  @override
  List<String> getMonths() {
    return monthList;
  }
}
