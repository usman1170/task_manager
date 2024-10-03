import 'package:flutter/material.dart';
import 'package:task_manager/config/colors.dart';
import 'package:task_manager/main.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.status,
  });
  final String title;
  final String subTitle;
  final String status;

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(left: 14, right: 14, bottom: 14),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: grey),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: mq.height * .06,
            width: mq.width * .12,
            decoration: BoxDecoration(
              border: Border.all(color: black54),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Icon(
                Icons.group_sharp,
                size: mq.height * .04,
              ),
            ),
          ),
          const SizedBox(width: 12),
          SizedBox(
            width: mq.width * .26,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subTitle,
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: darkGrey,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 6),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: orange),
                child: Text(
                  status,
                  style: const TextStyle(fontSize: 12, color: white),
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  decoration: BoxDecoration(
                    border: Border.all(color: black54),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    "View Order",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
