import 'package:flutter/material.dart';
import 'package:task_manager/config/colors.dart';
import 'package:task_manager/main.dart';
import 'package:task_manager/views/home_view/widgets/graph.dart';

class CostQuantityWidget extends StatelessWidget {
  const CostQuantityWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: grey),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: black87,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "My Team's Collections",
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: cyan,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "My Collections",
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(color: lightGrey),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            child: const CircularGraph(),
          ),
          const SizedBox(height: 12),
          const Divider(color: lightGrey),
          const SizedBox(height: 12),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CostWidget(
                cost: '250',
                label: "Total Cost Per Kg",
                costColor: black87,
                isTotal: false,
              ),
              CostWidget(
                cost: '2500',
                label: "Total Cost Per Kg",
                costColor: cyan,
                isTotal: false,
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(color: lightGrey),
          const SizedBox(height: 12),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CostWidget(
                  cost: '250',
                  label: "Total Quantity",
                  costColor: black87,
                  isTotal: true,
                ),
                CostWidget(
                  cost: '2500',
                  label: "Total Quantity",
                  costColor: cyan,
                  isTotal: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CostWidget extends StatelessWidget {
  const CostWidget({
    super.key,
    required this.cost,
    required this.label,
    required this.costColor,
    required this.isTotal,
  });

  final String cost;
  final String label;
  final Color costColor;
  final bool isTotal;
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          isTotal ? "$cost kg" : "$cost/kg",
          style: TextStyle(
            fontSize: 18,
            color: costColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            color: darkGrey,
          ),
        ),
      ],
    );
  }
}
