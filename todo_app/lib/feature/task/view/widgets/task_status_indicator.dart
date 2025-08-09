import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_style.dart';
import 'package:todo_app/feature/home/view/widgets/number_container.dart';

class TaskStatusIndicator extends StatelessWidget {
  const TaskStatusIndicator({super.key, required this.text, required this.number});
  final String text;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Text(text, style: AppStyle.light14),
          SizedBox(width: 30),
          NumberContainer(number: number, color: AppColors.primaryColor),
        ],
      ),
    );
  }
}
