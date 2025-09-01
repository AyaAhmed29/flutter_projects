import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_colors.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    required this.onConfirm,
    required this.title,
    required this.content,
  });

  final String title;
  final VoidCallback onConfirm;
  final String content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                "No",
                style: TextStyle(color: AppColors.primaryColor),
              ),
            ),
            TextButton(
              onPressed: () {
                onConfirm();
                Navigator.of(context).pop();
              },
              child: Text("Yes", style: TextStyle(color: AppColors.errorColor)),
            ),
          ],
        ),
      ],
    );
  }
}
