import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/feature/task/view/widgets/custom_task_field.dart';
import 'package:todo_app/generated/l10n.dart';
import 'package:todo_app/feature/task/cubit/task_cubit.dart';
import 'package:todo_app/feature/task/cubit/task_state.dart';

class CustomDateTimePicker extends StatelessWidget {
  const CustomDateTimePicker({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        return CustomTaskField(
          readOnly: true,
          onTap: () async {
            final DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2025),
              lastDate: DateTime(2100),
            );

            if (pickedDate == null) return;

            final TimeOfDay? pickedTime = await showTimePicker(
              initialTime: TimeOfDay.now(),
              context: context,
            );

            if (pickedTime == null) return;

            final newDateTime = DateTime(
              pickedDate.year,
              pickedDate.month,
              pickedDate.day,
              pickedTime.hour,
              pickedTime.minute,
            );

            TaskCubit.get(context).setEndTime(newDateTime);

            controller.text = DateFormat(
              "d MMMM, y     h:mm a",
            ).format(newDateTime);
          },
          text: controller.text.isEmpty
              ? S.of(context).EndTime
              : controller.text,
          prefixIcon: Assets.assetsImagesIconsCalendar,
          controller: controller,
        );
      },
    );
  }
}
