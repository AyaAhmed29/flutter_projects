import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_style.dart';

class NumberContainer extends StatelessWidget {
  const NumberContainer({super.key, required this.number, required this.color});
  final int number;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: color.withValues(alpha: 0.15),
      ),
      child: Center(
        child: Text("$number", style: AppStyle.light12.copyWith(color: color)),
      ),
    );
  }
}
