import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/config/colors.dart';
import 'package:task_manager/data/services/task_status.dart';
import 'package:task_manager/view_models/home_view_model.dart';

class DailyTaskWidget extends StatelessWidget {
  const DailyTaskWidget({
    super.key,
    required this.title,
    required this.description,
    required this.status,
    required this.index,
  });

  final String title;
  final String description;
  final String status;
  final int index;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: mq.height * .07,
              width: mq.width * .14,
              decoration: BoxDecoration(
                border: Border.all(color: black54),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Icon(
                  Icons.file_open_sharp,
                  size: mq.height * .04,
                ),
              ),
            ),
            const SizedBox(width: 12),
            SizedBox(
              width: mq.width * .4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: title,
                          style: const TextStyle(
                            color: black87,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const TextSpan(
                          text: " - UCO Collection",
                          style: TextStyle(
                            color: darkGrey,
                          ),
                        ),
                      ],
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: darkGrey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            TaskStatusDropdown(
              title: title,
              initialStatus: status,
            )
          ],
        ),
        Visibility(
          visible: index != 2,
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Divider(color: lightGrey),
          ),
        ),
      ],
    );
  }
}

class TaskStatusDropdown extends StatelessWidget {
  const TaskStatusDropdown({
    super.key,
    required this.title,
    required this.initialStatus,
  });

  final String title;
  final String initialStatus;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    return Consumer<HomeViewModel>(builder: (context, homeViewModel, child) {
      final task = homeViewModel.tasks.firstWhere((task) =>
          task.title.toLowerCase().trim() == title.toLowerCase().trim());
      final currentStatus =
          task.status.isNotEmpty ? task.status.first : "Status";

      return Container(
        height: mq.height * .052,
        width: mq.width * .21,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black54),
          borderRadius: BorderRadius.circular(10),
        ),
        child: DropdownButton<String>(
          value: currentStatus.isNotEmpty ? currentStatus : "Status",
          icon: const Icon(Icons.arrow_drop_down_outlined, size: 20),
          underline: const SizedBox(),
          isExpanded: true,
          items: statusList.map((String status) {
            return DropdownMenuItem<String>(
              value: status,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  status,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 13),
                ),
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            if (newValue != null) {
              homeViewModel.updateStatus(newValue, title);
            }
          },
        ),
      );
    });
  }
}
