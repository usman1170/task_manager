import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/config/colors.dart';
import 'package:task_manager/main.dart';
import 'package:task_manager/view_models/home_view_model.dart';
import 'package:task_manager/views/home_view/widgets/cost_quantity_widget.dart';
import 'package:task_manager/views/home_view/widgets/daily_task_widget.dart';
import 'package:task_manager/views/home_view/widgets/main_header.dart';
import 'package:task_manager/views/home_view/widgets/notification_widget.dart';
import 'package:task_manager/views/home_view/widgets/select_month_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    final viewModel = Provider.of<HomeViewModel>(context, listen: false);
    viewModel.loadDashboardData();
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      body: Consumer<HomeViewModel>(builder: (context, viewModel, child) {
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: mq.height * .032),
              MainHeaderWidget(
                notifications: viewModel.notifications.length.toString(),
              ),
              const Divider(
                color: lightGrey,
                indent: 14,
                endIndent: 14,
              ),
              SelectMonthRowWidget(
                ontap: () {},
              ),
              const SizedBox(height: 8),
              const CostQuantityWidget(),
              const SizedBox(height: 14),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Daily Tasks",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(width: 12),
                        Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            color: orange,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              viewModel.tasks.length.toString(),
                              style: const TextStyle(color: white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: InkWell(
                        onTap: () {},
                        child: const Text(
                          "View all",
                          style: TextStyle(color: darkGrey),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              Container(
                height: mq.height * .4,
                margin: const EdgeInsets.symmetric(horizontal: 14),
                padding: const EdgeInsets.only(left: 18, right: 18, bottom: 18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: grey),
                ),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: viewModel.tasks.length,
                  itemBuilder: (context, index) {
                    final task = viewModel.tasks[index];
                    return DailyTaskWidget(
                      title: task.title,
                      description: task.description,
                      status: task.status[index],
                      index: index,
                    );
                  },
                ),
              ),
              SizedBox(height: mq.height * .02),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Notifications",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(width: 12),
                        Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            color: orange,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              viewModel.notifications.length.toString(),
                              style: const TextStyle(color: white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: InkWell(
                        onTap: () {},
                        child: const Text(
                          "View all",
                          style: TextStyle(color: darkGrey),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: mq.height * .32,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    final notification = viewModel.notifications[index];
                    return NotificationWidget(
                      title: notification.title,
                      subTitle: notification.subTitle,
                      status: notification.status,
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      }),
    );
  }
}
