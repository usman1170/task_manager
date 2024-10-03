import 'package:flutter/material.dart';
import 'package:task_manager/data/repository/select_month_repo/month_repo.dart';

class MonthViewModel extends ChangeNotifier {
  final MonthRepository monthRepository;

  MonthViewModel({required this.monthRepository}) {
    _months = monthRepository.getMonths();
  }

  List<String> _months = [];
  List<String> get months => _months;

  String _selectedMonth = "Select Month";
  String get selectedMonth => _selectedMonth;

  void setSelectedMonth(String month) {
    _selectedMonth = month;
    notifyListeners();
  }
}
