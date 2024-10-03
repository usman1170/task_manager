import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/main.dart';
import 'package:task_manager/view_models/select_month_viewmodel.dart';

class SelectMonthRowWidget extends StatelessWidget {
  const SelectMonthRowWidget({
    super.key,
    required this.ontap,
  });
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      child: SizedBox(
        width: mq.width,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "My Teams's Collections",
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SelectMonthDropDown()
          ],
        ),
      ),
    );
  }
}

class SelectMonthDropDown extends StatelessWidget {
  const SelectMonthDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    // final monthViewModel = Provider.of<MonthViewModel>(context);
    return Consumer<MonthViewModel>(builder: (context, monthViewModel, child) {
      return Container(
        height: mq.height * .052,
        width: mq.width * .26,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black54),
          borderRadius: BorderRadius.circular(10),
        ),
        child: DropdownButton<String>(
          value: monthViewModel.selectedMonth,
          icon: const Icon(Icons.arrow_drop_down_outlined, size: 20),
          underline: const SizedBox(),
          isExpanded: true,
          items: monthViewModel.months.map((String month) {
            return DropdownMenuItem<String>(
              value: month,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  month,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 13),
                ),
              ),
            );
          }).toList(),
          onChanged: (newValue) {
            if (newValue != null) {
              monthViewModel.setSelectedMonth(newValue);
            }
          },
        ),
      );
    });
  }
}
