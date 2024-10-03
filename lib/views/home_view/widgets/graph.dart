import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:task_manager/config/colors.dart';

class CircularGraph extends StatelessWidget {
  const CircularGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircularPercentIndicator(
          animation: true,
          animationDuration: 300,
          radius: 100.0,
          lineWidth: 8.0,
          percent: 0.7,
          center: const Text(
            "UCO\nCollection",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          backgroundColor: lightGrey,
          progressColor: black87,
          circularStrokeCap: CircularStrokeCap.round,
          startAngle: 180,
        ),
        Positioned(
          left: 25,
          top: 25,
          child: CircularPercentIndicator(
            animation: true,
            animationDuration: 300,
            radius: 75.0,
            lineWidth: 8.0,
            percent: 0.8,
            backgroundColor: lightGrey,
            progressColor: cyan,
            circularStrokeCap: CircularStrokeCap.round,
            startAngle: 180,
          ),
        ),
      ],
    );
  }
}
