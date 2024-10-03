import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/data/repository/notification_repo/notification_repo_impl.dart';
import 'package:task_manager/data/repository/select_month_repo/month_repo.dart';
import 'package:task_manager/data/repository/task_repo/task_repo_impl.dart';
import 'package:task_manager/view_models/home_view_model.dart';
import 'package:task_manager/view_models/select_month_viewmodel.dart';
import 'package:task_manager/views/home_view/home_screen.dart';

void main() {
  runApp(const MyApp());
}

late Size mq;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => HomeViewModel(
                  taskRepository: MockTaskRepository(),
                  notificationRepository: MockNotificationRepository(),
                )),
        ChangeNotifierProvider(
            create: (_) => MonthViewModel(
                  monthRepository: MockMonthRepository(),
                )),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
          ),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
      ),
    );
  }
}
