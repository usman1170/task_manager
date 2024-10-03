import 'package:flutter/material.dart';
import 'package:task_manager/config/colors.dart';
import 'package:task_manager/main.dart';

class MainHeaderWidget extends StatelessWidget {
  const MainHeaderWidget({
    super.key,
    required this.notifications,
  });
  final String notifications;

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(left: 14, right: 4, top: 12),
      width: mq.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello Employes!",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "See today’s performance",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                child: Container(
                  height: mq.height * .06,
                  width: mq.width * .12,
                  decoration: BoxDecoration(
                    border: Border.all(color: black54),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Icon(Icons.notifications),
                  ),
                ),
              ),
              Positioned(
                right: 4,
                top: 2,
                child: Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: orange,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      notifications,
                      style: const TextStyle(color: white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
